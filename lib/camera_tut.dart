import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class MyCameraScreen extends StatefulWidget {
  const MyCameraScreen({Key? key}) : super(key: key);

  @override
  State<MyCameraScreen> createState() => _MyCameraScreenState();
}

class _MyCameraScreenState extends State<MyCameraScreen> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;


  @override
  void initState() {
    // TODO: implement initState
    startCamera();
    super.initState();
  }

  void startCamera() async{
    cameras = await availableCameras();

    cameraController = CameraController(
        cameras[0],
        ResolutionPreset.high,
      enableAudio: false,
    );

    await cameraController.initialize().then((value) {
      if(!mounted)
        {
          return;
        }
      setState(() {
        
      });
    }).catchError((e){

    });


  }

  @override
  void dispose() {
    // TODO: implement dispose
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(cameraController.value.isInitialized)
      {
        return Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                      child: Center(child: CameraPreview(cameraController)
                      )
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: Positioned(
                      // top: 20,
                      // right: 20,
                      child: Container(
                          height: MediaQuery.of(context).size.height ,
                          width: MediaQuery.of(context).size.width,
                          child: Image(
                              image: NetworkImage('https://freepngimg.com/thumb/categories/353.png')
                          )
                      ),
                 ),
                  ),
                ],
              ),

            ],
          ),

        );
      }
    else
      {
        return const SizedBox();
      }
  }
}
