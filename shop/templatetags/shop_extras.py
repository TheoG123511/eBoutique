from django import template
import random
register = template.Library()


@register.simple_tag()
def randomPrice(price):
    # you would need to do any localization of the result here
    try:
        return str(int(price) + ((random.randrange(50) / 100) * int(price)))
    except ValueError:
        return price
