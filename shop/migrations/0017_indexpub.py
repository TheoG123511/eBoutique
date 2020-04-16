# Generated by Django 2.2.11 on 2020-03-25 10:46

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0016_newsletter'),
    ]

    operations = [
        migrations.CreateModel(
            name='IndexPub',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField(default=django.utils.timezone.now, verbose_name="Date d'ajout")),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.Product')),
            ],
            options={
                'ordering': ['date'],
                'verbose_name': 'IndexPub',
            },
        ),
    ]
