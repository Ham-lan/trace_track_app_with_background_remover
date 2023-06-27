import 'package:camera/camera.dart';
import 'package:camera_app/button.dart';
import 'package:camera_app/get_gallery_image.dart';
import 'package:camera_app/get_image.dart';
import 'package:flutter/material.dart';

class NavigateAhead extends StatelessWidget {
  List<CameraDescription> cameras;
  NavigateAhead({Key? key,  required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track and Track App' , style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.3 ,),
          Row(
            children: [
              SizedBox(width:MediaQuery.of(context).size.width*0.3 ,),
              SketchButton(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => GetImage(cameras: cameras ) ) );
              },
                  title: 'Sketch Online Picture'
              ),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            children: [
              SizedBox(width:MediaQuery.of(context).size.width*0.3 ,),
              SketchButton(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryImagePickerPage(cameras: cameras) ) );
              } , title: 'Sketch a picture from Gallery'),
            ],
          ),
        ],
      ),
    );
  }
}
