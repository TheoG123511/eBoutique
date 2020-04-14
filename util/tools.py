from profile.models import Basket, Address
from shop.models import Category, SubCategory


def mergeDict(dict1, dict2):
    """:synopsis: Permet de fusionner deux dictionnaire en un seul
       :param dict1: Un dictionnaire
       :type dict1: dict
       :param dict2: Un dictionnaire
       :type dict2: dict
       :return: un dictionnaire qui contient les deux dictionnaire passer en parametre
           """
    return {**dict1, **dict2}


def basketCount(request):
    """:synopsis: Compte le nombre d'article présent dans le panier du client
       :param request: La requete du client
       :type request: djangoRequest
       :return: le nombre d'article présent dans le panier du client
                                      """
    if request.user.is_authenticated:
        items = Basket.objects.filter(customer__user=request.user)
        return str(items.count())
    else:
        return "0"


def displayCategory():
    """:synopsis: Retourne un dictionnaire qui contient toutes les catégorie présente dans la base de donnees
       :return: Un dictionnaire qui contient toutes les catégorie de la base de donnees
                                          """
    context = {'categoryProduct': {}}
    category = Category.objects.all()
    # on les parcours pour récuperer les sous catégorie associé a c'est derniere
    for sub in category:
        subCategory = SubCategory.objects.filter(category_id=sub.id)
        context["categoryProduct"][sub.name] = subCategory
    return context


def checkOutProduct(request):
    """:synopsis: Retourne un dictionnaire qui contient tous les produit contenu dans le panier du client,
                  ainsi que le prix total de tous ses article. Retourne aussi toutes les addresses enregistrer du client
       :param request: La requete du client
       :type request: djangoRequest
       :return: Un dictionnaire qui contient toutes les article du panier + ses Addresses + le prix total du panier
                                              """
    context = {}
    product = Basket.objects.filter(customer__user=request.user, product__quantity__gte=1)
    context["product"] = product
    # on calcule le prix total, le prix ht
    total_ttc = 0
    for item in product:
        total_ttc += float(item.product.price * item.quantity)
    context["totalTTC"] = total_ttc
    # on recupere les addresse deja connu pour ce client
    address = Address.objects.filter(customer__user=request.user)
    context["address"] = address
    return context


def amount(price):
    """:synopsis: Retourne le prix d'un produit de type (ex: 1.01, 10.99, 200.00) en centime
       :param price: Un prix (ex: 12.50)
       :type price: str
       :return: le prix en centime
       :rtype: int
            """
    number = str(price).split(".")
    number[0] = (int(number[0]) * 100)
    total = number[0] + int(number[1])
    return total
