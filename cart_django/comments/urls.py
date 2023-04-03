from django.urls import path
from . import views

urlpatterns = [
    path('comment_add/<int:product_id>/<str:path>', views.comment_add, name='comment_add'),
    path('comment_edit/<int:product_id>/<int:id>', views.comment_edit, name='comment_edit'),
    path('comment_delete/<int:id>', views.comment_delete, name='comment_delete'),
    path('like_change/<int:id>', views.like_change, name='like_change'),
    path('view_comment/<int:id>', views.view_comment, name='view_comment'),
]