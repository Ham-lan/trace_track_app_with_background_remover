import 'package:camera/camera.dart';
import 'package:camera_app/button.dart';
import 'package:camera_app/camera_tut.dart';
import 'package:flutter/material.dart';

class GetImage extends StatelessWidget {
  final List<CameraDescription> cameras;
  GetImage({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController urlController =  TextEditingController();
    return SafeArea(
      child: Scaffold(
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
            SketchButton(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)
              => MyCameraScreen(cameras: cameras, url: urlController.value.text.toString(), ) ) );
            } ),
                     ],
        ),
      ),
    );
  }
}
