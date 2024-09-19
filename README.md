<p align="center"> <img alt="App Design Preview" height="300" width="600" src="./ScreenerPlus_apk_by_Team_IntelliTech/screenshots/screenplus_shots.jpg" /> </p>

# ScreenerPlus Malaria Detector App

ScreenerPlus is a Flutter application that utilizes a deep learning model to detect malaria from blood smear images. This app allows users to either capture an image using the camera or pick an image from the gallery, process it, and then determine whether the image is positive or negative for malaria.

## Background


## Team
Our team name is Team IntelliTech.

## Featuresgit push 


- Capture images using the camera.
- Pick images from the gallery.
- Preprocess images to match the input requirements of the model.
- Use a TensorFlow Lite model to detect malaria.
- Display results of the detection.

## APK

Download the APK [here](./ScreenerPlus_apk_by_Team_IntelliTech/screenerplus.apk).

## Screenshots
See ScreenerPlus app [screenshots here](./ScreenerPlus_apk_by_Team_IntelliTech/screenshots/)
<p align="center">
   <img alt="App Designs" height="100" width="300" src="/ScreenerPlus_apk_by_Team_IntelliTech/screenshots/IMG-20240627-WA0072.jpg" />
   <img alt="App Designs" height="100" width="300" src="/ScreenerPlus_apk_by_Team_IntelliTech/screenshots/IMG-20240627-WA0080.jpg" />
</p>

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install)
- Compatible editor (e.g., [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio))
- TensorFlow Lite model (`malaria_AI_model.tflite`) trained for malaria detection.

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/DATICAN-UNDERGRADUATES-COMPETITION/Team-IntelliTech.git
   cd screenerplus
   ```

2. **Install dependencies:**


   ```bash
   flutter pub get
   ```

   
   ```bash
   pip install -r requirements.txt

   ```

3. **Add the TensorFlow Lite model:**

   Place your `malaria_AI_model.tflite` file in the `assets` directory.

4. **Run the application:**

   ```bash
   flutter run
   ```

### Usage

1. **Home Screen:**

   The home screen allows users to capture an image using the camera or pick an image from the gallery.

2. **Detection:**

   Once an image is selected, the app preprocesses it to match the model's input requirements and then runs the model to detect malaria.

3. **Result Screen:**

   After detection, the result screen displays whether the image is positive or negative for malaria.

### Model Preprocessing

The image is resized to 100x100 pixels and normalized before being fed into the model. This ensures the input data matches the model's expected input format.

### Error Handling

The app includes error handling to manage scenarios where the image cannot be processed or the model fails to run.

## Dependencies

- [Python](https://www.python.org/downloads)
- [image_picker](https://pub.dev/packages/image_picker)
- [tflite_flutter](https://pub.dev/packages/tflite_flutter)
- [flutter](https://flutter.dev/)
- [tensorflow](https://www.tensorflow.org)
- [flutter](https://flutter.dev/)
- [pandas](https://pandas.pydata.org/)
- [numpy](https://numpy.org/)
- [matplotlib](https://matplotlib.org/)


## Acknowledgments
git 
- The Flutter team for providing the framework.
- TensorFlow Lite for enabling on-device machine learning.
- The Python Software Foundation
- [The National Library of Medicine](https://lhncbc.nlm.nih.gov/LHC-downloads/downloads.html#malaria-datasets) for the Datasets


---
