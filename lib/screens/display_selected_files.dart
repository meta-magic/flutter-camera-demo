import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DisplaySelectedFiles extends StatelessWidget {
   List<File> files;

  DisplaySelectedFiles(this.files);

  void _upload(int index) async {

     

  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload File Path'),
      ),
      body: Column(
        children: [Image.file(File(this.files[0].path))],
      ),
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
