from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import create_engine  # probably a bad idea...
from sqlalchemy_utils import ArrowType
import arrow


db = SQLAlchemy()


class Dietary_Restriction(db.Model):
    """Dietary Restriction. i.e. Vegan, Gluten-Free, Organic"""

    __tablename__ = "dietary_restrictions"

    diet_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name = db.Column(db.String(100), nullable=False, unique=True)

    def __repr__(self):

        return "<Dietary_Restriction diet_id={} name={}>".format(self.diet_id,
                                                                 self.name)


class Customer(db.Model):
    """Customer of Farm to Front Door"""

    __tablename__ = "customers"

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    first_name = db.Column(db.String(100), nullable=True)
    last_name = db.Column(db.String(100), nullable=True)
    email = db.Column(db.String(100), nullable=False, unique=True)
    password_hash = db.Column(db.String(500), nullable=False)
    street_address = db.Column(db.String(100), nullable=True)
    zipcode = db.Column(db.String(15), nullable=True)
    state = db.Column(db.String(2), nullable=True)
    phone = db.Column(db.String(30), nullable=True)

    orders = db.relationship("Order", backref="customer")

    diets = db.relationship("Dietary_Restriction",
                            secondary="customer_restrictions",
                            backref="customers")

    recipes = db.relationship("Recipe",
                              secondary="customer_recipes",
                              backref="customers")

    def __repr__(self):

        return "<Customer id={}, first_name={}, last_name={}, email={}>".format(self.user_id,
                                                                                self.first_name,
                                                                                self.last_name,
                                                                                self.email)


class Customer_Restriction(db.Model):
    """Association table. Relates Customer class to Dietary_Restriction class."""

    __tablename__ = "customer_restrictions"

    cust_restr_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    customer_id = db.Column(db.Integer, db.ForeignKey('customers.user_id'), nullable=False)
    diet_id = db.Column(db.Integer, db.ForeignKey('dietary_restrictions.diet_id'), nullable=False)

    def __repr__(self):

        return "<Customer_Restriction cust_restr_id={}, customer_id={}, diet_id={}>".format(self.cust_restr_id,
                                                                                            self.customer_id,
                                                                                            self.diet_id)


class Pickup(db.Model):
    """Pickup locations"""

    __tablename__ = "pickups"

    pickup_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name = db.Column(db.String(100), nullable=True)
    street_address = db.Column(db.String(100), nullable=False)
    description = db.Column(db.String(100), nullable=False)
    zipcode = db.Column(db.String(15), nullable=False)
    state = db.Column(db.String(2), nullable=False, default="CA")

    def __repr__(self):

        return "<Pickup pickup_id={}, name={}, street_address={}, zipcode={}>".format(self.pickup_id,
                                                                                      self.name,
                                                                                      self.street_address,
                                                                                      self.zipcode)


class Icon(db.Model):
    """Icon for web usage"""

    __tablename__ = "icons"

    icon_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    url = db.Column(db.String(500), nullable=False)
    credit = db.Column(db.String(100), nullable=False)

    def __repr__(self):

        return "<Icon icon_id={} url={} credit={}>".format(self.icon_id,
                                                           self.url,
                                                           self.credit)


class Product(db.Model):
    """Product sold by Farm to Front Door"""

    __tablename__ = "products"

    product_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name = db.Column(db.String(200), nullable=False)
    description = db.Column(db.Unicode, nullable=True)  # db.Text(collation='utf8', convert_unicode=True)
    weight = db.Column(db.Numeric(asdecimal=False), nullable=True)  # db.Numeric(asdecimal=False)
    unit = db.Column(db.String(50), nullable=True)
    price = db.Column(db.Numeric(asdecimal=False), nullable=False)  # db.Numeric(asdecimal=False)
    price_per = db.Column(db.Numeric(asdecimal=False), nullable=True)  # db.Numeric(asdecimal=False)
    per_unit = db.Column(db.String(50), nullable=True)
    aisle = db.Column(db.String(50), nullable=True)
    category = db.Column(db.String(50), nullable=True)
    img = db.Column(db.String(500), nullable=True)
    icon_id = db.Column(db.Integer, db.ForeignKey('icons.icon_id'), nullable=True)
    color = db.Column(db.String(10), nullable=True)
    search_term = db.Column(db.String(50), nullable=True)
    search_strength = db.Column(db.Integer, nullable=True)

    icon = db.relationship("Icon", backref="products")

    tags = db.relationship("Tag",
                           secondary="product_tags",
                           backref="products")

    delivery_qty = db.relationship("Delivery_Quantity", backref="product")

    order_qty = db.relationship("Order_Quantity", backref="product")

    def __repr__(self):

        return "<Product product_id={} name={} weight={} unit={} price={}>".format(self.product_id,
                                                                                   self.name,
                                                                                   self.weight,
                                                                                   self.unit,
                                                                                   self.price)


class Tag(db.Model):
    """Tag for products i.e. Certified Organic, Locally Grown"""

    __tablename__ = "tags"

    tag_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name = db.Column(db.String(100), nullable=False, unique=True)

    def __repr__(self):

        return "<Tag tag_id={} name={}>".format(self.tag_id, self.name)


class Product_Tag(db.Model):
    """Association table relating Tag class to Product class"""

    __tablename__ = "product_tags"

    prod_tag_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    product_id = db.Column(db.Integer, db.ForeignKey('products.product_id'), nullable=False)
    tag_id = db.Column(db.Integer, db.ForeignKey('tags.tag_id'), nullable=False)

    def __repr__(self):

        return "<Product_Tag prod_tag_id={} product_id={} tag_id={}>".format(self.prod_tag_id,
                                                                             self.product_id,
                                                                             self.tag_id)


class Recipe(db.Model):
    """Recipe pulled from Edamam API"""

    __tablename__ = "recipes"

    recipe_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    url = db.Column(db.String(300), nullable=False)
    name = db.Column(db.String(100), nullable=False)
    ingredients = db.Column(db.JSON, nullable=False)
    img = db.Column(db.String(300), nullable=True)

    def __repr__(self):

        return "<Recipe name={} ingredients={} url={} img={}>".format()


class Customer_Recipe(db.Model):
    """Association table for Recipes each Customer has liked"""

    __tablename__ = "customer_recipes"

    cust_rec_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    customer_id = db.Column(db.Integer, db.ForeignKey('customers.user_id'), nullable=False)
    recipe_id = db.Column(db.Integer, db.ForeignKey('recipes.recipe_id'), nullable=False)

    def __repr__(self):

        return "<Customer_Recipe cust_rec_id={} customer_id={} recipe_id={}>".format(self.cust_rec_id,
                                                                                     self.customer_id,
                                                                                     self.recipe_id)


class Delivery(db.Model):
    """A delivery of incoming products, composed of Delivery-Quantities"""

    __tablename__ = "deliveries"

    delivery_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    vendor = db.Column(db.String(500), nullable=True)
    received_at = db.Column(ArrowType, nullable=False)  # or db.DateTime v. db.TimeStamp?

    quantities = db.relationship("Delivery_Quantity", backref="delivery")

    def __repr__(self):

        return "<Delivery delivery_id={} vendor={} received_at={}>".format(self.delivery_id,
                                                                           self.vendor,
                                                                           self.received_at)


class Delivery_Quantity(db.Model):
    """An amount of a certain product, in each delivery"""

    __tablename__ = "delivery_quantities"

    deliv_qty_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    product_id = db.Column(db.Integer, db.ForeignKey("products.product_id"), nullable=False)
    product_qty = db.Column(db.Integer, nullable=False)
    delivery_id = db.Column(db.Integer, db.ForeignKey("deliveries.delivery_id"), nullable=False)

    def __repr__(self):

        return "<Delivery_Quantity deliv_qty_id={} product_id={} product_qty={} delivery_id={}>".format(self.deliv_qty_id,
                                                                                                        self.product_id,
                                                                                                        self.product_qty,
                                                                                                        self.delivery_id)


class Order(db.Model):
    """An order placed by a customer, composed of Order-Quantities"""

    __tablename__ = "orders"

    order_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    customer_id = db.Column(db.Integer, db.ForeignKey("customers.user_id"), nullable=False)
    placed_at = db.Column(ArrowType, nullable=False)  # or db.DateTime v. db.TimeStamp?
    total = db.Column(db.Numeric, nullable=False)
    pickup_id = db.Column(db.Integer, db.ForeignKey("pickups.pickup_id"), nullable=False)
    received_at = db.Column(ArrowType, nullable=True)  # or db.DateTime v. db.TimeStamp?

    pickup = db.relationship("Pickup", backref="orders")

    quantities = db.relationship("Order_Quantity", backref="order")

    def __repr__(self):

        return "<Order order_id={} customer_id={} total={} placed_at={} received_at={}>".format(self.order_id,
                                                                                                self.customer_id,
                                                                                                self.total,
                                                                                                self.placed_at,
                                                                                                self.received_at)


class Order_Quantity(db.Model):
    """An amount of a certain product, in each order"""

    __tablename__ = "order_quantities"

    order_qty_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    product_id = db.Column(db.Integer, db.ForeignKey("products.product_id"), nullable=False)
    product_qty = db.Column(db.Integer, nullable=False, default=1)
    order_id = db.Column(db.Integer, db.ForeignKey("orders.order_id"), nullable=False)

    def __repr__(self):

        return "<Order_Quantity order_qty_id={} product_id={} product_qty={} order_id={}>".format(self.order_qty_id,
                                                                                                  self.product_id,
                                                                                                  self.product_qty,
                                                                                                  self.order_id)


def connect_to_db(app, database='postgresql:///shop'):
    """Connect the database to Flask app."""

    # Configure to use PostgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = database
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)


def example_data():
    """Populate test database"""

    user1 = Customer(first_name="Jane", last_name="Doe", email="Jane@jane.com",
                     password_hash="$pbkdf2-sha256$20000$GuPc.z/HmPN.LwUA4FwLQQ$B8HsLHPOCBO2YFBoeF9IVS2UbB78QxoWVrnWG8Nb6h0")
    user2 = Customer(first_name="Susie", last_name="Q", email="Susie@jane.com",
                     password_hash="$pbkdf2-sha256$20000$GuPc.z/HmPN.LwUA4FwLQQ$B8HsLHPOCBO2YFBoeF9IVS2UbB78QxoWVrnWG8Nb6h0",
                     street_address="100 Main St", zipcode="90210", state="CA")
    pickup = Pickup(name="Parnassus Farmers' Market (UCSF)", description="Wednesdays: 10 a.m-3 p.m.",
                    street_address="505 Parnassus Avenue", zipcode="94122", state="CA")
    icon = Icon(url="https://d30y9cdsu7xlg0.cloudfront.net/png/404999-200.png", credit="Blackberry Jam By Nikita Kozin, RU")
    order = Order(customer_id=1, placed_at=arrow.utcnow(), total=35.00, pickup_id=1)
    product = Product(name="Organic Blackberries", description="Sweet and tart, these delicious blackberries are the perfect fall fruit.",
                      weight=6, unit="oz", price_per=3.99, price=3.99, per_unit="oz", aisle="Produce",
                      category="New & Peak Season", img="http://goodeggs2.imgix.net/product_photos/NmgHoSgSqmShNF10cLni_blackberries_01.jpg?w=380&h=238&fm=jpg&q=41&fit=crop",
                      icon_id=1)
    recipe = Recipe(name="Persimmon Cosmopolitan", url="http://foodandstyle.com/2012/12/20/persimmon-cosmopolitan/",
                    ingredients="1 lb (454gr) very ripe fuyu or hachiya persimmons (3 medium) \u2013 peeled and cut in 1\u201d pieces, 1 tablespoon fresh lime juice, 4 oz (118ml) vodka, 3 oz (89ml) persimmon pur\u00e9e, 1 oz (30ml) fresh lime juice, 1 oz (30ml) st. germain elderflower liqueur, 2 dashes lemon bitters, 2 lime wheels as garnish",
                    img="https://www.edamam.com/web-img/536/536f7846c9def37bad1b763922c31c29.jpg")
    customer_recipe = Customer_Recipe(recipe_id=1, customer_id=1)
    tag = Tag(name="Organic")
    product_tag = Product_Tag(product_id=1, tag_id=1)

    db.session.add_all([user1, user2, pickup, icon, recipe, tag])
    db.session.commit()
    db.session.add_all([order, product, customer_recipe])
    db.session.commit()
    db.session.add(product_tag)
    db.session.commit()


if __name__ == "__main__":
    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.

    from server import app
    connect_to_db(app)
    print "Connected to DB."
