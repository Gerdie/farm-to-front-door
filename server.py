from flask import (Flask, render_template, redirect, request, flash,
                   session)
app = Flask(__name__)

#Required to use Flask sessions
app.secret_key = "I<3Food!"


@app.route('/')
def show_home():
    """Display homepage"""

    return render_template('index.html')


@app.route('/login')
def show_login():
    """Show login form"""

    pass


@app.route('/login', methods=['POST'])
def process_login():
    """Process login data. Add user_id to session"""

    pass


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

    pass


@app.route('/products/<int:product_id>')
def show_product_page(product_id):
    """Query database for product info and display results"""

    pass


@app.route('/cart')
def show_cart():
    """Query session for cart contents and display results"""

    pass


@app.route('/cart', methods=['POST'])
def process_order():
    """Process order and update database"""

    pass


