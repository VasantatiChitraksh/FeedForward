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
  String? output;

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
    var Output = jsonOutput['predicted_class'];
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 400,
            child: imageSelected == null
                ? Image.asset(
                    'assets/re_nonre_vector.png',
                  )
                : Image.file(
                    File(imageSelected!.path),
                  ),
          ),
          SizedBox(
            height: 90,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                child:
                    IconButton(onPressed: pickImage, icon: Icon(Icons.upload)),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                child: TextButton(onPressed: sendImage, child: Text('PREDICT')),
              ),
            ],
          ),
          SizedBox(height: 20,),
          output==null? Text("") : Text(output!)
        ],
      ),
    );
  }
}