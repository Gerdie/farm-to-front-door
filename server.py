from flask import (Flask, render_template, redirect, request, flash,
                   session)
from model import (connect_to_db, db, Product, Recipe, Tag, Product_Tag, Customer,
                   Customer_Recipe, Pickup, Delivery, Dietary_Restriction,
                   Customer_Restriction, Order, Icon, Delivery_Quantity,
                   Order_Quantity)

app = Flask(__name__)

#Required to use Flask sessions, Debug toolbar
app.secret_key = "I<3Food!"


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
    password = request.form.get('password')  # use encrypted hash later

    session['email'] = email  # if i am using user's email as a user id...

    flash("Email: {} | Password: {}".format(email, password))  # for debugging

    return redirect("/products")


@app.route('/logout')
def process_logout():
    """Log user out, redirect to /products"""

    del session['email']

    flash("You have been logged out.")

    return redirect("/products")


@app.route('/register')
def show_register():
    """Show registration form"""

    pass


@app.route('/register', methods=['POST'])
def process_registration():
    """Process user registration"""

    pass


@app.route('/products')
def show_products():
    """Query database for product list & display results"""

    return render_template("products.html")


@app.route('/products/<int:product_id>')  # takes product_id as an INTEGER
def show_product_page(product_id):
    """Query database for product info and display results"""

    return render_template("product_page.html", product_id=product_id)


@app.route('/cart')
def show_cart():
    """Query session for cart contents and display results"""

    return render_template("cart.html")


@app.route('/cart', methods=['POST'])
def process_order():
    """Process order and update database"""

    pass


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
