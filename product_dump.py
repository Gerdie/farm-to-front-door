from model import (Product, connect_to_db, db)
from server import app


def write_products_to_file():
    """So I can access product info w/ Selenium outside of Vagrant, pSQL"""

    f = open('products.txt', 'a')
    product_names = db.session.query(Product.product_id, Product.name).all()

    for product in product_names:
        f.write(str(product[0]))
        f.write('|')
        f.write(product[1].encode("utf-8"))
        f.write('\n')

    f.close()


if __name__ == "__main__":

    connect_to_db(app)
    write_products_to_file()
