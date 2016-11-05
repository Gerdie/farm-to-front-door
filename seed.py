from bs4 import BeautifulSoup
import urllib
from model import (Product, Tag, Product_Tag, connect_to_db, db)
from server import app


goodeggs = ['https://www.goodeggs.com/sfbay/produce',
            'https://www.goodeggs.com/sfbay/dairy',
            'https://www.goodeggs.com/sfbay/meat',
            'https://www.goodeggs.com/sfbay/fish'
            ]


def add_all(link_list):
    """Add list of links to scrape"""

    for link in link_list:
        add_products(link)


def add_products(link):

    soup = urllib.urlopen(link).read()
    html = BeautifulSoup(soup, "html.parser")

    produce = html.find_all("div", class_="product-tile")

    site_url = "https://www.goodeggs.com"
    img_url = "http://"

    for product in produce:

        name = product.find("h5", class_="product-tile__product-name").get_text().encode('utf-8')
        price = float(product.find("span", class_="dollars").get_text() + "." + product.find("span", class_="cents").get_text())

        if Product.query.filter(Product.name == name, Product.price == price).first() or not name or not price:
            continue

        image = img_url + product.a["data-src"][2:]
        weight_and_unit = product.find("div", class_="product-tile__purchase-unit").get_text().encode('utf-8').split()
        weight = weight_and_unit[0]
        unit = (" ").join(weight_and_unit[1:])
        price_per = product.find("span", class_="price-per")
        per_unit = product.find("span", class_="per-unit")
        if price_per and per_unit:
            price_per = float(price_per.get_text()[1:])
            per_unit = per_unit.get_text()
        a = site_url + product.find("a", class_="js-product-link")["href"]

        # navigating to product detail page for more data
        prod_page = urllib.urlopen(a).read()
        html2 = BeautifulSoup(prod_page, "html.parser")
        description = html2.find("div", class_="description-body").get_text().encode('utf-8')
        categories = []
        crumbs = html2.select('div.breadcrumbs.gutter a')

        for crumb in crumbs:
            categories.append(crumb.get_text())

        print name, price_per, price, per_unit

        #Create Product instance
        new_prod = Product(name=name, price=price, description=description,
                           aisle=categories[-2], category=categories[-1],
                           weight=weight, unit=unit, img=image, price_per=price_per,
                           per_unit=per_unit)

        db.session.add(new_prod)
        db.session.commit()
        print "***Added Product***"
        new_prod = Product.query.filter((Product.name == name), (Product.price == price)).one()

        tag_elements = html2.select('div.filters a')

        for tag in tag_elements:

            if not Tag.query.filter(Tag.name == tag.get_text()).first():
                new_tag = Tag(name=tag.get_text())
                db.session.add(new_tag)
                db.session.commit()
                print "***Added Tag***"

            new_tag = Tag.query.filter(Tag.name == tag.get_text()).one()
            new_prod_tag = Product_Tag(tag_id=new_tag.tag_id, product_id=new_prod.product_id)
            db.session.add(new_prod_tag)
            db.session.commit()
            print "***Added Product_Tag***"

        db.session.commit()


if __name__ == "__main__":
    connect_to_db(app)

    db.create_all()
    add_all(goodeggs)
