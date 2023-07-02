from flask import Flask
# from app import app
from flask import request
import tensorflow as tf
import cv2
import shutil
import random
from apscheduler.schedulers.background import BackgroundScheduler

app = Flask(__name__)
predicted_label = ""

@app.route("/predict", methods=['POST'])
def prediction():
    request.files['file'].save('image/image.jpg')
    model = tf.keras.models.load_model('models.h5')
    class_names = {
        0: 'Encroachment',
        1: 'Footpath Quality',
        2: 'Obstruction',
        3: 'Unsafe Zone',
        4: 'Waste',
    }

    image = cv2.imread('image/image.jpg')
    if image is None:
        return 'Failed to read the image file'

    # Resize to match the expected input shape
    image = cv2.resize(image, (224, 224))
    image = image / 255.0  # Normalize pixel values to [0, 1]

    # # Add a batch dimension
    image = tf.expand_dims(image, axis=0)

    # # Make a prediction
    pred = model.predict(image)

    # # Get the predicted class index
    class_index = tf.argmax(pred, axis=1)[0].numpy()

    predicted_label = class_names[class_index]
    return predicted_label


@app.route("/correction", methods=['POST'])
def correction():
    num = random.random()
    predicted_label = request.form['text']
    image_dest = 'image/image.jpg'
    dest = f'{predicted_label}/{num}_image.jpg'
    shutil.move(image_dest, dest)
    return "corrected"


# @app.route("/training", methods=['POST'])
def train():
    #code to retrain the model goes here using the corrected dataset#
    return "Retrain succesfull"
scheduler = BackgroundScheduler()
scheduler.add_job(func=train(), trigger="interval", seconds=604800)
scheduler.start()