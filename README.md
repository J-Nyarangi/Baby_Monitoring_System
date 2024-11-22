# **Baby Monitoring System**

## **Overview**
The Baby Monitoring System is an IoT-based mobile application designed to analyze and predict the reasons for a baby's cry. This system helps parents monitor their baby's well-being by collecting audio data and other environmental parameters, processing the information, and providing real-time alerts.

---

## **Features**
- **User Authentication**: Secure login for parents to access the system.
- **Cry Classification**: Analyzes audio cues from the baby to determine the cause of crying (e.g., hunger, discomfort, tired, etc.).
- **Sensor Integration**: Monitors environmental factors like temperature, humidity, and sound levels using ESP8266 and a microphone sensor.
- **Real-Time Alerts**: Provides timely notifications to parents on the baby's status via the mobile app.

---

## **Technologies Used**
- **Hardware**: ESP8266 Microcontroller, Microphone sensor.
- **Software**: Python, Flask, TensorFlow (for the cry classification model).
- **Database**: Firebase for storing user information and sensor data.
- **Mobile Application**: Developed using Flutter.

---

## **Installation**
### **Clone the Repository**
```bash
git clone https://github.com/yourusername/baby-monitoring-system.git
```

### **Install Dependencies**
- Ensure Python is installed.
- Install required Python packages:
```bash
pip install -r requirements.txt
```

### **Setup ESP8266**
- Connect the ESP8266 microcontroller and configure it to collect sound data.

---

## **Usage**
- Run the backend server using Flask:
```bash
python app.py
```
- Install the mobile application on your phone to interact with the system and receive alerts.
- The sensors will monitor the baby's environment, and the cry classification model will analyze audio data to predict the baby's needs.

---

## **Dataset**
The cry classification model is trained using the Donate-a-Cry dataset, which consists of labeled baby cry audio samples for various conditions (e.g., hunger, belly pain, discomfort, tired, burping).

---

## **Testing**
The system has been tested using different validation methods to ensure reliability and effectiveness. Tests cover both the software components (e.g., cry prediction model accuracy) and hardware components (e.g., sensor data accuracy).

---

## **Future Work**
- Integrate more sensors for enhanced monitoring.
- Expand the cry classification model to include more diverse cry types.
- Develop a web-based version of the application for added convenience.

---

## **License**
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## **Contributors**
- *Nyarangi Joyllette*

