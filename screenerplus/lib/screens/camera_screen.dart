import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'package:screenerplus/screens/result_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  Interpreter? _interpreter;
  final picker = ImagePicker();
  bool _loading = false;
  String _result = '';

  @override
  void initState() {
    super.initState();
    _initInterpreter();
  }

  Future<void> _initInterpreter() async {
    try {
      _interpreter =
          await Interpreter.fromAsset('assets/malaria_AI_model.tflite');
      print('Interpreter loaded successfully.');
    } catch (e) {
      print('Failed to load model: $e');
    }
  }

  Future<void> _getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _detectMalaria() async {
    if (_image == null || _interpreter == null) return;

    setState(() {
      _loading = true;
    });

    try {
      // Preprocess input image
      var input = _preprocessImage(_image!);

      // Perform inference asynchronously
      var output = List.generate(1, (index) => List.filled(1, 0.0));
      _interpreter!.run(input, output);

      _handleOutput(output as List<List<double>>); // Ensure correct type
    } catch (e) {
      print('Failed to run model: $e');
      setState(() {
        _loading = false;
        _result = 'Failed to run model';
      });
    }
  }

  void _handleOutput(List<List<double>> output) {
    setState(() {
      _loading = false;
      _result = output[0][0] > 0.5
          ? 'Positive'
          : 'Negative'; // Adjust based on your model output format
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(image: _image, result: _result),
      ),
    );
  }

  img.Image resizeImage(img.Image src, int width, int height) {
    return img.copyResize(src, width: width, height: height);
  }

  List<List<List<List<double>>>> _preprocessImage(File imageFile) {
    // Decode image
    img.Image? image = img.decodeImage(imageFile.readAsBytesSync());

    if (image == null) {
      throw Exception("Could not decode image");
    }

    // Resize image to 100x100 using the utility function
    img.Image resizedImage = resizeImage(image, 100, 100);

    // Normalize image data
    List<List<List<List<double>>>> input = List.generate(
      1,
      (i) => List.generate(
        100,
        (y) => List.generate(
          100,
          (x) {
            img.Pixel pixel = resizedImage.getPixel(x, y);
            return [
              pixel.r / 255.0, // Red
              pixel.g / 255.0, // Green
              pixel.b / 255.0, // Blue
            ];
          },
        ),
      ),
    );

    return input;
  }

  // void _handleOutput(List<List<double>> output) {
  //   setState(() {
  //     _loading = false;
  //     _result = output[0][0] > 0.5 ? 'Positive' : 'Negative'; // Adjust based on your model output format
  //   });

  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => ResultScreen(image: _image, result: _result),
  //     ),
  //   );
  // }

  @override
  void dispose() {
    if (_interpreter != null) {
      _interpreter!.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Malaria Detector'),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _image == null
                  ? Text(
                      'No image selected.',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  : Image.file(_image!),
              SizedBox(height: 20),
              _loading
                  ? CircularProgressIndicator()
                  : Column(
                      children: [
                        ElevatedButton(
                          onPressed: _getImageFromCamera,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            textStyle: TextStyle(fontSize: 18),
                          ),
                          child: Text('Capture Image'),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _getImageFromGallery,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            textStyle: TextStyle(fontSize: 18),
                          ),
                          child: Text('Pick Image from Gallery'),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _detectMalaria,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            textStyle: TextStyle(fontSize: 18),
                          ),
                          child: Text('Detect Malaria'),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
