from django.http import HttpResponse
from django.shortcuts import render
from .forms import ContactForm
from util import tools

# Create your views here.


def contact(request):
    """:synopsis: Permet de générer la page contact si request = GET sinon permet d'enregistrer une demande de contact
                  dans la base de données
       :param request: La requete du client de type POST ou GET
       :type request: djangoRequest
       :return: le template + le context -> générer au final une page html
              """
    if request.method == "GET":
        form = ContactForm()
        context = {"form": form,
                   "basketCount": tools.basketCount(request)}
        context = tools.mergeDict(context, {"emailNewsLetter": request.session.get('emailNewsLetter')})
        request.session['emailNewsLetter'] = ""
        return render(request, 'contact/contact.html', context)
    else:
        # method POST
        form = ContactForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponse("ok sa marche")
