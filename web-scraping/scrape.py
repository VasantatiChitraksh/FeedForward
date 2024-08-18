import requests
from bs4 import BeautifulSoup
import firebase_admin
from firebase_admin import credentials, firestore

cred = credentials.Certificate("firebase_ref.json")
firebase_admin.initialize_app(cred)

db = firestore.client()

def get_geotags(address):
    api_key = '271e15cf1a004fe0933d56e6a85b345b'
    url = f"https://api.opencagedata.com/geocode/v1/json?q={address}&key={api_key}&language=en&p271e15cf1a004fe0933d56e6a85b345bretty=1"
    
    print(url)
    response = requests.get(url)
    print('inside geo fun')
    
    try:
        data = response.json()
        if data['results']:
            location = data['results'][0]['geometry']
            print(location['lat'])
            print(location['lng'])
            add_to_firestore(location['lat'], location['lng'])
    finally:
        return None, None

def add_to_firestore(latitude, longitude):
    print('in firebase')
    doc_ref = db.collection("foodbank").document()
    print(doc_ref)
    doc_ref.set({
        'location' : firestore.GeoPoint(latitude, longitude),
        'username' : 'na',
        'name' : 'AkshayPatra',
    })
    print('did firebase')

def getRequiredData(url):
    response = requests.get(url=url)

    soup = BeautifulSoup(response.text, 'html.parser')

    divs = soup.find_all('div', class_='row card-body')

    for div in divs:
        inner_divs = div.find_all('div', class_=['col-lg-4 col-md-4 col-sm-4'])
        
        for inner_div in inner_divs:
            p_tags = inner_div.find_all('p')

            if len(p_tags) > 1:
                p_address = p_tags[0]
                # print((p_address))

                addresses = p_address.find('span').get_text()
                print(addresses)
                print(type(addresses))
                lat, lon = get_geotags(addresses)
                

url = "https://www.akshayapatra.org/kitchen-addresses/"
<<<<<<< HEAD
getRequiredData(url)
=======
getRequiredData(url)
>>>>>>> parent of fa2abf9 (Merge branch 'main' of https://github.com/VasantatiChitraksh/FoodBankManagement)
