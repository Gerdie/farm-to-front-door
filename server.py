from flask import (Flask, render_template, redirect, request, flash,
                   session, jsonify)
from jinja2 import StrictUndefined
from flask_debugtoolbar import DebugToolbarExtension
from model import (connect_to_db, db, Product, Recipe, Tag, Product_Tag, Customer,
                   Customer_Recipe, Pickup, Delivery, Dietary_Restriction,
                   Customer_Restriction, Order, Icon, Delivery_Quantity,
                   Order_Quantity)
from passlib.hash import pbkdf2_sha256
from math import floor
import api
import functions

app = Flask(__name__)

#Required to use Flask sessions, Debug toolbar
app.secret_key = "daksfhausdfskgbxpuseswlduc"

#For debugging - see Jinja fails
app.jinja_env.undefined = StrictUndefined
app.jinja_env.auto_reload = True


@app.route('/')
def show_home():
    """Display homepage"""

    return render_template("index.html")


@app.route('/login')  # currently using modal window instead of route...
def show_login():
    """Show login form"""

    pass


@app.route('/login', methods=['POST'])
def process_login():
    """Process login data. Add user_id to session"""

    email = request.form.get('email')
    password = request.form.get('password')

    user = db.session.query(Customer).filter(Customer.email == email).first()

    if user and pbkdf2_sha256.verify(password, user.password_hash):

        session['email'] = email
        if session.get('email'):
            flash("Login successful!")
            return "Success"
        else:
            return "CookieFail"

    else:

        return "Fail"


@app.route('/logout')
def process_logout():
    """Log user out, redirect to /products"""

    del session['email']

    flash("You have been logged out.")

    return redirect("/products")


@app.route('/register')
def show_register():
    """Show registration form"""

    return render_template("register.html")


@app.route('/register', methods=['POST'])
def process_registration():
    """Process user registration"""

    first_name = request.form.get("first_name")
    last_name = request.form.get("last_name")
    email = request.form.get("email")
    password = request.form.get("password")
    password = pbkdf2_sha256.encrypt(password, rounds=20000, salt_size=16)
    street_address = request.form.get("address")
    zipcode = request.form.get("zipcode")
    state = request.form.get("state")
    phone = request.form.get("phone")

    user = Customer(first_name=first_name, last_name=last_name, email=email,
                    password_hash=password, street_address=street_address,
                    zipcode=zipcode, state=state, phone=phone)

    db.session.add(user)
    db.session.commit()

    session['email'] = email
    if session.get('email'):
        flash("Registration successful! Welcome to Farm to Front Door.")
    else:
        flash("Please enable cookies to log in")

    return redirect("/products")


# @app.route('/products')
# def show_products():
#     """Query database for product list & display results"""

#     filters = request.args.get("filter")
#     session['filters'] = session.get('filters', [])
#     if filters in session['filters']:
#         session['filters'].remove(filters)
#     else:
#         session['filters'].append(filters)
#     if not session['filters']:
#         products = db.session.query(Product).all()
#     else:
#         products = db.session.query(Product).filter(Product.category.in_(session['filters'])).all()
#     categories = db.session.query(Product.category).group_by(Product.category).all()

#     return render_template("products.html", products=products, categories=categories)


@app.route('/products')
def filter_products():
    """Allow customers to filter products"""

    return render_template("filter.html")


@app.route('/search')
def show_search_results():
    """Query database for search results"""

    terms = request.args.get("terms").title()

    categories = db.session.query(Product.category).group_by(Product.category).all()
    products = db.session.query(Product).filter(Product.name.like('%' + terms + '%')).all()

    return render_template("products.html", products=products, categories=categories)


@app.route('/filters.json')
def serve_filtered_products_json():
    """Query database for product list & display results"""

    filters = request.args.getlist("filters")
    if filters:
        prods = db.session.query(Product).filter(Product.category.in_(filters)).order_by(Product.category).all()
    else:
        prods = db.session.query(Product).all()

    categories = db.session.query(Product.category).group_by(Product.category).all()
    products = {}
    for prod in prods:
        products[prod.product_id] = {"name": prod.name, "id": prod.product_id, "price": prod.price, "img": prod.img, "weight": prod.weight, "unit": prod.unit}
        # if prod.icon_id:
        #     products[prod.product_id]["icon"] = prod.icon.url

    return jsonify(**{"products": products, "categories": categories})


@app.route('/products', methods=["POST"])
def add_products_to_cart():
    """Add product to cart from button click"""

    product_id = int(request.form.get("productId"))  # this can be wrapped in a func to DRY up code
    product = Product.query.get(product_id)
    session["cart"] = session.get("cart", {})
    # session["cart_total"] = session.get("cart_total", 0) + product.price
    session["cart"][product_id] = session["cart"].get(product_id, 0) + 1

    cart = session["cart"]
    print cart

    return redirect("/products")


@app.route('/products/<int:product_id>')  # takes product_id as an INTEGER
def show_product_page(product_id):
    """Query database for product info and display results"""

    product = Product.query.get(product_id)

    return render_template("product_page.html", product=product)


@app.route('/products/<int:product_id>', methods=["POST"])  # takes product_id as an INTEGER
def add_product_to_cart(product_id):
    """Add product to cart from button click on prod page"""

    product_id = int(request.form.get("productId"))

    session["cart"] = session.get("cart", {})
    # session["cart_total"] = session.get("cart_total", 0) + product.price
    session["cart"][product_id] = session["cart"].get(product_id, 0) + 1

    cart = session["cart"]
    print cart

    return redirect('/products/' + str(product_id))


@app.route('/account')
def show_account():
    """Show user's info, past orders"""

    customer = db.session.query(Customer).filter(Customer.email == session['email']).one()

    return render_template("account.html", customer=customer)


@app.route('/locations')
def show_locations():
    """Show local pickup locations"""

    pickups = db.session.query(Pickup).filter(Pickup.pickup_id > 1).all()

    return render_template("locations.html", pickups=pickups)


# @app.route('/cart')
# def show_cart():
#     """Query session for cart contents and display results"""

#     cart_weight = {'lb': 0,
#                    'oz': 0}

#     recipes = []

#     if 'cart' in session:
#         cart = Product.query.filter(Product.product_id.in_(session['cart'].keys())).all()
#         print session['cart']

#         cart_weight = functions.get_cart_weight(cart)
#         functions.get_cart_total(cart)

#         #suggest recipes
#         product_names = api.split_params([item.name for item in cart])
#         recipes = api.get_recipes(product_names)

#     else:
#         cart = []

#     return render_template("cart.html", cart=cart, cart_weight=cart_weight, recipes=recipes)


@app.route('/cart')
def show_cart():
    """Query session for cart contents and display results"""

    return render_template("cart.html")


@app.route('/cart', methods=['POST'])
def update_cart():
    """Process delivery options"""

    delivery_type = request.json.get("delivery")
    big_address = request.json.get("address")
    street_address = big_address["street"]
    zipcode = big_address["zipcode"]
    print delivery_type, " is the delivery_type"
    print street_address, " is the street_address"
    print zipcode, " is the zipcode"

    if delivery_type and street_address and zipcode:
        session['delivery'] = {'delivery': delivery_type, 'address': street_address, 'zipcode': zipcode}
        print session['delivery']
        print session['cart']
        return "Success"
    else:
        return "Fail"


@app.route('/save-recipe', methods=['POST'])
def save_recipe():
    """Save recipe for customer"""

    recipe = request.json.get('recipe')
    print recipe
    customer_id = db.session.query(Customer.user_id).filter(Customer.email == session['email'])
    recipe_id = db.session.query(Recipe.recipe_id).filter(Recipe.url == recipe[unicode('url')]).first()
    if not recipe_id:
        new_recipe = Recipe(url=recipe[unicode('url')],
                            name=recipe[unicode('name')],
                            ingredients=recipe[unicode('ingredients')],
                            img=recipe[unicode('image')])
        db.session.add(new_recipe)
        db.session.commit()
        recipe_id = db.session.query(Recipe.recipe_id).filter(Recipe.url == recipe[unicode('url')]).first()

    customer_recipe = Customer_Recipe(customer_id=customer_id, recipe_id=recipe_id)

    db.session.add(customer_recipe)
    db.session.commit()

    return "Success"


@app.route('/checkout')
def check_out():
    """Check out"""

    cart = Product.query.filter(Product.product_id.in_(session['cart'].keys())).all()
    functions.get_cart_total(cart)

    return render_template("checkout.html", cart=cart)


@app.route('/checkout', methods=['POST'])
def process_payment():
    """Process payment"""

    cart = Product.query.filter(Product.product_id.in_(session['cart'].keys())).all()
    functions.get_cart_total(cart)

    api.pay_for_cart()

    return render_template("success.html")


@app.route('/add-item', methods=['POST'])
def add_to_cart_from_ng():
    """Update cart from Angular AJAX Post"""

    session['cart'] = session.get('cart', {})
    print session['cart']
    product_id = request.json.get('product_id')
    session['cart'][int(product_id)] = session['cart'].get(int(product_id), 0) + 1
    session.modified = True
    print session['cart']

    if int(product_id):
        return "Success!"
    else:
        return "Missing product id"


@app.route('/update-cart', methods=['POST'])
def update_cart_from_ng():
    """Update cart from dropdowns on cart page"""

    print session['cart']
    product_id = request.json.get('product_id')
    qty = request.json.get('qty')
    print product_id
    print qty

    if product_id and qty:
        session['cart'][int(product_id)] = int(qty)
        session.modified = True
        print session['cart']
        return "Success"
    else:
        return "Missing parameters"


@app.route('/delete-product', methods=['POST'])
def delete_from_cart():
    """Delete item from cart"""

    product_id = request.json.get('product_id')
    print session['cart']

    if product_id:
        del session['cart'][int(product_id)]
        session.modified = True
        print session['cart']
        return "Success"
    else:
        return "Missing product_id"


@app.route('/customer.json')
def get_customer_json():
    """Get customer info from database and return in json"""

    #throws an error if customer not logged in!

    if 'email' in session:

        customer = db.session.query(Customer).filter(Customer.email == session['email']).first()

        return jsonify(customer_id=customer.user_id, email=customer.email,
                       street_address=customer.street_address, zipcode=customer.zipcode,
                       state=customer.state)
    else:

        return jsonify(customer_id=None, email=None,
                       street_address=None, zipcode=None,
                       state=None)


# @app.route('/icons.json')
# def get_icons_json():
#     """Return icon urls via json"""

#     icons = request.args.get('icons')
#     response = db.session.query(Icon.url).filter(Icon.icon_id.in_(icons)).all()

#     if icons and response:
#         return jsonify(**{"icons": response})
#     else:
#         return "Fail"


@app.route('/cart.json')
def get_cart_json():
    """Gets product info from database and returns in json"""

    result_objects = db.session.query(Product).filter(Product.product_id.in_(session["cart"].keys())).all()
    result = {"contents": [], "cart": {}}

    for product_obj in result_objects:
        result["cart"][product_obj.product_id] = {"name": product_obj.name,
                                                  "qty": session["cart"][product_obj.product_id],
                                                  "description": product_obj.description,
                                                  "weight": product_obj.weight,
                                                  "unit": product_obj.unit,
                                                  "price": product_obj.price,
                                                  "price_per": product_obj.price_per,
                                                  "per_unit": product_obj.per_unit,
                                                  "product_id": product_obj.product_id,
                                                  "icon": None}
        if product_obj.icon_id:
            result["cart"][product_obj.product_id]["icon"] = product_obj.icon.url
        result["contents"].append(str(product_obj.product_id))
        print result["cart"]

    return jsonify(**result)


@app.route('/recipes.json')
def get_recipes_json():
    """Suggest recipes based on cart contents"""

    cart = Product.query.filter(Product.product_id.in_(session['cart'].keys())).all()

    product_names = api.split_params([item.name for item in cart])
    recipes = api.get_recipes(product_names)

    return jsonify(**{"results": recipes})


@app.route('/pickups.json')
def get_pickups_json():
    """Provide JSON for pickup locations"""

    pickup_json = {"locations": {}, "ids": []}
    pickups = Pickup.query.filter(Pickup.pickup_id > 1).all()

    for pickup in pickups:
        pickup_json["locations"][pickup.name] = {"id": pickup.pickup_id,
                                                 "name": pickup.name,
                                                 "description": pickup.description,
                                                 "address": pickup.street_address,
                                                 "zipcode": pickup.zipcode}
        pickup_json["ids"].append(pickup.name)

    return jsonify(**pickup_json)


@app.errorhandler(404)
def page_not_found(e):
    """Custom 404 page"""

    return render_template('404.html'), 404


if __name__ == "__main__":
    # Change app.debug to False before launch
    app.debug = True
    connect_to_db(app)

    # Use the DebugToolbar
    # DebugToolbarExtension(app)

    app.run(host="0.0.0.0")
