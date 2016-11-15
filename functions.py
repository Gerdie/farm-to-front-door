from flask import session
from math import floor


def get_cart_weight(cart):
    """calculate weight of cart"""

    cart_weight = {'lb': 0,
                   'oz': 0}

    for item in cart:
        if item.unit in cart_weight:
            cart_weight[item.unit] += float(item.weight) * float(session["cart"][item.product_id])
        elif item.per_unit and item.price_per:
            cart_weight[item.per_unit] += float(item.price) / float(item.price_per) * float(session["cart"][item.product_id])
        else:
            cart_weight["fudged"] = True

    #smooth over decimal lbs and round up ounces if necessary
    if cart_weight['lb'] != floor(cart_weight['lb']):
        ozes = (cart_weight['lb'] - floor(cart_weight['lb'])) * 16.0
        cart_weight['lb'] = floor(cart_weight['lb'])
        cart_weight['oz'] += ozes
    if cart_weight['oz'] > 16:
        cart_weight['lb'] += floor(cart_weight['oz'] / 16)
        cart_weight['oz'] = cart_weight['oz'] % 16

    return cart_weight


def get_cart_total(cart):
    """Calculate total price of cart"""

    session["cart_total"] = 0.00

    for item in cart:
        session["cart_total"] += item.price * session['cart'][item.product_id]
    if session.get('delivery') and session['delivery']['delivery'] == unicode('delivery'):
        session["cart_total"] += 5.00

    session.modified = True
