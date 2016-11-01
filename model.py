from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Dietary_Restriction(db.Model):
    """Dietary Restriction. i.e. Vegan, Gluten-Free, Organic"""

    __tablename___ = "dietary_restrictions"

    diet_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name = db.Column(db.String(100), nullable=False)

    def __repr__(self):

        return "<Dietary_Restriction diet_id={} name={}>".format(self.diet_id,
                                                                 self.name)


class Customer(db.Model):
    """Customer of Farm to Front Door"""

    __tablename___ = "customers"

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    first_name = db.Column(db.String(100), nullable=True)
    last_name = db.Column(db.String(100), nullable=True)
    email = db.Column(db.String(100), nullable=False)
    password_hash = db.Column(db.String(500), nullable=False)
    street_address = db.Column(db.String(100), nullable=True)
    zipcode = db.Column(db.String(15), nullable=True)
    state = db.Column(db.String(2), nullable=True)

    def __repr__(self):

        return "<Customer id={}, first_name={}, last_name={}, email={}>".format(self.user_id,
                                                                                self.first_name,
                                                                                self.last_name,
                                                                                self.email)


class Customer_Restriction(db.Model):
    """Association table. Relates Customer class to Dietary_Restriction class."""

    __tablename__ = "customer_restrictions"

    cust_restr_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    cust_id = db.Column(db.Integer, db.ForeignKey('customers.user_id'), nullable=False)
    diet_id = db.Column(db.Integer, db.ForeignKey('dietary_restrictions.diet_id'), nullable=False)

    def __repr__(self):

        return "<Customer_Restriction cust_restr_id={}, cust_id={}, diet_id={}>".format(self.cust_restr_id,
                                                                                        self.cust_id,
                                                                                        self.diet_id)
