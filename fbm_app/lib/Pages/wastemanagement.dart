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
  Interpreter? interpreter;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    try {
      interpreter = await Interpreter.fromAsset('assets/model.tflite');
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

  Future<Uint8List> preprocessImage(File imageFile) async {
    final image = img.decodeImage(imageFile.readAsBytesSync())!;
    final resizedImage = img.copyResize(image, width: 512, height: 384);
    final input = Float32List(1 * 384 * 512 * 3);

    for (int i = 0; i < 384; i++) {
      for (int j = 0; j < 512; j++) {
        final pixel = resizedImage.getPixel(j, i);
        input[(i * 512 + j) * 3] = img.getRed(pixel) / 255.0;
        input[(i * 512 + j) * 3 + 1] = img.getGreen(pixel) / 255.0;
        input[(i * 512 + j) * 3 + 2] = img.getBlue(pixel) / 255.0;
      }
    }

    return input.buffer.asUint8List();
  }

  Future<void> runInference() async {
    if (interpreter == null) {
      print('Interpreter not loaded');
      return;
    }

    if (imageSelected == null) {
      print('No image selected');
      return;
    }

    File imageFile = File(imageSelected!.path);
    final input = await preprocessImage(imageFile);
    final output =
        List.filled(6, 0.0).reshape([1, 6]); 

    interpreter!.run([input], [output]);

    final predictedClassIndex = output[0]
        .indexWhere((e) => e == output[0].reduce((a, b) => a > b ? a : b));
    setState(() {
      this.output = 'Predicted class: $predictedClassIndex';
    });
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
                    child:
                        Text('Predict', style: TextStyle(color: Colors.black))),
              ),
            ],
          ),
          SizedBox(height: 20),
          output == null ? Text("Waiting for prediction...") : Text(output!)
        ],
      ),
    );
  }
}
