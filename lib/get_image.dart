import 'package:camera/camera.dart';
import 'package:camera_app/button.dart';
import 'package:camera_app/camera_tut.dart';
import 'package:camera_app/toast_message.dart';
import 'package:flutter/material.dart';

class GetImage extends StatelessWidget {
  final List<CameraDescription> cameras;
  GetImage({Key? key, required this.cameras}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    TextEditingController urlController =  TextEditingController();
    Image image;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Online Image', style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.green,

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: [
                boxShadow: [
                BoxShadow(
                color: Colors.black38,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                )
                    // BoxShadow(
                    //   color: Colors.black38,
                    //   offset: Offset(0, 2), // Adjust the offset to control the shadow's position
                    //   blurRadius: 2, // Adjust the blur radius to control the intensity of the shadow
                    // ),
                  ],
                ),
                child: TextFormField(
                  controller: urlController,
                  decoration: InputDecoration(
                    hintText: 'Paste the URL of the Image here',
                  ),
                ),
              ),
            ),
            SketchButton(
            title: 'Proceed to Sketch'    ,
            onTap: (){
              if(urlController.value.text.toString() != '')
                {
                  image = Image(image: NetworkImage(urlController.value.text.toString()));
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  => MyCameraScreen(cameras: cameras, image: image, ) ) ) ;
                }
              else
                {
                  ToastMessage().ShowMessage('No URL Found');
                }

            } ),
                     ],
        ),
      ),
    );
  }
}
