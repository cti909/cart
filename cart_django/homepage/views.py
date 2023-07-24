from django.shortcuts import render
from cart.models import *
from accounts.models import *

# Create your views here.
def homepage(request):
    if request.user.is_authenticated:
        product_cart = Cart.objects.filter(user_id=request.user)
        request.session['product_cart_count'] = product_cart.count()
    else:
        if 'temple_cart' in request.session:
            request.session['product_cart_count'] = len(request.session['temple_cart'])
        else:
            request.session['product_cart_count'] = 0
    if 'product_cart_count' in request.session:
        print(request.session['product_cart_count'])
    # print(request.user.is_autheticated)
    return render(request,'homepage.html')