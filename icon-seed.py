from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time


driver = webdriver.Chrome('/usr/bin/chromedriver')
link = 'https://thenounproject.com/search/?q='
icons = {}


def get_product_names(link):
    """Get product names from file
    Parse for search terms
    Use selenium to get icons"""

    # icons = {"apple": {"products": [], "link": url, "credit": credit}}

    with open('products.txt') as filename:
        for line in filename:
            print line
            line = line.rstrip().lower().split("|")
            product_id, term = line
            term = term.split()
            term = term[::-1]
            icon_exists = False

            for word in term:
                if word in icons:
                    icons[word]['products'].append(product_id)
                    icon_exists = True
                    print "exists!"
                    continue
                elif word[:-1] in icons:
                    icons[word[:-1]]['products'].append(product_id)
                    icon_exists = True
                    print "exists!"
                    continue

            if not icon_exists:
                term = term[0]
                print term
                driver.get(link + term)
                time.sleep(4)
                try:
                    icon = driver.find_element_by_css_selector("div.Grid-cell.loaded")  # div
                except Exception:
                    continue
                image = icon.find_element_by_tag_name('img').get_attribute("src")
                driver.get(icon.find_element_by_tag_name('a').get_attribute("href"))
                time.sleep(4)
                try:
                    name = driver.find_element_by_css_selector("h1.main-term").text  # h1
                    designer = driver.find_element_by_css_selector("span.designer").text  # span
                except Exception:
                    continue
                icons[term] = {"products": [product_id]}
                icons[term]["link"] = image
                icons[term]["credit"] = name + " " + designer
                print "Success!"


def write_to_file(icons):
    """Writes info from Selenium to file for use in pSQL later"""

    with open('icons.txt', 'a') as file1:
        for icon in icons:
            file1.write(icon)
            file1.write("|")
            try:
                file1.write(icons[icon]["credit"].decode('utf8'))
            except Exception:
                file1.write("Uncredited")
            file1.write("|")
            file1.write(icons[icon]["link"])
            file1.write("\n")

    with open('product_icons.txt', 'a') as file2:
        for icon in icons:
            for product in icons[icon]["products"]:
                file2.write(icon)
                file2.write("|")
                file2.write(product)
                file2.write("\n")

get_product_names(link)
driver.close()
write_to_file(icons)
print icons

# /Library/Java/JavaVirtualMachines/jdk1.8.0_111.jdk/contents/Home/bin/java -jar ~/Downloads/selenium-server-standalone-3.0.1.jar

# def add_icons(link):
#     """Add icon for each Product category"""

#     # terms = db.session.query(Product.name).all()
#     terms = ["Luscious Apple", "Pretty chicken", "delicious apple"]
#     hits = {}

#     for term in terms:
#         term = term.lower().split()
#         for word in term:
#             if word in hits:
#                 #add product id and icon id to association table
#                 hits[word] = hits.get(word) + 1
#                 continue
#         print term[-1]
#         r = requests.get(link + term[-1])
#         soup = r.text
#         html = BeautifulSoup(soup, "html.parser")
#         print html

#         icons = html.select("div.Grid-cell.loaded")
#         print icons
#         a = icons[0].a["href"]
#         a = "https://thenounproject.com" + a
#         r2 = requests.get(a)
#         soup2 = r2.text
#         html2 = BeautifulSoup(soup2, "html.parser")
#         name = html2.select("h1.main-term")[0].get_text()
#         designer = html2.select("span.designer")[0].a.get_text()
#         credit = name + " by " + designer
#         hits[term[-1].lower()] = 1
#         print credit


# if __name__ == "__main__":
#     connect_to_db(app)

#     db.create_all()
#     add_icons(link)
