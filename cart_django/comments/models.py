from django.db import models
from accounts.models import *
from products.models import *

# Create your models here.
class Comment(models.Model):
    id = models.AutoField(primary_key=True)
    content = models.CharField(max_length=200)
    path = models.CharField(max_length=100, blank=True)
    path_length = models.IntegerField()
    date_posting = models.DateField()
    count_like = models.IntegerField()
    product_id = models.ForeignKey(Product, on_delete=models.CASCADE)
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    def __str__(self):
        return self.path

class Like(models.Model):
    id = models.AutoField(primary_key=True)
    comment_id = models.ForeignKey(Comment, on_delete=models.CASCADE)
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    def __str__(self):
        return str(self.comment_id.path)