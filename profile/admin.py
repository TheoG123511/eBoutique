from django.contrib import admin
from .models import Customer, Basket, Order, OrderProduct, Address
# Register your models here.


# Register your models here.
admin.site.register(Customer)
admin.site.register(Basket)
admin.site.register(Order)
admin.site.register(OrderProduct)
admin.site.register(Address)
