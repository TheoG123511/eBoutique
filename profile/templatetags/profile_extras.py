from django import template
register = template.Library()


@register.simple_tag()
def multiply(qty, unit_price, *args, **kwargs):
    # you would need to do any localization of the result here
    return qty * unit_price


@register.simple_tag()
def getQuery(dictionnary, key):
    try:
        print("dictionaire= ", dictionnary)
        print("key = ", key)
        return dictionnary[str(key)]
    except KeyError:
        return False


@register.filter(name='lookup')
def lookup(value, arg):
    return value[str(arg)]