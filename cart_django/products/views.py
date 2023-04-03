from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from .models import *
from comments.models import *
from .forms import ProductForm
from django.contrib import messages
from json import dumps
import os
import json

def product_home(request):
    # them product vao cart
    # print(request.user)
    # if 'catagory' in request.session:
    #     products.filter(catagory_id__contains = request.session.get('catagory'))
    products =Product.objects.all()
    token = ""
    if 'search' in request.session:      
        search = request.session.get('search').lower()
        token = request.session.get('search')
        products = Product.objects.filter(name__icontains = search)
        
    if 'field' in request.session:
        field = request.session.get('field')
        print(field)
        products = products.order_by(request.session.get('field'))

    if 'category' in request.session:
        category = request.session.get('category')
        if category != 'all':
            cate = Category.objects.get(name = category)
            products = products.filter(category_id = cate)
    
    context = {
        'products': products,
        'token': token
        }
    return render(request,'home.html',context)

def product_category(request, category):
    request.session['category'] = category
    print(category)
    return redirect('product_home')

def product_search(request):
    token = request.POST.get('search')
    request.session['search'] = token
    # products = Product.objects.filter(name__contains = token)
    # context = {'products':products}
    # return render(request, 'home.html', context)
    return redirect('product_home')

def product_sort(request):
    field = request.POST.get('field')
    sort = request.POST.get('sort')
    if field == None or sort == None:
        # xu ly
        return redirect('product_home')
    if sort == 'desc':
        field = '-' + field

    request.session['field'] = field
    # products = Product.objects.order_by(field)
    
    # context = {'products': products}
    # return render(request, 'home.html', context)
    return redirect('product_home')

def product_detail(request, id):
    comments = Comment.objects.all()
    product = Product.objects.get(id = id)
    related_products = Product.objects.filter(category_id = product.category_id)
    related_products =related_products.exclude(id=id)
    
    # data = []
    # for pro in related_products:
    #     if pro.id == id:
    #         continue
    #     temp = {
    #         'name': pro.name,
    #         'number': pro.number,
    #         'price': pro.price,
    #         'describe': pro.describe,
    #         'producer': pro.producer,
    #         'image': pro.image,
    #     }
    #     data.append(temp)
    # dataJSON = dumps(data)
    # print(dataJSON)
    
    # comments = Comment.objects.filter(product_id=product).order_by('path')
    sql = '''SELECT DISTINCT(comments_comment.id), comments_comment.content, comments_comment.product_id_id,comments_comment.user_id_id, comments_comment.path,comments_comment.path_length,comments_like.user_id_id as check_like 
            FROM comments_comment 
                LEFT JOIN comments_like ON (comments_comment.id = comments_like.comment_id_id and comments_like.user_id_id = %s) 
                LEFT JOIN accounts_user ON comments_comment.user_id_id = accounts_user.id WHERE product_id_id = %s 
            GROUP BY comments_like.id,comments_comment.id, comments_comment.content, comments_comment.product_id_id,comments_comment.user_id_id,comments_comment.path, comments_comment.path_length
            ORDER BY comments_comment.path ASC;'''
    params = (request.user.id, id)
    
    # comments = Comment.objects.raw(sql, params)
    # json_cmt = []
    # for cmt in comments:
    #     json_cmt.append({
    #         'comment_id': cmt.id,
    #         'comment_content': cmt.content,
    #         'product_id': cmt.product_id.id,
    #         'user_id_id': cmt.user_id.id,
    #         'path': cmt.path,
    #         'path_length':cmt.path_length,
    #         'check_like': cmt.check_like
    #     })
    # json_cmt = json.dumps(json_cmt)
    # print(json_cmt)
    # for comment in comments:
    #     str = comment.path
    #     likes = Like.objects.filter(comment_id = comment)
    #     # print(likes.query)
    #     comment.count_likes = likes.count()
    #     # kiem tra request.user da like chua
    #     for like in likes:
    #         if request.user == like.user_id:
    #             comment.is_like = True
    #             break
    #         else:
    #             comment.is_like = False
    context = {
        # 'comment_detail': json_cmt,
        'product': product, 
        'related_products': related_products,
        'comments': comments
        }
    # return JsonResponse(data)
    return render(request, 'product_detail.html', context)


