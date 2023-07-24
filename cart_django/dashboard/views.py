from django.shortcuts import render, redirect, reverse
from django.http import JsonResponse, HttpResponseRedirect
from products.models import *
from django.contrib import messages
from cart.models import *

def is_number(string):
    try:
        int(string)
        return True
    except ValueError:
        return False

def product_view(request, id):
    product = Product.objects.get(id=id)
    context = {'product': product}
    return render(request, 'product_view.html',context)

def product_add(request):
    # print(request.FILES)
    # print(request.POST.get('image'))

    if request.user.is_authenticated:
        if request.method == 'POST':
            if request.POST.get('name') == '' or request.POST.get('number') == '' or request.POST.get('price') == '' or request.POST.get('image') == '':
                messages.warning(request, 'You need enter name, number, price, image')
                return redirect('product_add')
            elif not is_number(request.POST.get('number')) or not is_number(request.POST.get('price')):
                messages.warning(request, 'Number and price is integer number')
                return redirect('product_add')
            else:
                number = int(request.POST.get('number'))
                price = int(request.POST.get('price'))
                if number <= 0: number = 0
                if price <=0: price = 0

                product = Product.objects.create(
                                                name = request.POST.get('name'),
                                                number = number,
                                                price = price,
                                                describe = request.POST.get('describe'),
                                                producer = request.POST.get('producer'),
                                                image = request.FILES['image'],
                                                user_id = request.user,
                                                category_id = Category.objects.get(name = request.POST.get('category'))
                )
                product.save()
                return redirect('dashboard')
        else: 
            # dic = {'action': 'Create'}
            categories = Category.objects.all()
            context = {
                'categories':categories,
                'product':None,
                'action': 'Add',
                'product_action': 'product_add'
            }
            return render(request, 'product_form.html',context)
    else:
        return redirect('loginPage')

def product_edit(request, id): 
    product = Product.objects.get(id=id)
    if request.user == product.user_id:
        if request.method == 'POST':
            if request.POST.get('name') == '' or request.POST.get('number') == '' or request.POST.get('price') == '':
                messages.warning(request, 'You need enter name, number, price, image')
                return HttpResponseRedirect("/dashboard/product_edit/"+str(id))
            elif not is_number(request.POST.get('number')) or not is_number(request.POST.get('price')):
                messages.warning(request, 'Number and price is integer number')
                return HttpResponseRedirect("/dashboard/product_edit/"+str(id))
            else:
                number = int(request.POST.get('number'))
                price = int(request.POST.get('price'))
                if number <= 0: number = 0
                if price <= 0: price = 0
                product.name = request.POST.get('name')
                product.number = number
                product.price = price
                product.describe = request.POST.get('describe')
                product.producer = request.POST.get('producer')
                product.category_id = Category.objects.get(name = request.POST.get('category'))
                request.POST.get('category')
                if 'image' in request.FILES:
                    product.image = request.FILES['image']
                product.save()
                return redirect('dashboard')
        else:
            categories = Category.objects.all()
            context = {
                'categories': categories,
                'product': product,
                'action': 'Edit',
                'product_action': 'product_edit'
            }
            return render(request, 'product_form.html', context)
    else:
        return redirect('dashboard')

def product_delete(request, id):
    product = Product.objects.filter(id=id)
    product.delete()
    return redirect('dashboard')

def dashboard(request):
    products = list(Product.objects.filter(user_id = request.user))
    # print(data)
    # return JsonResponse(data, safe=False)
    context = {'products': products}
    return render(request,'dashboard.html', context)

def statistical(request):
    products = Product.objects.filter(user_id=request.user)
    # order_detail_object = OrderDetail.objects.all().values('number','price','order_id')
    # order_object = Order.objects.all().values('id','user_id')
    
    product_total = 0
    for product in products:
        product_total += product.number

    # total_money = 0
    # list_order = []
    # for ptu in order_object:
    #     if (request.user.id == ptu['user_id']):
    #         list_order.append(ptu['id'])


    print(product_total)
    context = {
        'products': products,
        'product_count': products.count(),
        'product_total':product_total
    }
    return render(request, 'statistical.html', context)