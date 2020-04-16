from django.contrib import admin
from .models import Category, SubCategory, Product, ProductComment, Images, NewsLetter, IndexPub

# Register your models here.
admin.site.register(IndexPub)
admin.site.register(Category)
admin.site.register(SubCategory)
admin.site.register(Product)
admin.site.register(ProductComment)
admin.site.register(Images)
admin.site.register(NewsLetter)
