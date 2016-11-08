import requests
from os import environ
from flask import session
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
    recipe_list = set()
    app_id = environ["EDAMAM"]
    app_key = environ["EDAMAM_KEY"]

    params = []
    for param in param_list:
        params.append(param[-1])
    param_string = ('+').join(params)

    payload = {'app_id': app_id,
               'app_key': app_key,
               'q': param_string,
               'to': 5}

    r = requests.get(
        "https://api.edamam.com/search",
        params=payload)

    try:
        r.raise_for_status()
    except Exception as exc:
        print "There was a problem: {}".format(exc)

    print r.status_code

    edamam = r.json()
    recipes = edamam["hits"]

    for recipe in recipes:
        name = recipe["recipe"]["label"]
        image = recipe["recipe"]["image"]
        url = recipe["recipe"]["url"]
        ingredients = recipe["recipe"]["ingredientLines"]
        print name, "\n", ingredients, "\n", image
        recipe_list.add((name, url, image))

    if len(recipe_list) < 5 and len(params) > 1:
            get_recipes(params[1:])

    return recipe_list


def pay_for_cart():
    """Utilize stripe API"""

    placed_at = arrow.utcnow()
    customer = Customer.query.filter(Customer.email == session['email']).one()
    order = Order(customer_id=customer.customer_id, placed_at=placed_at,
                  total=session["cart_total"], pickup_id=1)  # change pickup!!!

    db.session.add(order)
    db.session.commit()

    order_id = Order.query(order_id).filter(customer_id == customer.customer_id,
                                            placed_at == placed_at).one()

    stripe.api_key = environ["STRIPE_TEST_SECRET"]
    stripe.Charge.create(amount=session["cart_total"] * 100,
                         currency="usd",
                         source="tok_189fZO2eZvKYlo2CQmX01NO3",  # obtained with Stripe.js
                         metadata={'order_id': order_id,
                                   'customer_id': customer.customer_id},
                         statement_descriptor="Farm to Front Door CSA",
                         description="Farm to Front Door CSA"
                         )

    try:
        ch = stripe.Charge.retrieve("ch_19ByqE2eZvKYlo2C8PjxIMGR",
                                    api_key="sk_test_BQokikJOvBiI2HlWgH4olfQ2"
                                    )
        ch.capture()
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
