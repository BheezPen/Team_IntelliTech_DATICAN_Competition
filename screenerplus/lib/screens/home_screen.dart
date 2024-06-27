import 'package:flutter/material.dart';
import 'package:screenerplus/screens/camera_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ScreenerPlus',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade300, Colors.purple.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You are welcome',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Text(
                        'Instructions:\n\n'
                        '1. Ensure your smartphone is equipped with a high-resolution camera (8MP+).\n\n'
                        '2. Attach the microscope lens to the camera of your smartphone.\n\n'
                        '3. Open the app and capture an image of the blood sample using the camera.\n\n'
                        '4. Alternatively, you can pick an existing image from your gallery.\n\n'
                        '5. Once the image is captured or selected, click on "Detect Malaria" to analyze the image.\n\n'
                        '6. The app will analyze the image using the on-device model.\n\n'
                        '7. The result screen will display the captured image along with the analysis result, indicating whether the blood sample contains malaria parasites or not.\n\n'
                        'Note: Ensure the image is clear and well-lit for accurate analysis.\n\n'
                        '\n\n                   Created by IntelliTech Team',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text('Get Started'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
