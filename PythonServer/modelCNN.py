from flask import Flask, request, jsonify
from PIL import Image
from io import BytesIO
import google.generativeai as genai
import numpy as np
import requests
import tensorflow as tf
import os
import zipfile

app = Flask(__name__)

model = tf.keras.models.load_model('WasteDetectionModel(1).h5')


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