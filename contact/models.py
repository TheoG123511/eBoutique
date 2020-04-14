from django.db import models
from django.utils import timezone
# Create your models here.


class Contact(models.Model):
    """:synopsis: Classe qui permet de creer la table Contact dans la base de donnees
          """
    nom = models.CharField(max_length=100)
    email = models.EmailField()
    subject = models.CharField(max_length=200)
    message = models.TextField()
    date = models.DateTimeField(default=timezone.now,
                                verbose_name="Date de contact")

    class Meta:
        verbose_name = "contact"
        ordering = ['date']

    def __str__(self):
        """
        méthode défini dans tous les modèles et
        qui permet de reconnaître facilement les différents objets
        """
        return self.nom
