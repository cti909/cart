from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from .models import *
from comments.models import *
from .forms import ProductForm
from django.contrib import messages
from json import dumps
import os
import json
import math

def product_home(request):
    page_product_limit = 9

    get_sort_name = request.GET.get("sort_name")
    get_sort_field = request.GET.get("sort_field")
    get_search_token = request.GET.get("search_token")
    page_current = request.GET.get("page")

    product_sort = ""
    sort_field = "name"
    sort_name = "asc"
    search_token = ""

    if get_sort_field is not None:
        product_sort = get_sort_field
        sort_field = get_sort_field
    else:    
        product_sort = sort_field

    if get_sort_name is not None:
        if get_sort_name == "desc":
            product_sort = "-" + product_sort
            sort_name = "desc"

    if get_search_token is not None:
        search_token = get_search_token

    limit_start = 0
    limit_end = page_product_limit

    print(product_sort, search_token)
    
    if page_current is not None:
        page_current = int(page_current)
        limit_start = page_product_limit*(page_current-1)
        limit_end = page_product_limit*page_current
    else:
        page_current = 1

    product_count = 0
    if search_token == "":
        product_count = math.ceil(Product.objects.all().count()/page_product_limit)
    else:
        product_count = math.ceil(Product.objects.filter(name__icontains=search_token).count()/page_product_limit)
    products =Product.objects.filter(name__icontains=search_token).order_by(product_sort)[limit_start : limit_end]
    categories = Category.objects.all()
    fields = {"name","price","producer"}
    print(math.ceil(products.count()/page_product_limit))
    context = {
        'fields': fields,
        'page_current': page_current,
        'page_count': product_count,
        'sort_name': sort_name,
        'sort_field': sort_field,
        'search_token': search_token,
        'categories': categories,
        'products': products
    }
    return render(request,'home.html',context)

def product_categories(request, id):
    page_product_limit = 6
    get_sort_name = request.GET.get("sort_name")
    get_sort_field = request.GET.get("sort_field")
    get_search_token = request.GET.get("search_token")
    page_current = request.GET.get("page")
    product_sort = ""
    sort_field = "name"
    sort_name = "asc"
    search_token = ""
    limit_start = 0
    limit_end = page_product_limit

    if get_sort_field is not None:
        product_sort = get_sort_field
        sort_field = get_sort_field
    else:    
        product_sort = sort_field
    if get_sort_name is not None:
        if get_sort_name == "desc":
            product_sort = "-" + product_sort
            sort_name = "desc"
    if get_search_token is not None:
        search_token = get_search_token
    if page_current is not None:
        page_current = int(page_current)
        limit_start = page_product_limit*(page_current-1)
        limit_end = page_product_limit*page_current
    else:
        page_current = 1

    categories = Category.objects.all()
    if (id == 0):
        category = categories
    else:
        category = Category.objects.get(id=id)
    category_sub = category.get_descendants(include_self=True)
    products = Product.objects.filter(category_id__in=category_sub)
    product_count = 0
    if search_token == "":
        product_count = math.ceil(products.count()/page_product_limit)
    else:
        product_count = math.ceil(products.filter(name__icontains=search_token).count()/page_product_limit)
    products = products.filter(name__icontains=search_token).order_by(product_sort)[limit_start : limit_end]
    categories = Category.objects.all()
    fields = {"name","price","producer"}
    print(math.ceil(products.count()/page_product_limit))
    context = {
        'fields': fields,
        'page_current': page_current,
        'page_count': product_count,
        'sort_name': sort_name,
        'sort_field': sort_field,
        'search_token': search_token,
        'categories': categories,
        'products': products
    }
    return render(request,'home.html',context)

def product_detail(request, id):
    comments = Comment.objects.all()
    product = Product.objects.get(id = id)
    related_products = Product.objects.filter(category_id = product.category_id)
    related_products =related_products.exclude(id=id)[0 : 3]
    context = {
        'product': product, 
        'related_products': related_products,
        'related_products_count': len(related_products),
        'comments': comments
    }
    # return JsonResponse(data)
    return render(request, 'product_detail.html', context)


