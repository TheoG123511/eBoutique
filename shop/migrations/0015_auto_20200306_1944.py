# Generated by Django 3.0.3 on 2020-03-06 18:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0014_images_alt'),
    ]

    operations = [
        migrations.RenameField(
            model_name='images',
            old_name='alt',
            new_name='title',
        ),
    ]