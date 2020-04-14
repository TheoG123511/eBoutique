from django.db import models
from django.utils import timezone
from django.core.validators import MaxValueValidator, MinValueValidator


# Create your models here.
class Category(models.Model):
    """:synopsis: Classe qui permet de creer la table Category dans la base de donnees
                  """
    name = models.CharField(max_length=30)

    class Meta:
        verbose_name = "Category"
        ordering = ['name']

    def __str__(self):
        """:synopsis: Méthode défini dans tous les modèles et
                       qui permet de reconnaître facilement les différents objets
                       """
        return self.name


class SubCategory(models.Model):
    """:synopsis: Classe qui permet de creer la table SubCategory dans la base de donnees
                  """
    name = models.CharField(max_length=30)
    category = models.ForeignKey('Category', on_delete=models.CASCADE)

    class Meta:
        verbose_name = "SubCategory"
        ordering = ['name']

    def __str__(self):
        """:synopsis: Méthode défini dans tous les modèles et
                       qui permet de reconnaître facilement les différents objets
                       """
        return self.name


class IndexPub(models.Model):
    """:synopsis: Classe qui permet de creer la table IndexPub dans la base de donnees
                      """
    product = models.ForeignKey('Product', on_delete=models.CASCADE)
    date = models.DateTimeField(default=timezone.now, verbose_name="Date d'ajout")

    class Meta:
        verbose_name = "IndexPub"
        ordering = ['date']

    def __str__(self):
        """:synopsis: Méthode défini dans tous les modèles et
                       qui permet de reconnaître facilement les différents objets
                       """
        return self.product.name


class Product(models.Model):
    """:synopsis: Classe qui permet de creer la table Product dans la base de donnees
                  """
    name = models.CharField(max_length=50)
    description = models.TextField()
    price = models.DecimalField(max_digits=9, decimal_places=2)
    quantity = models.IntegerField()
    image = models.ImageField(upload_to='products/%Y/%m/%d', blank=False, null=True)
    category = models.ForeignKey('SubCategory', on_delete=models.CASCADE)
    date = models.DateTimeField(default=timezone.now, verbose_name="Date d'ajout")

    class Meta:
        verbose_name = "Product"
        ordering = ['date']

    def __str__(self):
        """:synopsis: Méthode défini dans tous les modèles et
                       qui permet de reconnaître facilement les différents objets
                       """
        return self.name


class Images(models.Model):
    """:synopsis: Classe qui permet de creer la table Images dans la base de donnees
                  """
    product = models.ForeignKey(Product, default=None, related_name='images', on_delete=models.PROTECT)
    image = models.ImageField(upload_to='products/%Y/%m/%d', blank=False, null=True)
    title = models.CharField(max_length=124, null=True, blank=True)
    date = models.DateTimeField(default=timezone.now, verbose_name="Date d'ajout")

    class Meta:
        verbose_name = "Images"
        ordering = ['date']

    def __str__(self):
        """:synopsis: Méthode défini dans tous les modèles et
                       qui permet de reconnaître facilement les différents objets
                       """
        return str(self.product)


class ProductComment(models.Model):
    """:synopsis: Classe qui permet de creer la table ProductComment dans la base de donnees
                  """
    name = models.CharField(max_length=50)
    email = models.EmailField()
    comment = models.TextField()
    product = models.ForeignKey('Product', on_delete=models.CASCADE)
    star = models.PositiveSmallIntegerField(default=1, validators=[MaxValueValidator(5), MinValueValidator(1)])
    date = models.DateTimeField(default=timezone.now, verbose_name="Date d'ajout")

    class Meta:
        verbose_name = "ProductComment"
        ordering = ['name']

    def __str__(self):
        """:synopsis: Méthode défini dans tous les modèles et
                       qui permet de reconnaître facilement les différents objets
                       """
        return self.name


class NewsLetter(models.Model):
    """:synopsis: Classe qui permet de creer la table NewsLetter dans la base de donnees
                      """
    email = models.EmailField()
    date = models.DateTimeField(default=timezone.now, verbose_name="Date d'ajout")

    class Meta:
        verbose_name = "NewsLetter"
        ordering = ['date']

    def __str__(self):
        """:synopsis: Méthode défini dans tous les modèles et
                       qui permet de reconnaître facilement les différents objets
                       """
        return self.email
