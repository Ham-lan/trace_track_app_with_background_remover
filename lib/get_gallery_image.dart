import 'package:camera/camera.dart';
import 'package:camera_app/button.dart';
import 'package:camera_app/camera_tut.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera_app/toast_message.dart';

class GalleryImagePickerPage extends StatefulWidget {
  List<CameraDescription> cameras;

  GalleryImagePickerPage({ required this.cameras ,Key? key}) : super(key: key);


  @override
  _GalleryImagePickerPageState createState() => _GalleryImagePickerPageState();
}

class _GalleryImagePickerPageState extends State<GalleryImagePickerPage> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage( source: ImageSource.gallery ) ;

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children:[
          Center(
            child:Container(
              height: MediaQuery.of(context).size.height*0.5,
              width: MediaQuery.of(context).size.width*0.5,
              child: _image == null
                  ? Text('No image selected.')
                  : Image.file(_image!),
            ),
          ),
          SizedBox(height: 20,),
          FloatingActionButton(onPressed: (){

            if(_image != null)
              {
                Image image = Image.file(_image!);
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyCameraScreen(cameras: widget.cameras , image: image , )));
              }
            else
              {
                ToastMessage().ShowMessage('No Image Selected');
              }

          }, child: Icon(Icons.arrow_circle_right),)
        ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getImage();
          },
        tooltip: 'Pick Image',
        child: Icon(Icons.image),
      ),
    );
  }
}
