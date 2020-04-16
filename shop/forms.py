from django.contrib.auth.models import User
from django.core.exceptions import ObjectDoesNotExist, MultipleObjectsReturned, ValidationError
from django.forms import Form, TextInput, Textarea, EmailInput, CharField, EmailField
from .models import NewsLetter as News


class ReviewsForm(Form):
    """:synopsis: Classe permetant de générer le formulaire de d'ajout d'avis sur un produit
                """
    name = CharField(max_length=15,
                     widget=TextInput(attrs={"class": "form-control", "placeholder": "Votre Nom"}), required=True)

    email = EmailField(widget=EmailInput(attrs={"class": "form-control", "placeholder": "Votre Email"}), required=True)
    comment = CharField(widget=Textarea(attrs={"class": "form-control", "placeholder": "Donnez votre avis"}),
                        required=True)


class PriceRange(Form):
    """:synopsis: Classe permetant de générer le formulaire pour trier les produit par prix
                """
    priceMin = CharField(max_length=6, label="", widget=TextInput(attrs={"size": "3", "placeholder": "Min",
                                                                         "class": "form-control"}),
                         required=True)
    priceMax = CharField(max_length=6, label="", widget=TextInput(attrs={"size": "3", "placeholder": "Max",
                                                                         "class": "form-control"}),
                         required=True)


class Search(Form):
    """:synopsis: Classe permetant de générer le formulaire de recheche
                """
    search = CharField(max_length=200, widget=TextInput(attrs={"class": "form-control",
                                                               "placeholder": "Rechercher un article ..."}),
                       required=True)


class Basket(Form):
    """:synopsis: Classe permetant de générer le formulaire d'ajout d'un produit dans le panier
                """
    basket = CharField(max_length=4, widget=TextInput(), required=True, initial='1')


class NewsLetter(Form):
    """:synopsis: Classe permetant de générer le formulaire d'inscription a la newsLetter
                   """
    email = EmailField(widget=EmailInput(attrs={"class": "form-control", "placeholder": "Votre Email"}), required=True)

    def clean_email(self):
        """:synopsis: Permet de verifier si le champ email du formulaire est valide
           :return: la valeurs du champ, si la vérification echoue une erreur de type ValidationError est lever
                      """
        email = self.cleaned_data.get('email')
        print(News)
        try:
            User.objects.get(email=email)
        except ObjectDoesNotExist:
            pass
        except MultipleObjectsReturned:
            raise ValidationError('Cette addresse email est deja enregistrer a notre NewsLetter')
        if News.objects.filter(email=email).count():
            raise ValidationError('Cette addresse email est deja enregistrer a notre NewsLetter')
        return email
