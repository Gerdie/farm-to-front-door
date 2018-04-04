# Farm to Front Door

Farm to Front Door is a food delivery web app built in Python with Flask, SQLAlchemy & AngularJS. Database scraped from Good Eggs and the Noun Project, using BeautifulSoup and Selenium. Recipe suggestions pulled from Edamam API. Mapping with Google Maps Javascript API. Payment form using Stripe API. Using Twitter Bootstrap.

## Contents
- Tech Stack
- Features
- Installation
- About Me

## Tech Stack

Backend: Python, Flask, PostgreSQL, SQLAlchemy

Frontend: Javascript, AngularJS, jQuery, AJAX, HTML5, CSS3, Bootstrap

APIs: Edamam, Stripe, Google Maps Javascript & Geocoder

## Features

- Users can view the list of all products, filter products by category and search products by name.

![products page](https://github.com/Gerdie/farm-to-front-door/blob/master/static/img/products_page.jpg)

- Users can add products to their shopping cart, edit their cart, and choose their delivery or pickup options.

![product filtering](https://github.com/Gerdie/farm-to-front-door/blob/master/static/img/category_filters.jpg)

- The app will suggest recipes to the user based on the contents of their shopping cart.

![product filtering](https://github.com/Gerdie/farm-to-front-door/blob/master/static/img/cart.jpg)

- Users can mark recipes as "favorites."

![product filtering](https://github.com/Gerdie/farm-to-front-door/blob/master/static/img/recipe.jpg)

- Users can checkout and pay for their cart online by credit card.

![product filtering](https://github.com/Gerdie/farm-to-front-door/blob/master/static/img/checkout.jpg)

- Users can view past orders, favorite recipes and account information on their account page.

- Users can view a map of available pickup locations.

![product filtering](https://github.com/Gerdie/farm-to-front-door/blob/master/static/img/google_map.jpg)

Screenshots coming soon.

## Installation

Install PostgreSQL

To create and activate a virtual environment:
```
virtualenv env
source env/bin/activate
```

To install the project's dependencies:
```
pip install -r requirements.txt
```

To recreate the database:
```
createdb shop --encoding='utf-8' --locale=en_US.utf8 --template=template0
pg_restore shop database.sql
```

Create a secrets.sh file:
```
export EDAMAM="YOURKEYHERE"
export EDAMAM_KEY="YOURKEYHERE"
export STRIPE_TEST_SECRET="YOURKEYHERE"
export STRIPE_TEST_PUBLISHABLE="YOURKEYHERE"
export STRIPE_LIVE_SECRET="YOURKEYHERE"
export STRIPE_LIVE_PUBLISHABLE="YOURKEYHERE"
export GOOGLE_MAPS_KEY="YOURKEYHERE"
```

And source it:
```
source secrets.sh
```

## About Me

Farm to Front Door was developed by Maria Moy. Find her on [LinkedIn]
(http://www.linkedin.com/in/maria-k-moy) or [GitHub]
(http://www.github.com/gerdie). Maria is a software engineer and freelance WordPress developer living in San Francisco.