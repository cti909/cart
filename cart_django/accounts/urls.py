from django.urls import path
from . import views

urlpatterns = [
    path('login', views.loginPage, name='loginPage'),
    path('check_login', views.checklogin, name='checklogin'),
    path('logout', views.logoutPage, name='logoutPage'),
    path('register', views.registerPage, name='registerPage'),
    path('change_password', views.change_password, name='change_password'),
    path('account_information', views.account_information, name='account_information'),
]