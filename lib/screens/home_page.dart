import 'dart:io';

import 'package:camera_demoo/screens/display_selected_files.dart';
import 'package:camera_demoo/screens/take_photo.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late String uploadPath ="";

  void _navigateToTakePhoto(BuildContext context) {
    availableCameras().then((cameras) {
      print("Camera List=" + cameras.toString());
      final camera = cameras.first;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => TakePhoto(camera: camera)));
    });
  }

  void _selectDocsFromGallery(BuildContext context) async {
    var result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      print(files);
      Navigator.of(context).push(  MaterialPageRoute(  builder: (context) => DisplaySelectedFiles(files),),);
      
      
    } else {
      // User canceled the picker
      print('cancelled');
    }
  }

  void _selectImageFromGallery(BuildContext context) async {

    var image = await  ImagePicker.platform.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );
    
    print((image?.path).toString());
    List<File> files = [];
    files.add(new File((image?.path).toString()));

    Navigator.of(context).push(  MaterialPageRoute(  builder: (context) => DisplaySelectedFiles(files),),);

     
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            child: Center(
              child: Text('Take Picture & Upload!'),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (int index) {
          print(index);
          if (index == 0) {
            this._navigateToTakePhoto(context);
          } else if (index == 1) {
            this._selectDocsFromGallery(context);
          } else if (index == 2) {
            this._selectImageFromGallery(context);
          }
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Camera'),
            icon: Icon(Icons.camera_alt_rounded),
          ),
          BottomNavigationBarItem(
              title: Text('Upload Docs!'), icon: Icon(Icons.folder_open_rounded)),
          BottomNavigationBarItem(
              title: Text('Upload Image!'), icon: Icon(Icons.photo_album_rounded)),
        ],
      ),
    );
  }
}

class _selectDocsFromGallery {}
