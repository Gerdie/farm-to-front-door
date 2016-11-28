import requests
from os import environ
from flask import session, request
import stripe
from model import (connect_to_db, db, Product, Recipe, Tag, Product_Tag, Customer,
                   Customer_Recipe, Pickup, Delivery, Dietary_Restriction,
                   Customer_Restriction, Order, Icon, Delivery_Quantity,
                   Order_Quantity)
import arrow


def split_params(param_list):

    params = []
    for param in param_list:
        param = param.split()
        for adj in ['Organic', 'Fresh', '(Frozen)', 'Pre-Washed']:
            if adj in param:
                param.remove(adj)
        params.append(param)
    return params


def get_recipes(param_list):
    recipe_list = []
    app_id = environ["EDAMAM"]
    app_key = environ["EDAMAM_KEY"]

    params = []
    for param in param_list:
        params.append(param[-1])
    param_string = ('+').join(params)

    payload = {'app_id': app_id,
               'app_key': app_key,
               'q': param_string,
               'to': 4}

    r = requests.get(
        "https://api.edamam.com/search",
        params=payload)

    try:
        r.raise_for_status()
    except Exception as exc:
        print "There was a problem: {}".format(exc)

    # print r.status_code

    edamam = r.json()
    recipes = edamam["hits"]
    # query = db.session.query(Product.name, Product.icon_id).filter(Product.product_id.in_(session['cart'])).all()

    for recipe in recipes:
        name = recipe["recipe"]["label"]
        image = recipe["recipe"]["image"]
        url = recipe["recipe"]["url"]
        ingredients = recipe["recipe"]["ingredientLines"]
        # icons = []
        # for prod_name, prod_icon in query:
        #     for param in param_list:
        #         if ' '.join(param) in prod_name and prod_icon:
        #             icons.append(prod_icon)
        #             continue

        recipe_list.append({"name": name, "ingredients": ingredients, "image": image, "url": url})

    if len(recipe_list) < 4 and len(params) > 1:
            get_recipes(params[1:])

    return recipe_list[:4]


def pay_for_cart():
    """Utilize stripe API"""

    placed_at = arrow.utcnow()
    print "placed at ", placed_at
    customer = db.session.query(Customer).filter(Customer.email == session['email']).one()
    print "customer ", customer
    order = Order(customer_id=customer.user_id, placed_at=placed_at,
                  total=session["cart_total"], pickup_id=1)  # change pickup!!!

    print "order = ", order
    db.session.add(order)
    print "added order"
    db.session.commit()
    print "committed order"

    order_id = db.session.query(Order.order_id).filter(Order.customer_id == customer.user_id,
                                                       Order.placed_at == placed_at).one()
    print order_id, " is the order_id!!!!!!!!!!!!"

    token = request.form.get('stripeToken')

    print "token is ", token

    stripe.api_key = environ["STRIPE_TEST_SECRET"]

    try:
        stripe.Charge.create(amount=int(session["cart_total"] * 100),
                             currency="usd",
                             source=token,  # obtained with Stripe.js
                             metadata={'order_id': order_id[0],
                                       'customer_id': customer.user_id},
                             statement_descriptor="Farm to Front Door CSA",
                             description="Farm to Front Door CSA"
                             )
        del session['cart']
        del session['cart_total']
    except stripe.error.CardError as e:
        # Since it's a decline, stripe.error.CardError will be caught
        body = e.json_body
        err = body['error']

        print "Status is: %s" % e.http_status
        print "Type is: %s" % err['type']
        print "Code is: %s" % err['code']
        # param is '' in this case
        print "Param is: %s" % err['param']
        print "Message is: %s" % err['message']
    except stripe.error.RateLimitError as e:
        # Too many requests made to the API too quickly
        pass
    except stripe.error.InvalidRequestError as e:
        # Invalid parameters were supplied to Stripe's API
        pass
    except stripe.error.AuthenticationError as e:
        # Authentication with Stripe's API failed
        # (maybe you changed API keys recently)
        pass
    except stripe.error.APIConnectionError as e:
        # Network communication with Stripe failed
        pass
    except stripe.error.StripeError as e:
        # Display a very generic error to the user, and maybe send
        # yourself an email
        pass
    except Exception as e:
        # Something else happened, completely unrelated to Stripe
        pass
