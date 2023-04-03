from django.shortcuts import render, redirect
from django.urls import reverse
from django.http import JsonResponse,HttpResponse
from .models import *
import datetime
import json
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def comment_add(request,product_id, path):
    cmt = Comment.objects.filter(product_id = product_id)
    path_current = ""
    cmt_current_length = 0
    print(path)
    print(product_id)
    if(cmt.count() == 0):
        path_current = "0001"
    else:
        cmt_last = Comment.objects.filter(path=path).filter(product_id=product_id)
        for ptu in cmt_last: # 1ptu
            cmt_current_length = ptu.path_length + 1
            break

        if path == "0000":
            is_create = 1
            path_lastest_obj = Comment.objects.filter(product_id=product_id).filter(path_length = cmt_current_length)
            path_lastest = path_lastest_obj.latest('id').path
            path_number = str(int(path_lastest) + 1)
            if len(path_number) < 4:
                for i in range(4-len(path_number)):
                    path_number = "0" + path_number
            path_current = path_number
        else:
            is_create = 0
            # path_lastest = Comment.objects.raw("SELECT id,path FROM comments_comment WHERE path LIKE '"+path+".\%' and path_length="+str(cmt_current_length))
            path_lastest_obj = Comment.objects.filter(product_id=product_id).filter(path__startswith = path).filter(path_length = cmt_current_length)

            if path_lastest_obj.count() != 0:
                path_current_temp = path_lastest_obj.latest('id').path
                path_obj =path_current_temp.split(".")
                path_number = str(int(path_obj[-1]) + 1)
                if len(path_number) < 4:
                    for i in range(4-len(path_number)):
                        path_number = "0" + path_number
                path_current = path + "." + path_number
            else:
                path_current = path + ".0001"
    body_unicode = request.body.decode('utf-8')
    data = json.loads(body_unicode)  
    comment = Comment.objects.create(
            content = data['content'],
            path = path_current,
            path_length = cmt_current_length,
            date_posting = datetime.date.today(),
            count_like = 0,
            product_id = Product.objects.get(id=product_id),
            user_id = request.user,
    )
    comment.save()
    # return redirect('product_detail', id=product_id)
    print(path_current)
    cmt_temp  = Comment.objects.filter(product_id=product_id).latest('id')
    
    context = {
        'is_create': is_create,
        'request_user_id': request.user.id,
        'id': cmt_temp.id,
        'content': cmt_temp.content,
        'count_like': cmt_temp.count_like,
        'path': cmt_temp.path,
        'check_like': 'nolike',
        'user_id': cmt_temp.user_id.id,
        'user_name': cmt_temp.user_id.name,
        'product_id': product_id,

    }
    json_cmt = json.dumps(context)
    return JsonResponse(json_cmt, safe=False)

@csrf_exempt
def comment_edit(request, product_id, id):
    comment = Comment.objects.get(id=id)
    body_unicode = request.body.decode('utf-8')
    data = json.loads(body_unicode)
    comment.content = data['content']
    comment.date_posting = datetime.date.today()
    comment.save()
    # return redirect('product_detail', id=product_id)
    return JsonResponse({'message': 'success'})

def comment_delete(request, id):
    print(id)
    comment = Comment.objects.get(id = id)
    other_comments = Comment.objects.filter(path__startswith=comment.path)
    for cmt in other_comments:
        cmt.delete()
    return JsonResponse({'message': 'success'})

@csrf_exempt
def like_change(request, id):
    body_unicode = request.body.decode('utf-8')
    data = json.loads(body_unicode)
    if data['like'] == 'delete like':
        like = Like.objects.filter(comment_id=id).get(user_id=request.user)
        like.delete()
        comment = Comment.objects.get(id=id)
        comment.count_like -= 1
        comment.save()
    else:
        like = Like.objects.create(
            comment_id = Comment.objects.get(id=id),
            user_id = request.user
        )
        comment = Comment.objects.get(id=id)
        comment.count_like += 1
        comment.save()
    return JsonResponse({'message': 'success'})

def view_comment(request, id):
    # comments = Comment.objects.filter(product_id=product).order_by('path')
    sql = '''SELECT DISTINCT(comments_comment.id), comments_comment.content, comments_comment.product_id_id,comments_comment.user_id_id, comments_comment.path,comments_comment.path_length,comments_comment.count_like,comments_like.user_id_id as check_like 
            FROM comments_comment 
                LEFT JOIN comments_like ON (comments_comment.id = comments_like.comment_id_id and comments_like.user_id_id = %s) 
                LEFT JOIN accounts_user ON comments_comment.user_id_id = accounts_user.id WHERE product_id_id = %s 
            GROUP BY comments_like.id,comments_comment.id, comments_comment.content, comments_comment.product_id_id,comments_comment.user_id_id,comments_comment.path, comments_comment.path_length,comments_comment.count_like
            ORDER BY comments_comment.path_length ASC, comments_comment.path ASC;'''
    params = (request.user.id, id)
    
    comments = Comment.objects.raw(sql, params)
    json_cmt = []
    for cmt in comments:
        json_cmt.append({
            'id': cmt.id,
            'content': cmt.content,
            'product_id': cmt.product_id.id,
            'user_id': cmt.user_id.id,
            'user_name': cmt.user_id.name,
            'path': cmt.path,
            'path_length':cmt.path_length,
            'check_like': cmt.check_like,
            'count_like': cmt.count_like
        })
    # json_cmt = dict(json_cmt)
    # print(json_cmt)
    json_cmt = json.dumps(json_cmt)
    print(json_cmt)
    return JsonResponse(json_cmt, safe=False)