from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect
from .models import SubCategory, Product, Images, ProductComment, IndexPub
from .models import NewsLetter as News
from .forms import ReviewsForm, PriceRange, Search, Basket, NewsLetter
from django.shortcuts import get_object_or_404, get_list_or_404
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Count
from util import tools
import profile.models


# Create your views here.
def index_price_range(request):
    """:synopsis: Permet de Trier les produits de l'index en fonction d'un prix min et max si request = GET
       :param request: La requete du client de type GET
       :type request: djangoRequest
       :return: le template + le context -> générer au final la page index.html avec les produits trier
                              """
    context = {"product": object(),
               "basketCount": tools.basketCount(request)}
    context = tools.mergeDict(context, tools.displayCategory())
    # on verifie que la requete est de type get
    pub = IndexPub.objects.all()
    context["indexPub"] = pub
    if request.method == "GET":
        form = PriceRange(request.GET)
        context['form'] = form
        if form.is_valid():
            product = Product.objects.filter(price__range=(form.cleaned_data['priceMin'],
                                                           form.cleaned_data['priceMax']),
                                             quantity__gte=1)
            paginator = Paginator(product, 25)
            page = request.GET.get('page')
            try:
                context["product"] = paginator.get_page(page)
            except PageNotAnInteger:
                context["product"] = paginator.page(1)
            except EmptyPage:
                context["product"] = paginator.page(1)
            finally:
                get = dict(request.GET)
                context["getParam"] = "priceMin={0}&priceMax={1}".format(get["priceMin"][0], get["priceMax"][0])
                context = tools.mergeDict(context, {"emailNewsLetter": request.session.get('emailNewsLetter')})
                request.session['emailNewsLetter'] = ""
    return render(request, 'index.html', context)


def index_sorted(request, sorted_by):
    """:synopsis: Permet de Trier les produits de l'index en fonction d'une action passer en paramètre (request = GET)
       :param request: La requete du client de type GET
       :type request: djangoRequest
       :param sorted_by: Action a effectué sur le trie des produits
       :type sorted_by: str
       :return: le template + le context -> générer au final la page index.html avec les produits trier
                                  """
    context = {"product": object(),
               'form': PriceRange(),
               "basketCount": tools.basketCount(request)}

    sorted_values = {"priceASC": lambda: (Product.objects.filter(quantity__gte=1).order_by('price')),
                     "priceDESC": lambda: (Product.objects.filter(quantity__gte=1).order_by('-price')),
                     "date": lambda: (Product.objects.filter(quantity__gte=1).order_by('date')),
                     "star": lambda: (Product.objects.filter(quantity__gte=1).annotate(
                         review=Count('productcomment__comment')).order_by('-review')),
                     "error": lambda: (Product.objects.filter(quantity__gte=1))}
    pub = IndexPub.objects.all()
    context["indexPub"] = pub
    try:
        product = sorted_values[sorted_by]()
    except KeyError:
        product = sorted_values["error"]()

    paginator = Paginator(product, 25)
    page = request.GET.get('page')
    try:

        context["product"] = paginator.get_page(page)
    except PageNotAnInteger:
        context["product"] = paginator.page(1)
    except EmptyPage:
        context["product"] = paginator.page(1)
    context = tools.mergeDict(context, tools.displayCategory())
    context = tools.mergeDict(context, {"emailNewsLetter": request.session.get('emailNewsLetter')})
    request.session['emailNewsLetter'] = ""
    return render(request, 'index.html', context)


def home(request):
    """:synopsis: Permet de générer la page index du site si request = GET
       :param request: La requete du client de type GET
       :type request: djangoRequest
       :return: le template + le context -> générer au final la page html
                          """
    context = {"product": object,
               "basketCount": tools.basketCount(request),
               'form': PriceRange()}
    # on recupere tous les produits
    product = Product.objects.filter(quantity__gte=1).order_by("date")
    pub = IndexPub.objects.all()
    context["indexPub"] = pub
    paginator = Paginator(product, 25)
    page = request.GET.get('page')
    try:
        context["product"] = paginator.get_page(page)
    except PageNotAnInteger:
        context["product"] = paginator.page(1)
    except EmptyPage:
        context["product"] = paginator.page(1)
    context = tools.mergeDict(context, {"emailNewsLetter": request.session.get('emailNewsLetter')})
    context = tools.mergeDict(context, tools.displayCategory())
    request.session['emailNewsLetter'] = ""
    return render(request, 'index.html', context)


def view_product(request, id_product):
    """:synopsis: Permet de générer la page details produit si request = GET.
                  Si request = POST permet de poster un avis sur la page produit details
       :param request: La requete du client de type GET ou POST
       :type request: djangoRequest
       :param id_product: L'id du produit a afficher sur la page
       :type id_product: int
       :return: le template + le context -> générer au final la page html
                              """
    context = {"product": get_object_or_404(Product, id=id_product),
               "image": Images.objects.filter(product_id=id_product),
               "reviews": ProductComment.objects.filter(product_id=id_product).order_by('-date'),
               "form": ReviewsForm(),
               "basketCount": tools.basketCount(request),
               'basket': Basket()}
    context = tools.mergeDict(context, tools.displayCategory())
    context = tools.mergeDict(context, {"emailNewsLetter": request.session.get('emailNewsLetter')})
    request.session['emailNewsLetter'] = ""
    if request.method == "POST":
        form = ReviewsForm(request.POST)
        if form.is_valid():
            # on insert le commentaire dans la bd
            review = ProductComment(name=form.cleaned_data['name'],
                                    email=form.cleaned_data['email'],
                                    comment=form.cleaned_data['comment'],
                                    product=Product.objects.get(pk=id_product), star=4)
            review.save()

    return render(request, 'view_details.html', context)


def view_category(request, id_category):
    """:synopsis: Permet de générer la page pour afficher tous les produit contenu dans une catégorie si request = GET.
       :param request: La requete du client de type GET
       :type request: djangoRequest
       :param id_category: L'id de la catégorie a afficher
       :type id_category: int
       :return: le template + le context -> générer au final la page html
                                  """
    # on recupere tous les article lier a cette catégorie
    product = Product.objects.filter(category_id=id_category, quantity__gte=1)
    paginator = Paginator(product, 25)
    page = request.GET.get('page')
    # get_list_or_404(Product, category_id=id_category)
    context = {"product": paginator.get_page(page),
               'id_category': id_category,
               'form': PriceRange(),
               "basketCount": tools.basketCount(request),
               'categoryName': SubCategory.objects.get(id=id_category)}
    context = tools.mergeDict(context, tools.displayCategory())
    context = tools.mergeDict(context, {"emailNewsLetter": request.session.get('emailNewsLetter')})
    request.session['emailNewsLetter'] = ""
    return render(request, 'view_category.html', context)


def category_sorted(request, id_category, sorted_by):
    """:synopsis: Permet de Trier les produits de la page view Category en fonction d'une action passer en paramètre
                  (request = GET)
       :param request: La requete du client de type GET
       :type request: djangoRequest
       :param id_category: L'id de la catégorie a afficher
       :type id_category: int
       :param sorted_by: Action a effectué sur le trie des produits
       :type sorted_by: str
       :return: le template + le context -> générer au final la page index.html avec les produits trier
                                     """
    # on recupere tous les article lier a cette catégorie
    context = {"product": object(),
               'id_category': id_category,
               'form': PriceRange(),
               "basketCount": tools.basketCount(request)}

    sorted_values = {"priceASC": lambda: (Product.objects.filter(category_id=id_category,
                                                                 quantity__gte=1).order_by('price')),
                     "priceDESC": lambda: (Product.objects.filter(category_id=id_category,
                                                                  quantity__gte=1).order_by('-price')),
                     "date": lambda: (Product.objects.filter(category_id=id_category,
                                                             quantity__gte=1).order_by('date')),
                     "star": lambda: (Product.objects.filter(category=id_category,
                                                             quantity__gte=1).annotate(
                         review=Count('productcomment__comment')).order_by('-review')),
                     "error": lambda: (Product.objects.filter(category_id=id_category, quantity__gte=1))}
    try:
        product = sorted_values[sorted_by]()
    except KeyError:
        product = sorted_values["error"]()

    paginator = Paginator(product, 25)
    page = request.GET.get('page')
    try:

        context["product"] = paginator.get_page(page)
    except PageNotAnInteger:
        context["product"] = paginator.page(1)
    except EmptyPage:
        context["product"] = paginator.page(1)
    context = tools.mergeDict(context, tools.displayCategory())
    context = tools.mergeDict(context, {"emailNewsLetter": request.session.get('emailNewsLetter')})
    request.session['emailNewsLetter'] = ""
    return render(request, 'view_category.html', context)


def view_price_by_id(request, id_category):
    """:synopsis: Permet de Trier les produits  de la page view Category en fonction d'un prix min et max
                  si request = GET
       :param request: La requete du client de type GET
       :type request: djangoRequest
       :param id_category: L'id de la catégorie a afficher
       :type id_category: int
       :return: Le template + le context -> générer au final la page view_category.html avec
                les produits trier par prix
                                  """
    context = {"product": object(),
               'id_category': id_category,
               'form': PriceRange(),
               "basketCount": tools.basketCount(request)}
    context = tools.mergeDict(context, tools.displayCategory())
    context = tools.mergeDict(context, {"emailNewsLetter": request.session.get('emailNewsLetter')})
    request.session['emailNewsLetter'] = ""
    # on verifie que la requete est de type get
    if request.method == "GET":
        form = PriceRange(request.GET)
        if form.is_valid():
            product = Product.objects.filter(price__range=(form.cleaned_data['priceMin'],
                                                           form.cleaned_data['priceMax']), category=id_category,
                                             quantity__gte=1)
            paginator = Paginator(product, 25)
            page = request.GET.get('page')
            try:
                context["product"] = paginator.get_page(page)
            except PageNotAnInteger:
                context["product"] = paginator.page(1)
            except EmptyPage:
                context["product"] = paginator.page(1)
            finally:
                get = dict(request.GET)
                context["getParam"] = "priceMin={0}&priceMax={1}".format(get["priceMin"][0], get["priceMax"][0])

    return render(request, 'view_category.html', context)


def view_price_by_name(request, product_name):
    """:synopsis: Permet de Trier les produits  de la page view Search en fonction d'un prix min et max
                  si request = GET
       :param request: La requete du client de type GET
       :type request: djangoRequest
       :param product_name: le terms rechercher
       :type product_name: str
       :return: Le template + le context -> générer au final la page view_search.html avec
                les produits trier par prix
                                      """
    context = {"product": object(),
               'form': PriceRange(),
               'productName': product_name,
               "basketCount": tools.basketCount(request)}
    context = tools.mergeDict(context, tools.displayCategory())
    context = tools.mergeDict(context, {"emailNewsLetter": request.session.get('emailNewsLetter')})
    request.session['emailNewsLetter'] = ""
    # on verifie que la requete est de type get
    if request.method == "GET":
        form = PriceRange(request.GET)
        if form.is_valid():
            product = Product.objects.filter(price__range=(form.cleaned_data['priceMin'],
                                                           form.cleaned_data['priceMax']), name__contains=product_name,
                                             quantity__gte=1)
            paginator = Paginator(product, 25)
            page = request.GET.get('page')
            try:
                context["product"] = paginator.get_page(page)
            except PageNotAnInteger:
                context["product"] = paginator.page(1)
            except EmptyPage:
                context["product"] = paginator.page(1)
            finally:
                get = dict(request.GET)
                get = "priceMin={0}&priceMax={1}".format(get["priceMin"][0], get["priceMax"][0])
                context["getParam"] = get

    return render(request, 'view_search.html', context)


def view_search(request):
    """:synopsis: Permet de générer la page de resultat d'une recherche si request = GET.
       :param request: La requete du client de type GET
       :type request: djangoRequest
       :return: le template + le context -> générer au final la page html
                                      """
    context = {'product': object(),
               'form': PriceRange(),
               "basketCount": tools.basketCount(request)}
    context = tools.mergeDict(context, tools.displayCategory())
    context = tools.mergeDict(context, {"emailNewsLetter": request.session.get('emailNewsLetter')})
    request.session['emailNewsLetter'] = ""
    # on verifie que la form est valide
    form = Search(request.GET)
    print("ok est a search")
    if form.is_valid():
        terms = form.cleaned_data['search']
        context['terms'] = terms
        product = Product.objects.filter(name__icontains=terms, quantity__gte=1)
        context["productName"] = terms
        paginator = Paginator(product, 1)
        page = request.GET.get('page')
        try:
            context["product"] = paginator.get_page(page)
        except PageNotAnInteger:
            context["product"] = paginator.page(1)
        except EmptyPage:
            context["product"] = paginator.page(1)
        return render(request, 'view_search.html', context)
    else:
        redirect("index")


def search_sorted(request, product_name, sorted_by):
    """:synopsis: Permet de Trier les produits de la page view Search en fonction d'une action passer en paramètre
                  (request = GET)
       :param request: La requete du client de type GET
       :type request: djangoRequest
       :param product_name: Le terms de la recherche
       :type product_name: str
       :param sorted_by: Action de trie a effectué sur les resultats de la recherche
       :type sorted_by: str
       :return: le template + le context -> générer au final la page view_search.html avec les produits trier
                                         """
    # on recupere tous les article lier a cette catégorie
    context = {"product": object(),
               'productName': product_name,
               'form': PriceRange(),
               "basketCount": tools.basketCount(request)}

    sorted_values = {"priceASC": lambda: (Product.objects.filter(name__contains=product_name,
                                                                 quantity__gte=1).order_by('price')),
                     "priceDESC": lambda: (Product.objects.filter(name__contains=product_name,
                                                                  quantity__gte=1).order_by('-price')),
                     "date": lambda: (Product.objects.filter(name__contains=product_name,
                                                             quantity__gte=1).order_by('date')),
                     "star": lambda: (Product.objects.filter(name__contains=product_name, quantity__gte=1).annotate(
                         review=Count('productcomment__comment')).order_by('-review')),
                     "error": lambda: (Product.objects.filter(name__contains=product_name, quantity__gte=1))}
    try:
        product = sorted_values[sorted_by]()
    except KeyError:
        product = sorted_values["error"]()

    paginator = Paginator(product, 25)
    page = request.GET.get('page')
    try:

        context["product"] = paginator.get_page(page)
    except PageNotAnInteger:
        context["product"] = paginator.page(1)
    except EmptyPage:
        context["product"] = paginator.page(1)
    context = tools.mergeDict(context, tools.displayCategory())
    context = tools.mergeDict(context, {"emailNewsLetter": request.session.get('emailNewsLetter')})
    request.session['emailNewsLetter'] = ""
    return render(request, 'view_search.html', context)


@login_required(login_url='Login')
def view_add_basket(request, id_product):
    """:synopsis: Permet a un client d'ajouter un article dans sont panier (request = GET)
       :param request: La requete du client de type GET
       :type request: djangoRequest
       :param id_product: L'id du produit a ajouter au panier
       :type id_product: int
       :return: redirige vers la page produit details
                                  """
    # on verifie le formulaire
    form = Basket(request.GET)
    # si il renvoie un nombre
    if form.is_valid():
        # on verifie que la quantity demander est disponible
        product = Product.objects.get(id=id_product)
        try:
            quantity = int(form.cleaned_data.get('basket'))
        except ValueError:
            quantity = 1
        # on verifie que le produit n'est pas deja dans le panier du client
        try:
            basketProduct = profile.models.Basket.objects.get(customer__user=request.user, product__id=id_product)
            # on verifie que la quantité dans le panier + la quantiter demander est inferieur ou egal au stock dispo
            if (basketProduct.quantity + quantity) <= product.quantity:
                basketProduct.quantity = (basketProduct.quantity + quantity)
            # la quantité dans le panier + la quantiter voulu est trop grande donc on ajoute se qui reste de dispo
            else:
                basketProduct.quantity = basketProduct.quantity + (product.quantity - basketProduct.quantity)
            # on sauvegarde l'instance Basket
            basketProduct.save()

        except profile.models.Basket.DoesNotExist:
            # sa veut dire que le produit n'est pas dans le panier donc on ajoute
            if product.quantity >= quantity > 0:
                try:
                    item = profile.models.Basket(product=product, quantity=quantity,
                                                 customer=profile.models.Customer.objects.get(user=request.user))
                    item.save()
                except profile.models.Customer.DoesNotExist:
                    pass

    return redirect("ViewProduct", id_product=id_product)


def view_news_letter(request):
    """:synopsis: Permet a un utilisateur de s'inscrire a la news letter, puis le redirige vers la page qu'il etait
                  en train de visité (request = GET).
       :param request: La requete du client de type GET
       :type request: djangoRequest
       :return: redirige vers la actuellement visité par l'utilisateur
                                      """
    if request.method == "GET":
        news = NewsLetter(request.GET)
        next_url = request.GET.get('next')
        email = request.GET.get('email')
        if news.is_valid():
            item = News(email=email)
            item.save()
            request.session['emailNewsLetter'] = "Done"
            return HttpResponseRedirect(next_url)
        else:
            request.session['emailNewsLetter'] = email
            return HttpResponseRedirect(next_url)
