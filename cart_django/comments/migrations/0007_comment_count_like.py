# Generated by Django 4.1.5 on 2023-03-20 08:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('comments', '0006_comment_path_length'),
    ]

    operations = [
        migrations.AddField(
            model_name='comment',
            name='count_like',
            field=models.IntegerField(default=5),
            preserve_default=False,
        ),
    ]
