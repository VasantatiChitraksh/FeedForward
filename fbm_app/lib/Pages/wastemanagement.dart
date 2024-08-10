import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class waste extends StatefulWidget {
  const waste({super.key});

  @override
  State<waste> createState() => _wasteState();
}

class _wasteState extends State<waste> {
  XFile? imageSelected;
  var output;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageSelected = image;
      });
    }
  }

  Future sendImage() async {
    final file = await File(imageSelected!.path);
    final filebytes = await file.readAsBytes();
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://127.0.0.1:5000/upload'));

    request.files.add(http.MultipartFile.fromBytes(
      'file',
      filebytes,
      filename: imageSelected!.name,
    ));
    var response = await request.send();
    var responsebody = await response.stream.bytesToString();
    var jsonOutput = jsonDecode(responsebody);
    var Output = jsonOutput['output'];
    print(Output);
    setState(() {
      output = Output;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classify Waste'),
        centerTitle: true,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
