# Generated by Django 3.0.3 on 2020-03-06 18:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('profile', '0005_auto_20200306_1920'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='endDate',
            field=models.DateTimeField(verbose_name='Date de fin de la commande'),
        ),
    ]
