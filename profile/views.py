from django.shortcuts import render, get_object_or_404
from django.conf import settings
from .forms import Search, CustomerAddress, SignUpForm, CheckOut
from .models import Customer, Basket, Address, Order, OrderProduct
from django.shortcuts import redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
import stripe
from util import tools
from shop.models import Product
# Create your views here.
# stripe payment
stripe.api_key = settings.STRIPE_SECRET_KEY


@login_required(login_url='Login')
def dashboard(request):
    """:synopsis: Permet de générer la page DashBoard si request = GET
           :param request: La requete du client de type GET
           :type request: djangoRequest
           :return: le template + le context -> générer au final une page html
                  """
    context = tools.mergeDict({'search': Search(), "basketCount": tools.basketCount(request)},
                              {"emailNewsLetter": request.session.get('emailNewsLetter')})
    request.session['emailNewsLetter'] = ""
    return render(request, 'dashboard.html', context)


def register(request):
    """:synopsis: Permet de générer la page d'inscription si request = GET si requete = POST permet de creer un nouveau
                  compte Client
       :param request: La requete du client de type GET ou POST
       :type request: djangoRequest
       :return: le template + le context -> générer au final une page html
                      """
    if request.user.is_authenticated:
        return redirect("DashBoard")
    context = {'customer': SignUpForm(),
               'customerAddr': CustomerAddress()}
    if request.method == "POST":
        # request post
        form = SignUpForm(request.POST)
        formRegister = CustomerAddress(request.POST)
        if form.is_valid() and formRegister.is_valid():
            # on insert le nouvelle user dans la base
            form.save()
            # on recupere les donnee du formulaire
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            email = form.cleaned_data.get('email')
            # on récupere l'id de cette utilisateur pour ajouter les donnee dans la table client
            user = get_object_or_404(User, username=username, email=email)
            customer = Customer(user=user,
                                mobile=formRegister.cleaned_data['mobilePhone'],
                                gender=formRegister.cleaned_data['gender'],
                                IsNewsletter=formRegister.cleaned_data["is_newsLetter"])
            customer.save()
            # on connecte l'utilisateur
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            # on redirige vers sont tableau de bord
            return redirect('DashBoard')
        else:
            context["customer"] = SignUpForm(request.POST)
            context["customer"] = SignUpForm(request.POST)
            context['customerAddr'] = CustomerAddress(request.POST)
            context = tools.mergeDict(context, {"emailNewsLetter": request.session.get('emailNewsLetter')})
            request.session['emailNewsLetter'] = ""
    return render(request, 'register.html', context)


@login_required(login_url='Login')
def view_basket(request):
    """:synopsis: Permet de générer la page Basket(Panier client) si request = GET
       :param request: La requete du client de type GET
       :type request: djangoRequest
       :return: le template + le context -> générer au final une page html
                      """
    context = {"basketCount": tools.basketCount(request)}
    product = Basket.objects.filter(customer__user=request.user)
    context["product"] = product
    # on calcule le prix total, le prix ht
    total_ttc = 0
    for item in product:
        total_ttc += float(item.product.price * item.quantity)
    context["totalTTC"] = round(float(total_ttc), 2)
    context["tva"] = round(float(total_ttc * 0.2), 2)
    context["totalHT"] = round(float(total_ttc - context["tva"]), 2)
    context = tools.mergeDict(context, {"emailNewsLetter": request.session.get('emailNewsLetter')})
    request.session['emailNewsLetter'] = ""
    return render(request, 'basket.html', context)


@login_required(login_url='Login')
def view_basket_action(request, product_id, action):
    """:synopsis: Permet de traité les action sur la page Basket(Panier), au final redirige vers la page Basket(Panier)
       :param request: La requete du client de type GET
       :type request: djangoRequest
       :param product_id: L'id du produit a traité
       :type product_id: int
       :param action: Action a effectué sur le produit
       :type action: str
       :return: redirige vers la Page Panier(Basket.html)
                      """
    values = {"delete": lambda: (Basket.objects.filter(product__id=product_id).delete()),
              "addOne": lambda: (Basket.objects.get(product__id=product_id)),
              "takeOffOne": lambda: (Basket.objects.get(product__id=product_id))}
    try:
        item = values[action]()
        if action == 'addOne' or action == 'takeOffOne':
            # si on doit ajouter 1 ba on le fait
            if action == 'takeOffOne':
                print("item = ", item)
                # on enleve 1 a la quantity de produit commander
                if item.quantity == 1:
                    values["delete"]()
                else:
                    item.quantity = (item.quantity - 1)
                    item.save()
            else:
                print("item = ", item)
                # si on peut encore ajouter 1 item
                if item.quantity < item.product.quantity:
                    item.quantity = (item.quantity + 1)
                    item.save()
    except KeyError:
        pass
    return redirect("Basket")


@login_required(login_url='Login')
def view_basket_clean(request):
    """:synopsis: Permet de supprimer tous les article du panier du client
       :param request: La requete du client de type GET
       :type request: djangoRequest
       :return: Redirige vers la Page Panier(Basket.html)
                          """
    Basket.objects.filter(customer__user=request.user).delete()
    return redirect("Basket")


@login_required(login_url='Login')
def view_check_out(request, id_address):
    """:synopsis: Permet de générer la page Checkout(Page de Commande) si request = GET
       :param request: La requete du client de type GET
       :type request: djangoRequest
       :param id_address: l'id de l'addresse a afficher dans le formulaire de Commande
       :param id_address: int
       :return: le template + le context -> générer au final une page html avec le formulaire d'adresse rempli ou non
                          """
    context = {"basketCount": tools.basketCount(request),
               'key': settings.STRIPE_PUBLISHABLE_KEY}
    context = tools.mergeDict(context, tools.checkOutProduct(request))
    context = tools.mergeDict(context, {"emailNewsLetter": request.session.get('emailNewsLetter')})
    request.session['emailNewsLetter'] = ""
    # on verifie qu'il y a bien des produits dans le panier
    if context["product"].count():
        # on verifie si il existe des address
        if context["address"].count():
            try:
                address = Address.objects.get(customer__user=request.user, id=id_address)
                context['CheckOut'] = CheckOut(organizer=address.__dict__)
            except Address.DoesNotExist:
                context['CheckOut'] = CheckOut()
        else:
            context['CheckOut'] = CheckOut()
        return render(request, 'checkout.html', context)
    else:
        return redirect("Basket")


@login_required(login_url='Login')
def view_payment(request):
    """:synopsis: Permet de générer la page Payment(Page de payment) si request = POST sinon
                  redirige vers la page Checkout.
       :param request: La requete du client de type GET ou POST
       :type request: djangoRequest
       :return: si requete POST le template + le context -> générer au final une page html
       :return: si requete GET redirige vers la page de Checkout
                          """
    context = {"basketCount": tools.basketCount(request),
               'key': settings.STRIPE_PUBLISHABLE_KEY}
    context = tools.mergeDict(context, {"emailNewsLetter": request.session.get('emailNewsLetter')})
    request.session['emailNewsLetter'] = ""
    context = tools.mergeDict(context, tools.checkOutProduct(request))
    if request.method == "POST":
        checkout = CheckOut(request.POST)
        context['CheckOut'] = checkout
        if checkout.is_valid():
            # method = request.POST.get("card")
            context['disabled'] = "disabled"
            context["payment"] = """
        <script src="https://checkout.stripe.com/checkout.js" class="stripe-button"
          data-key="{}"
          data-description="eBrocante"
          data-amount="{}"
          data-locale="auto"
          data-label="Payer ma commande"
          data-currency="eur"
          data-image='https://stripe.com/img/documentation/checkout/marketplace.png'></script>
            """.format(context["key"], tools.amount(context["totalTTC"]))
            return render(request, 'checkout.html', context)

        return render(request, 'checkout.html', context)
    else:
        return redirect("CheckOut", id_address=0)


@login_required(login_url='Login')
def view_order_done(request):
    """:synopsis: Permet de générer la page de succes si le payement est passer sinon permet de recharger la page de
                  payment si une erreur c'est produite. En cas de succes cette fonction creer une nouvelle Commande
                  relié aux client dans la base de données, creer aussi une nouvelle Adresse relier au client si
                  l'addresse du formulaire n'existe pas(request = POST).
                  Redirige vers la Page de checkout (request = POST).
       :param request: La requete du client de type GET ou POST
       :type request: djangoRequest
       :return: si requete POST le template + le context -> générer au final une page html
       :return: si requete GET redirige vers la page de Checkout
                              """
    context = {'key': settings.STRIPE_PUBLISHABLE_KEY}
    # fonction qui gere la fin du payement et la creation de la commande
    if request.method == "POST":
        try:
            token = request.POST.get('stripeToken')
            checkout = CheckOut(request.POST)
            context['CheckOut'] = checkout
            if checkout.is_valid():
                print("token = ", token)
                total_ttc = 0
                product = Basket.objects.filter(customer__user=request.user)
                for item in product:
                    total_ttc += float(item.product.price * item.quantity)
                context["totalTTC"] = round(float(total_ttc), 2)
                charge = stripe.Charge.create(
                    amount=tools.amount(context["totalTTC"]),
                    currency='eur',
                    description='Customer Id : {}'.format(Customer.objects.get(user=request.user).id),
                    source=token,
                )
                try:
                    address = Address.objects.get(customer__user=request.user,
                                                  firstName=checkout.cleaned_data['firstName'],
                                                  lastName=checkout.cleaned_data['lastName'],
                                                  address=checkout.cleaned_data['address'],
                                                  city=checkout.cleaned_data['city'], cp=checkout.cleaned_data['cp'],
                                                  country=checkout.cleaned_data['country'],
                                                  mobile=checkout.cleaned_data['mobilePhone'])
                except Address.DoesNotExist:
                    # on creer une instance
                    address = Address(customer=Customer.objects.get(user=request.user),
                                      firstName=checkout.cleaned_data['firstName'],
                                      lastName=checkout.cleaned_data['lastName'],
                                      address=checkout.cleaned_data['address'],
                                      city=checkout.cleaned_data['city'], cp=checkout.cleaned_data['cp'],
                                      country=checkout.cleaned_data['country'],
                                      mobile=checkout.cleaned_data['mobilePhone'])
                    address.save()

                order = Order(customer=Customer.objects.get(user=request.user), address=address,
                              status="En cours de Traitement", methodPayment='Cards')
                order.save()
                # on recupere le contenu du panier
                basket = Basket.objects.filter(customer__user=request.user)
                # on le parcour
                for item in basket:
                    # on ajoute a la table OrderProduct les produit qui sont dans le panier du client
                    OrderProduct(product=item.product,
                                 order=order, quantity=item.quantity).save()
                    product = Product.objects.get(id=item.product.id)
                    print("product quantity old = ", product.quantity)
                    print("product quantity = ", (product.quantity - item.quantity))
                    # on supprime la quantité au produit
                    product.quantity = (product.quantity - item.quantity)
                    product.save()
                    # on supprime le produit du panier du client
                    item.delete()
                context = tools.mergeDict({"OrderId": order.id},
                                          {"emailNewsLetter": request.session.get('emailNewsLetter')})
                return render(request, "donePayment.html", context)
            else:
                # si le formulaire est pas valide on le renvoie
                context["basketCount"] = tools.basketCount(request)
                context = tools.mergeDict(context, tools.checkOutProduct(request))
                return render(request, 'checkout.html', context)

        except stripe.error.RateLimitError as e:
            # Too many requests made to the API too quickly
            pass
        except stripe.error.InvalidRequestError as e:
            # Invalid parameters were supplied to Stripe's API
            pass
        except stripe.error.AuthenticationError as e:
            # Authentication with Stripe's API failed
            # (maybe you changed API keys recently)
            pass
        except stripe.error.APIConnectionError as e:
            # Network communication with Stripe failed
            pass
        except stripe.error.StripeError as e:
            # Display a very generic error to the user, and maybe send
            # yourself an email
            pass
        except Exception as e:
            # Something else happened, completely unrelated to Stripe
            pass
        # si une erreur c'est produite
        return redirect("Payment")
    else:
        # si on a une requete de type get
        return redirect("Basket")


@login_required(login_url='Login')
def view_my_order(request):
    """:synopsis: Permet de d'afficher la page pour visualisé information sur les Commandes du client
       :param request: La requete du client de type GET
       :type request: djangoRequest
       :return: Si requete GET le template + le context -> générer au final une page html
                              """
    context = tools.mergeDict({"basketCount": tools.basketCount(request)},
                              {"emailNewsLetter": request.session.get('emailNewsLetter')})
    order = Order.objects.filter(customer__user=request.user).order_by('-date')
    context = tools.mergeDict(context, {"emailNewsLetter": request.session.get('emailNewsLetter')})
    request.session['emailNewsLetter'] = ""
    context["order"] = order
    context["orderProduct"] = {}
    for items in order:
        context["orderProduct"][str(items.id)] = OrderProduct.objects.filter(order=items)
    return render(request, 'order.html', context)
