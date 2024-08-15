from flask import Flask, request, jsonify
from PIL import Image
from io import BytesIO
import google.generativeai as genai
import numpy as np
import requests
import tensorflow as tf
import os
import zipfile
import firebase_admin
from firebase_admin import credentials, storage


app = Flask(__name__)

# model = tf.keras.models.load_model('WasteDetectionModel(1).h5')

cred = credentials.Certificate('model.json')
firebase_admin.initialize_app(cred, {
    'storageBucket': 'feedforward-91744.appspot.com'
})

bucket = storage.bucket()

def download_model_from_firebase(model_filename):
    blob = bucket.blob(model_filename)
    local_filename = f'/tmp/{model_filename}'

    blob.download_to_filename(local_filename)
    return local_filename

local_model_path = download_model_from_firebase('WasteDetectionModel(1).h5')
model = tf.keras.models.load_model(local_model_path)

@app.route('/upload', methods=['POST'])
def upload():
    if 'file' not in request.files:
        return 'Missing Data', 400
  
    file = request.files['file']
    file_bytes = BytesIO(file.read())
    image = Image.open(file_bytes)

    image = image.resize((384,512))

    image_arr = np.array(image)/255.0
    image_arr = np.expand_dims(image_arr, 0)

    predictions = model.predict(image_arr)
    output = int(np.argmax(predictions[0]))

    if output in [0,1,2,3]:
        output = "Recyclable"
    else:
        output = "Non-Recyclable"

    print(output)
    return jsonify({'predicted_class': output})

    

if __name__ == "__main__":
    app.run(debug=True)