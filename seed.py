from bs4 import BeautifulSoup
import urllib

result_file = open('data.txt', 'a')


goodeggs = {'https://www.goodeggs.com/sfbay/produce': 'Produce',
            'https://www.goodeggs.com/sfbay/dairy': 'Dairy'
            # 'https://www.goodeggs.com/sfbay/meat': 'Meat',
            # 'https://www.goodeggs.com/sfbay/fish': 'Fish',
            # 'https://www.goodeggs.com/sfbay/deli#deli-pickles-pickles-new': 'Pickles'
            }


for link in goodeggs:

    soup = urllib.urlopen(link).read()
    html = BeautifulSoup(soup, "html.parser")

    category_lg = goodeggs[link]

    produce = html.find_all("div", class_="product-tile")

    site_url = "https://www.goodeggs.com"

    for product in produce:
        name = product.find("h5", class_="product-tile__product-name").get_text()
        price = float(product.find("span", class_="dollars").get_text() + "." + product.find("span", class_="cents").get_text())
        image = product.a["data-src"][2:]
        weight = product.find("div", class_="product-tile__purchase-unit").get_text()
        a = site_url + product.find("a", class_="js-product-link")["href"]
        categories = {}
        # navigating to product detail page for more data
        prod_page = urllib.urlopen(a).read()
        html2 = BeautifulSoup(prod_page, "html.parser")
        crumbs = html2.select('div.breadcrumbs.gutter a')
        for index, crumb in enumerate(crumbs):
            categories[index] = crumb.get_text()
        description = html2.find("div", class_="description-body").get_text()
        tags = {}
        tags_list = html2.select('div.filters a')
        for index, tag in enumerate(tags_list):
            tags[index] = tag.get_text()

        full_data = "{} | {} | {} | {} | {}".format(name.encode('utf-8'), price, weight, category_lg, image)
        result_file.write(full_data)
        # try:
        #     result_file.write(name)
        #     result_file.write(str(price))
        #     result_file.write(image)
        #     result_file.write(weight)
        #     result_file.write("\n")
        # except UnicodeEncodeError:
        #     pass

result_file.close()
