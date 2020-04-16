from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = [
    path('', views.home, name="index"),
    path('product/<int:id_product>', views.view_product, name="ViewProduct"),
    path('category/<int:id_category>', views.view_category, name="viewCategory"),
    path('category/<int:id_category>/<str:sorted_by>', views.category_sorted, name="shopSortedById"),
    path('search/<str:product_name>/<str:sorted_by>', views.search_sorted, name="shopSortedByName"),
    path('price_range/<int:id_category>', views.view_price_by_id, name="shopPriceRangeById"),
    path('price_range/<str:product_name>', views.view_price_by_name, name="shopPriceRangeByName"),
    path('search/', views.view_search, name="shopSearch"),
    path('add/<int:id_product>/', views.view_add_basket, name="addBasket"),
    path('<str:sorted_by>', views.index_sorted, name="shopSorted"),
    path('price/', views.index_price_range, name="shopPriceRange"),
    path('newsletter/', views.view_news_letter, name="newsLetter")
]
urlpatterns += staticfiles_urlpatterns()
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)