import 'package:camera_demoo/screens/take_photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _navigateToTakePhoto(BuildContext context) {
    availableCameras().then((cameras) {
      print("Camera List=" + cameras.toString());
      final camera = cameras.first;
      Navigator.push(context,MaterialPageRoute(builder: (context) => TakePhoto(camera: camera)));
    });
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
            child: Center(child: Text('Take Picture & Upload!'), ),
          )
        ],
      ),

     

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (int index) {
          print(index);
          if (index == 0) {
            this._navigateToTakePhoto(context);
          }
        },
        items: [
          BottomNavigationBarItem(title: Text('Camera'),icon: Icon(Icons.camera_alt_rounded),
          ),
          BottomNavigationBarItem(title: Text('Upload'), icon: Icon(Icons.folder_open_rounded))
        ],
      ),

      
    );
  }
}
