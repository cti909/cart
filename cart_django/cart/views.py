from django.shortcuts import render,redirect
from django.views.decorators.csrf import csrf_exempt
from .models import *
from products.models import Product
import json
from decimal import *
from django.contrib import messages
import datetime
from django.http import HttpResponse,JsonResponse

def cart_home(request):
    # del request.session['id_cart']
    # del request.session['temple_cart']
    if request.user.is_authenticated:
        products = Cart.objects.filter(user_id = request.user)       
    elif 'temple_cart' in request.session:
        products = request.session.get('temple_cart')
        print(request.session.get('temple_cart'))
        temp = []
        for ptu in products:
            pro = Product.objects.get(id=ptu['product_id'])
            ptu = {
                'id': ptu['id'],
                'number':ptu['number'],
                'product_id':pro,
                }
            temp.append(ptu)
            # print(pro)
        products = temp
    else:
        products = None
    # product_detail = Product.objects.get(id=products.product_id)
    context = {'products': products}
    return render(request, 'cart_home.html', context)

# Create your views here.
@csrf_exempt
def cart_add(request):
    body_unicode = request.body.decode('utf-8')
    data = json.loads(body_unicode)
    if 'id_cart' not in request.session:
        request.session['id_cart'] = 1
    # print(data['product_id'])
    product_object = Product.objects.get(id=data['product_id'])

    if product_object.number == 0:
        # messages.add_message(request, messages.INFO, 'Empty od this product')
        context = {'message': 'Empty of this product'}
        return render(request,'cart_home.html', context)
    new_cart = {'id':request.session.get('id_cart'),
                'number': data['number'], 
                'product_id': data['product_id'],
                'user_id': None
                }
    if 'temple_cart' not in request.session:
        request.session['temple_cart'] = [new_cart]
    else:
        list_cart = request.session.get('temple_cart')
        list_cart.append(new_cart)
        request.session['temple_cart'] = list_cart
    request.session['id_cart'] += 1 
    request.session['product_cart_count'] = request.session['id_cart']-1
    # print(request.session.get('temple_cart'))

    if request.user.is_authenticated:
        cart_all = Cart.objects.filter(user_id = request.user)
        check = False
        for product_idx in cart_all:
            # print(data['product_id'])
            if product_idx.product_id.id == Decimal(data['product_id']):
                # cart = Cart.objects.get(id=product_idx.id)
                # cart.number = cart.number + Decimal(data['product_id'])
                # cart.save()
                # if messages:
                    # break
                # else:
                    # messages.add_message(request, messages.WARNING, 'Product existed from your cart') 
                    # check = True
            # return redirect('product_home')
                check = True
                break
        if check == False:
            cart = Cart.objects.create(
                        # name = data['name'], 
                        # image = data['url_image'],
                        number = data['number'], 
                        # price = data['price'],
                        product_id = product_object,
                        user_id = request.user
                        )
            cart.save()
        product_cart = Cart.objects.filter(user_id = request.user)
        request.session['product_cart_count'] = product_cart.count()
    # del request.session['id_cart']
    # del request.session['temp_le_cart']
    # context = {}
    # return render(request, 'home.html', context)
    # return redirect('product_home')
    return HttpResponse('Add oke')

def cart_edit(request, id, number):
    
    if request.method == 'POST':
        product = Product.objects.get(id=id)
        cart = Cart.objects.filter(user_id=request.user)
        cart.get(product_id=product.id)
        if request.user.is_authenticated:
            cart.number = request.POST.get('num')
            cart.save()
            return redirect('cart_home')
    else:
        cart = Cart.objects.get(id=id)
        product = Product.objects.get(id=cart.product_id.id)
        if request.user.is_authenticated:           
            context = {'product': product, 'number':number}
            return render(request, 'edit_cart.html', context)
       

def cart_delete(request, id):
    if request.user.is_authenticated:
        Cart.objects.filter(id=id).delete()
        request.session['product_cart_count'] -= 1
        return redirect('cart_home')
    else:
        request.session['product_cart_count'] -= 1
        print(id)
        index = 0
        if 'temple_cart' in request.session:
            list_cart = request.session.get('temple_cart')
            print(list_cart)
            for ptu in list_cart:
                if ptu['id'] == int(id):
                    list_cart.pop(index)
                index += 1
            request.session['temple_cart'] = list_cart
            return redirect('cart_home')

@csrf_exempt
def order_view(request):    
    # request.session['number_product'] = []
    if 'product_cart' in request.session:
        del request.session['product_cart']
    if 'product_cart_view' in request.session:
        del request.session['product_cart_view']
    if 'total_price' in request.session:
        del request.session['total_price']
    if request.user.is_authenticated:
        body_unicode = request.body.decode('utf-8')
        datas = json.loads(body_unicode)
        print(datas)
        if datas:
            # list_product = []
            total_all = 0
            auto_id = 1
            product_cart = []
            product_cart_view = []
            for data in datas:
                product = Cart.objects.get(id=data['cart_product_id'])
                product_checked = Product.objects.get(id=product.product_id.id)
                id = auto_id
                auto_id += 1
                name = product.product_id.name
                image = product.product_id.image.url
                price = product.product_id.price
                # number = int(request.POST.get('number'+id_product))
                number = int(data['number'])
                total = price*number
                total_all += total
                # print(product.product_id.image.url)
                if(product_checked.number > 0 ):
                    dic = {'id': id,
                            'name': name,
                            'image': image,
                            'number': number,
                            'price': price,
                            'total': total}
                    # list_product.append(dic)
                    temp = {
                            'id': data['cart_product_id'],
                            'number': number
                        }
                    
                    if 'product_cart_view' not in request.session:
                        request.session['product_cart_view'] = [dic]
                    else:
                        product_cart_view = request.session.get('product_cart_view')
                        product_cart_view.append(dic)
                        request.session['product_cart_view'] = product_cart_view

                    if 'product_cart' not in request.session:
                        request.session['product_cart'] = [temp]
                    else:
                        product_cart = request.session.get('product_cart')
                        product_cart.append(temp)
                        request.session['product_cart'] = product_cart
            if 'total_price' not in request.session:
                request.session['total_price'] = total_all   
            return JsonResponse({}, safe=False)
        else:
            return redirect('cart_home')
    else:
        return redirect('loginPage')

def order_view_temp(request):
    # data = request.session.get('product_cart_view')
    # for product in data:
    #     print(product)
    # del request.session['product_cart_view']
    # del request.session['product_cart']
    
    return render(request, 'payment_form.html',{})

def payment(request):
    if request.POST.get('receiver') == "" or request.POST.get('phone') == "" or request.POST.get('address') == "":
        # nhap ko du
        # messages.add_message(request, messages.WARNING, 'Incorrect input')
        return redirect('order_view')
    else:
        
        data = request.session.get('product_cart')
        # print(data)
        # order_detail = Order.objects.create
        receiver = request.POST.get('receiver')
        phone = request.POST.get('phone')
        address = request.POST.get('address')
        # id number
        data = request.session.get('product_cart')
        order = Order.objects.create(
                receiver = receiver,
                phone = phone,
                address = address,
                date = datetime.datetime.now(),
                user_id = request.user.id
            )
        order.save()
        id_order = Order.objects.latest('id')
        # print(id_order.id)
        for product in data:
            # print(product['id'])
            temp = Cart.objects.get(id=product['id'])
            pro = Product.objects.get(id=temp.product_id.id)
            name = pro.name
            price = pro.price
            # describe = pro.describe
            # producer = pro.producer
            image = pro.image
            order_detail = OrderDetail.objects.create(
                    name = name,
                    image =image,
                    number = product['number'],
                    price = price,
                    order_id = Order.objects.get(id=id_order.id)
                )    
            order_detail.save()
            tg = Cart.objects.filter(id=product['id'])
            tg.delete()
            delpro = Product.objects.get(id=temp.product_id.id)
            delpro.number = delpro.number - product['number']
            delpro.save()
        del request.session['product_cart']
        del request.session['product_cart_view']
        product_cart = Cart.objects.filter(user_id = request.user)
        request.session['product_cart_count'] = product_cart.count()
        return redirect('history_home')

def history_home(request):
    if request.user.is_authenticated:
        list_order = []
        order = Order.objects.filter(user_id=request.user.id)
        auto_id = 1
        # if auto_id % 2 == 1: color_table = 0 
        # else: color_table = 1
        for order_obj in order:
            total_price = 0
            tg = []      
            # print(order_obj.id)
            order_detail = OrderDetail.objects.filter(order_id=order_obj.id)
            # print(order_detail)
            for product in order_detail:
                # print(product)
                tmp = {
                    'name': product.name,
                    'number': product.number,
                    'price': product.price,
                    'total': product.number*product.price            
                }
                tg.append(tmp)
                total_price += product.number*product.price 
            # print(total_price)
            temp = {
                'auto_id': auto_id,
                'receiver': order_obj.receiver,
                'address': order_obj.address,
                'date': order_obj.date,
                'list_order': tg,
                'count': order_detail.count(),
                'total_price': total_price
            }
            auto_id += 1
            list_order.append(temp)    
        # print(len(list_order))
        context = {'products': list_order, 'order_count': len(list_order)}
        return render(request, 'history_home.html', context)
    else:
        return redirect('loginPage')
    