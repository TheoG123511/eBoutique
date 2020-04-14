from django.core.exceptions import ValidationError, ObjectDoesNotExist, MultipleObjectsReturned
from django.forms import Form, TextInput, EmailInput, CharField, EmailField, PasswordInput, RadioSelect, BooleanField
from django.contrib.auth.forms import AuthenticationForm
from django.utils.safestring import mark_safe
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from phonenumber_field.formfields import PhoneNumberField
import re


class Search(Form):
    """:synopsis: Classe permetant de générer le formulaire de recheche
            """
    search = CharField(max_length=200, widget=TextInput(attrs={"class": "form-control",
                                                               "placeholder": "Rechercher un article ..."}),
                       required=True)


class CustomAuthForm(AuthenticationForm):
    """:synopsis: Classe permetant de générer le formulaire de connection
                """
    username = CharField(widget=TextInput(attrs={'class': 'form-control', 'placeholder': 'Identifiant'}))
    password = CharField(widget=PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Password'}))


class CustomerAddress(Form):
    """:synopsis: Classe permetant de générer le formulaire pour l'inscription d'un nouveaux Utilisateur de type Client
                """
    gender = CharField(label='Civilité', widget=RadioSelect(choices=[('M', 'Monsieur'), ('F', 'Madame')]))
    mobilePhone = PhoneNumberField(label='Portable :', widget=TextInput(
        attrs={'class': 'form-control RegisterForm', 'placeholder': 'Votre telephone mobile'}))
    is_newsLetter = BooleanField(required=False,
                                 label="S'inscrire a notre newsletter pour recevoir nos dernière actualité")
    cgv = BooleanField(required=True,
                       label=mark_safe("J'accepte les conditions de vente du site."
                                       " <a href="" target='_blank'>Consulté nos CGV</a>"))


class SignUpForm(UserCreationForm):
    """:synopsis: Classe permetant de générer le formulaire d'inscription
                """
    username = CharField(max_length=30, widget=TextInput(attrs={'class': 'form-control RegisterForm',
                                                                'placeholder': 'Votre Pseudo'}), label="Pseudo :")
    first_name = CharField(max_length=30,  widget=TextInput(attrs={'class': 'form-control RegisterForm',
                                                                   'placeholder': 'Votre Prénom'}), label="Prénom :")
    last_name = CharField(max_length=30, widget=TextInput(attrs={'class': 'form-control RegisterForm',
                                                                 'placeholder': 'Votre Nom'}), label="Nom :")
    email = EmailField(max_length=254, widget=EmailInput(attrs={'class': 'form-control RegisterForm',
                                                                'placeholder': 'Votre Email'}), label="Email :")
    password1 = CharField(max_length=45, widget=PasswordInput(attrs={'class': 'form-control RegisterForm',
                                                                     'placeholder': 'Votre mot de passe'}),
                          label="Mot de passe :")
    password2 = CharField(max_length=45, widget=PasswordInput(attrs={'class': 'form-control RegisterForm',
                                                                     'placeholder': 'confirmer votre mot de passe'}),
                          label="Confirmez votre mot de passe :")

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'password1', 'password2', )
        required = ["username", "first_name", "last_name", "email", 'password1', 'password2']

    def clean_email(self):
        """:synopsis: Permet de verifier si le champ email du formulaire est valide
           :return: la valeurs du champ, si la vérification echoue une erreur de type ValidationError est lever
                      """
        email = self.cleaned_data.get('email')
        try:
            User.objects.get(email=email)
        except ObjectDoesNotExist:
            return email
        except MultipleObjectsReturned:
            raise ValidationError('Cette addresse email est deja utiliser par un autre compte')
        return email

    def clean_username(self):
        """:synopsis: Permet de verifier si le champ username du formulaire est valide
           :return: la valeurs du champ, si la vérification echoue une erreur de type ValidationError est lever
                              """
        username = self.cleaned_data.get('username')
        try:
            User.objects.get(username=username)
            raise ValidationError('Le pseudo est deja utilisé par un autre compte')
        except ObjectDoesNotExist:
            return username


class CheckOut(Form):
    """:synopsis: Classe permetant de générer le formulaire pour creer une Commande
                    """
    pattern = re.compile("^([A-Z][a-z]+)+$")
    firstName = CharField(label='Prénom :', widget=TextInput(attrs={'class': 'form-control',
                                                                    'placeholder': 'Prénom', 'id': "firstName"}),
                          required=True)
    lastName = CharField(label='Nom :', widget=TextInput(attrs={'class': 'form-control',
                                                                'placeholder': 'Nom', 'id': "lastName"}), required=True)
    mobilePhone = PhoneNumberField(label='Téléphone :', widget=TextInput(
        attrs={'class': 'form-control', 'placeholder': 'Votre telephone mobile', 'id': "mobilePhone"}), required=True)
    country = CharField(label='Pays :',
                        widget=TextInput(attrs={'class': 'form-control RegisterForm', 'placeholder': 'Votre Pays',
                                                'id': "country"}), required=True)
    address = CharField(label='Addresse ', widget=TextInput(attrs={'class': 'form-control',
                                                                   'placeholder': 'Votre address', 'id': "address"}),
                        required=True)
    city = CharField(label='Ville :', widget=TextInput(attrs={'class': 'form-control RegisterForm',
                                                              'placeholder': 'Votre ville', 'id': "city"}),
                     required=True)
    cp = CharField(label='Code Postal (optionel)', widget=TextInput(attrs={'class': 'form-control RegisterForm',
                                                                           'placeholder': 'Votre code postal',
                                                                           'id': "cp"}), required=True)

    def __init__(self, *args, **kwargs):
        """:synopsis: Constructeur de la Classe. Permet de passer un dictionnaire grace au paramètre nommer organizer
                              """
        try:
            self.organizer = kwargs.pop('organizer')

        except KeyError:
            pass
        super(CheckOut, self).__init__(*args, **kwargs)
        try:
            self.initial['lastName'] = self.organizer["lastName"]
            self.initial['firstName'] = self.organizer["firstName"]
            self.initial['mobilePhone'] = self.organizer["mobile"]
            self.initial['country'] = self.organizer["country"]
            self.initial['address'] = self.organizer["address"]
            self.initial['city'] = self.organizer["city"]
            self.initial['cp'] = self.organizer["cp"]
        except KeyError:
            pass
        except AttributeError:
            pass

    def clean_firstName(self):
        """:synopsis: Permet de verifier si le champ firstName du formulaire est valide
           :return: la valeurs du champ, si la vérification echoue une erreur de type ValidationError est lever
                              """
        firstName = self.cleaned_data.get('firstName')
        if self.pattern.match(firstName):
            pass
        else:
            raise ValidationError('Le Nom doit etre uniquement composé des lettre (a-z) et commencer par une Majuscule')
        return firstName

    def clean_lastName(self):
        """:synopsis: Permet de verifier si le champ lastName du formulaire est valide
           :return: la valeurs du champ, si la vérification echoue une erreur de type ValidationError est lever
                              """
        lastName = self.cleaned_data.get('lastName')
        if self.pattern.match(lastName):
            pass
        else:
            raise ValidationError('Le Prenom doit etre uniquement composé des lettre (a-z) et commencer par une Majuscule')
        return lastName

    def clean_country(self):
        """:synopsis: Permet de verifier si le champ country du formulaire est valide
           :return: la valeurs du champ, si la vérification echoue une erreur de type ValidationError est lever
                              """
        country = self.cleaned_data.get('country')
        if self.pattern.match(country):
            pass
        else:
            raise ValidationError('Le Pays doit etre uniquement composé des lettre (a-z)')
        return country

    def clean_city(self):
        """:synopsis: Permet de verifier si le champ city du formulaire est valide
           :return: la valeurs du champ, si la vérification echoue une erreur de type ValidationError est lever
                              """
        city = self.cleaned_data.get('city')
        if self.pattern.match(city):
            pass
        else:
            raise ValidationError('La ville doit etre uniquement composé des lettre (a-z)')
        return city
