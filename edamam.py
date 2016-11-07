import requests
from os import environ

# app_id = environ["EDAMAM"]
# app_key = environ["EDAMAM_KEY"]

# payload = {'app_id': app_id,
#            'app_key': app_key,
#            'q': 'chicken+basil',
#            'to': 5}

# r = requests.get(
#     "https://api.edamam.com/search",
#     params=payload)


# edamam = r.json()
# recipes = edamam["hits"]

# for recipe in recipes:
#     name = recipe["recipe"]["label"]
#     image = recipe["recipe"]["image"]
#     url = recipe["recipe"]["url"]
#     ingredients = recipe["recipe"]["ingredientLines"]
#     print name, "\n", ingredients, "\n", image

def split_params(param_list):

    params = []
    for param in param_list:
        param = param.split()
        for adj in ['Organic', 'Fresh', '(Frozen)', 'Pre-Washed']:
            if adj in param:
                param.remove(adj)
        params.append(param)
    return params


def get_recipes(param_list):
    recipe_list = set()
    app_id = environ["EDAMAM"]
    app_key = environ["EDAMAM_KEY"]

    params = []
    for param in param_list:
        params.append(param[-1])
    param_string = ('+').join(params)

    payload = {'app_id': app_id,
               'app_key': app_key,
               'q': param_string,
               'to': 5}

    r = requests.get(
        "https://api.edamam.com/search",
        params=payload)

    try:
        r.raise_for_status()
    except Exception as exc:
        print "There was a problem: {}".format(exc)

    print r.status_code

    edamam = r.json()
    recipes = edamam["hits"]

    for recipe in recipes:
        name = recipe["recipe"]["label"]
        image = recipe["recipe"]["image"]
        url = recipe["recipe"]["url"]
        ingredients = recipe["recipe"]["ingredientLines"]
        print name, "\n", ingredients, "\n", image
        recipe_list.add((name, url, image))

    if len(recipe_list) < 5 and len(params) > 1:
            get_recipes(params[1:])

    return recipe_list
