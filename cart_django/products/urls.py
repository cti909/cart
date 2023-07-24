from django.urls import path
from . import views

urlpatterns = [
    path('product_home', views.product_home, name='product_home'),
    path('product_detail/<int:id>', views.product_detail, name='product_detail'),
    path('product_category/<int:id>', views.product_categories, name='product_categories'),
]