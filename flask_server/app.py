from flask import Flask, request, jsonify
import numpy as np
import librosa
import tensorflow as tf
import json

app = Flask(__name__)

# Load the pre-trained model
model = tf.keras.models.load_model('infant_audio_classification.keras')

# Define the class labels (ensure they match the labels used during training)
labels = ['hungry', 'discomfort', 'belly_pain', 'burping', 'tired']

@app.route('/upload', methods=['POST'])
def upload_audio():
    # Ensure data is received
    data = request.get_json()
    if data is None:
        return jsonify({"error": "No data received"}), 400

    # Convert the data to a numpy array
    audio_data = np.array(data, dtype=np.float32)
    
    # Normalize audio data (center around 0)
    audio_data = (audio_data - np.mean(audio_data)) / np.max(np.abs(audio_data))
    
    # Compute MFCCs
    sample_rate = 16000  # Adjust based on actual sampling rate on ESP8266
    mfccs = librosa.feature.mfcc(y=audio_data, sr=sample_rate, n_mfcc=13)
    
    # Pad or truncate MFCCs to the required length (200 in this case)
    max_pad_len = 200
    if mfccs.shape[1] < max_pad_len:
        mfccs = np.pad(mfccs, ((0, 0), (0, max_pad_len - mfccs.shape[1])), mode='constant')
    else:
        mfccs = mfccs[:, :max_pad_len]
    
    # Reshape for model input (1, 200, 13, 1)
    mfccs_input = mfccs.T[np.newaxis, ..., np.newaxis]
    
    # Make a prediction
    prediction = model.predict(mfccs_input)
    predicted_class = np.argmax(prediction, axis=1)[0]
    predicted_label = labels[predicted_class]
    
    # Return the prediction as JSON
    return jsonify({"predicted_class": predicted_label})

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
