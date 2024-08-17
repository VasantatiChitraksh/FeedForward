import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class Waste extends StatefulWidget {
  const Waste({super.key});

  @override
  State<Waste> createState() => _WasteState();
}

class _WasteState extends State<Waste> {
  XFile? imageSelected;
  String? output;
  late Interpreter interpreter;


  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    try {
      interpreter = await Interpreter.fromAsset('model.tflite');
      print('Model loaded successfully');
    } catch (e) {
      print('Error loading model: $e');
    }
  }

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageSelected = image;
      });
    }
  }

  Future<Uint8List> preprocessImage(File imageFile, int width, int height) async {
    final image = img.decodeImage(imageFile.readAsBytesSync())!;
    final resizedImage = img.copyResize(image, width: width, height: height);
    final input = resizedImage.getBytes();
    return input;
  }

  Future<String?> runInference() async {
    if (imageSelected == null) return null;

    final imageFile = File(imageSelected!.path);
    final input = await preprocessImage(imageFile, 384, 512); // Resize to 384x512

    // Create input tensor
    final inputTensor = input.reshape([1, 384, 512, 3]);

    // Create output tensor
    final outputTensor = List.filled(1 * 10, 0.0).reshape([1, 10]);

    // Run inference
    interpreter.run(inputTensor, outputTensor);

    // Process the output
    final outputList = outputTensor[0];
    final predictedClass = outputList.indexOf(outputList.reduce((a, b) => a > b ? a : b));
    
    setState(() {
      output = 'Predicted class: $predictedClass';
    });

    return output;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Waste Classification",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 400,
            child: imageSelected == null
                ? Image.asset('assets/re_nonre_vector.png')
                : Image.file(File(imageSelected!.path)),
          ),
          SizedBox(height: 90),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: IconButton(
                    onPressed: pickImage,
                    icon: Icon(Icons.upload, color: Colors.black)),
              ),
              SizedBox(width: 30),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: TextButton(
                    onPressed: runInference,
                    child: Text('Predict', style: TextStyle(color: Colors.black))),
              ),
            ],
          ),
          SizedBox(height: 20),
          output == null ? Text("") : Text(output!)
        ],
      ),
    );
  }
}
