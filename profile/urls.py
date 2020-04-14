from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.contrib.auth import views as auth_views
from .forms import Search, CustomAuthForm

urlpatterns = [
    path('connexion/', auth_views.LoginView.as_view(template_name="login.html", extra_context={"search": Search()},
                                                    authentication_form=CustomAuthForm,
                                                    redirect_authenticated_user=True), name="Login"),
    path('dashboard/', views.dashboard, name="DashBoard"),
    path('logout/', auth_views.LogoutView.as_view(next_page="/"), name="Logout"),
    path('register/', views.register, name="Register"),
    path('basket/', views.view_basket, name='Basket'),
    path('basket/<int:product_id>/<str:action>', views.view_basket_action, name="BasketAction"),
    path('basket/clean/', views.view_basket_clean, name="BasketClean"),
    path('checkout/<int:id_address>', views.view_check_out, name="CheckOut"),
    path('payment/', views.view_payment, name="Payment"),
    path('stateOrder/', views.view_order_done, name='StateOrder'),
    path('viewOrder', views.view_my_order, name="ViewOrder")
]
urlpatterns += staticfiles_urlpatterns()
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)