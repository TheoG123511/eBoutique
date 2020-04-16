from django.forms import ModelForm, TextInput, Textarea, EmailInput
from .models import Contact


class ContactForm(ModelForm):
    """:synopsis: Classe permetant de générer le formulaire de contact et ensuite d'inserer les donnees dans la base de
                  données.
        """
    class Meta:
        model = Contact
        fields = ["nom", "email", "subject", "message"]
        required = ["nom", "email", "subject", "message"]
        widgets = {
            "nom": TextInput(attrs={"class": "form-control", "placeholder": "Votre Nom"}),
            "email": EmailInput(attrs={"class": "form-control", "placeholder": "Votre Email"}),
            "subject": TextInput(attrs={"class": "form-control", "placeholder": "Sujet de votre message"}),
            "message": Textarea(attrs={"class": "form-control", "placeholder": "Votre message",
                                       "style": "height: 100%;"})
        }
