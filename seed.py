from bs4 import BeautifulSoup
import urllib
from model import (Product, Tag, Product_Tag, connect_to_db, db)
from server import app

# result_file = open('data.txt', 'a')


goodeggs = ['https://www.goodeggs.com/sfbay/produce'
            # 'https://www.goodeggs.com/sfbay/dairy',
            # 'https://www.goodeggs.com/sfbay/meat',
            # 'https://www.goodeggs.com/sfbay/fish'
            # 'https://www.goodeggs.com/sfbay/deli#deli-pickles-pickles-new': 'Pickles'
            ]


def add_products(link):

    soup = urllib.urlopen(link).read()
    html = BeautifulSoup(soup, "html.parser")

    produce = html.find_all("div", class_="product-tile")

    site_url = "https://www.goodeggs.com"

    for product in produce:
        name = product.find("h5", class_="product-tile__product-name").get_text()
        price = float(product.find("span", class_="dollars").get_text() + "." + product.find("span", class_="cents").get_text())
        image = product.a["data-src"][2:]
        weight_and_unit = product.find("div", class_="product-tile__purchase-unit").get_text().split()
        weight = weight_and_unit[0]
        unit = (" ").join(weight_and_unit[1:])
        a = site_url + product.find("a", class_="js-product-link")["href"]

        # navigating to product detail page for more data
        prod_page = urllib.urlopen(a).read()
        html2 = BeautifulSoup(prod_page, "html.parser")
        categories = []
        crumbs = html2.select('div.breadcrumbs.gutter a')
        for crumb in crumbs:
            categories.append(crumb.get_text())
        description = html2.find("div", class_="description-body").get_text()

        #Create Product instance
        new_prod = Product(name=name, price=price, description=description,
                           aisle=categories[-2], category=categories[-1],
                           weight=weight, unit=unit, img=image)
        db.session.add(new_prod)
        db.session.commit()
        new_prod = Product.query.filter((Product.name == name), (Product.price == price)).one()

        # tags = []
        tag_elements = html2.select('div.filters a')

        for tag in tag_elements:

            if not Tag.query.filter(Tag.name == tag.get_text()).first():
                new_tag = Tag(name=tag.get_text())
                db.session.add(new_tag)
                db.session.commit()

            new_tag = Tag.query.filter(Tag.name == tag.get_text()).one()
            new_prod_tag = Product_Tag(tag_id=new_tag.tag_id, product_id=new_prod.product_id)
            db.session.add(new_prod_tag)
            db.session.commit()

        db.session.commit()

        """Note to self:
        1) Add tags to tags (if not already in tags)
        2) Add product to products
        3) FOR EACH TAG: Add tag_id and product_id to product_tags
        """

        # full_data = "{} | {} | {} | {} | {}".format(name.encode('utf-8'), price, weight, category_lg, image)
        # result_file.write(full_data)
        # try:
        #     result_file.write(name)
        #     result_file.write(str(price))
        #     result_file.write(image)
        #     result_file.write(weight)
        #     result_file.write("\n")
        # except UnicodeEncodeError:
        #     pass

# result_file.close()

if __name__ == "__main__":
    connect_to_db(app)

    db.create_all()
    add_products('https://www.goodeggs.com/sfbay/produce')
