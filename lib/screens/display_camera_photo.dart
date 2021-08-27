import 'package:flutter/material.dart';
import 'dart:io';

class DisplayPictureScreen extends StatelessWidget {
  
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Image.file(File(imagePath)),
      bottomNavigationBar: BottomNavigationBar(currentIndex: 1,
        items: [
          BottomNavigationBarItem(title: Text('Cancel'),icon: Icon(Icons.cancel_rounded)),
          BottomNavigationBarItem(title: Text('Save'),icon: Icon(Icons.save_rounded))
        ],
      ),
    );

  }
}