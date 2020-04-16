from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
from phonenumber_field.modelfields import PhoneNumberField
from shop.models import Product
# Create your models here.


class Customer(models.Model):
    """:synopsis: Classe qui permet de creer la table Customer dans la base de donnees
              """
    user = models.OneToOneField(User, on_delete=models.CASCADE)  # La liaison OneToOne vers le modèle User
    mobile = PhoneNumberField()
    gender = models.CharField(max_length=1)
    IsNewsletter = models.BooleanField(default=False)

    def __str__(self):
        """:synopsis: Méthode défini dans tous les modèles et
               qui permet de reconnaître facilement les différents objets
               """
        return "Profil de {0}".format(self.user.username)


class Basket(models.Model):
    """:synopsis: Classe qui permet de creer la table Basket dans la base de donnees
              """
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveSmallIntegerField(default=1)
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    date = models.DateTimeField(default=timezone.now, verbose_name="Date d'ajout")

    class Meta:
        verbose_name = "Basket"
        ordering = ['date']

    def __str__(self):
        """:synopsis: Méthode défini dans tous les modèles et
               qui permet de reconnaître facilement les différents objets
               """
        return self.product.name


class Address(models.Model):
    """:synopsis: Classe qui permet de creer la table Address dans la base de donnees
              """
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)  # La liaison OneToOne vers le modèle Customer
    firstName = models.CharField(max_length=50)
    lastName = models.CharField(max_length=50)
    address = models.TextField()
    city = models.CharField(max_length=50)
    cp = models.CharField(max_length=5, null=True)
    country = models.CharField(max_length=30)
    mobile = PhoneNumberField(null=True)

    class Meta:
        verbose_name = "Address Customer"
        ordering = ['firstName']

    def __str__(self):
        """:synopsis: méthode défini dans tous les modèles et
               qui permet de reconnaître facilement les différents objets
               """
        return self.customer.user.first_name


class Order(models.Model):
    """:synopsis: Classe qui permet de creer la table Order dans la base de donnees
              """
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)  # La liaison OneToOne vers le modèle Customer
    address = models.ForeignKey(Address, on_delete=models.CASCADE)  # La liaison OneToOne vers le modèle Address
    status = models.CharField(max_length=50)
    delivery = models.URLField(null=True, blank=True)
    date = models.DateTimeField(default=timezone.now, verbose_name="Date de debut de la commande")
    endDate = models.DateTimeField(verbose_name="Date de fin de la commande", null=True, blank=True)
    methodPayment = models.CharField(max_length=15)

    class Meta:
        verbose_name = "Order Customer"
        ordering = ['date']

    def __str__(self):
        """:synopsis: Méthode défini dans tous les modèles et
               qui permet de reconnaître facilement les différents objets
               """
        return "Order no : {} -> {}".format(self.id, str(self.customer.user.first_name))


class OrderProduct(models.Model):
    """:synopsis: Classe qui permet de creer la table OrderProduct dans la base de donnees
              """
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    quantity = models.PositiveSmallIntegerField(default=1)

    class Meta:
        verbose_name = "Order Customer Product"
        ordering = ['order']

    def __str__(self):
        """:synopsis: Méthode défini dans tous les modèles et
               qui permet de reconnaître facilement les différents objets
               """
        return "Item no : {} -> {}".format(self.id, self.product.name)
