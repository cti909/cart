# Generated by Django 4.1.5 on 2023-03-10 07:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('comments', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='path',
            field=models.CharField(max_length=100, null=True),
        ),
    ]