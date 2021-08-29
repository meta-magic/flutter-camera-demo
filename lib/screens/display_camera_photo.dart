import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class DisplayPictureScreen extends StatefulWidget {
  
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  _DisplayPictureScreenState createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {

  void _upload(int index) async {

    print('Index='+index.toString());
    print('Path='+widget.imagePath);

    var request = http.MultipartRequest("POST", Uri.parse("http://192.168.1.7:8888/"));
   
    var pic = await http.MultipartFile.fromPath("file",widget.imagePath);
    request.files.add(pic);
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Image.file(File(widget.imagePath)),
      bottomNavigationBar: BottomNavigationBar(currentIndex: 1,
        items: [
          BottomNavigationBarItem(title: Text('Cancel'),icon: Icon(Icons.cancel_rounded)),
          BottomNavigationBarItem(title: Text('Save'),icon: Icon(Icons.save_rounded))
        ],
        onTap: _upload,
      ),
    );

  }
}