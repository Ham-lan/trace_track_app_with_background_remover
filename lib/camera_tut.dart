import 'package:camera/camera.dart';
import 'package:camera_app/get_image.dart';
import 'package:flutter/material.dart';

class MyCameraScreen extends StatefulWidget {
  List<CameraDescription> cameras;
  //final String url;
  Image image;
  MyCameraScreen({ required this.cameras ,required this.image ,Key? key}) : super(key: key);

  @override
  State<MyCameraScreen> createState() => _MyCameraScreenState();
}

class _MyCameraScreenState extends State<MyCameraScreen> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  late Future<void> cameraValue;

  @override
  void initState() {
    // TODO: implement initState
    startCamera();
    super.initState();
   // cameraValue = cameraController.initialize();
    //startCamera();
  }

  Future<void> startCamera() async{
   // cameras = await availableCameras();

    cameraController = CameraController(
        widget.cameras[0],
        ResolutionPreset.high,
      enableAudio: false,
    );
    cameraValue = cameraController.initialize();
    // cameraValue = cameraController.initialize().then((value) {
    //   debugPrint('waiting Canmera controller ');
    //   if(!mounted)
    //     {
    //       return;
    //     }
    //   setState(() {
    //
    //   });
    // }).catchError((e){
    //   debugPrint('I am currently waiting');
    // });


  }

  @override
  void dispose() {
    // TODO: implement dispose
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

  //if(cameraController.value.isInitialized)
    //{
      return Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                FutureBuilder(
                    future: cameraValue,
                    builder: (context,snapshot)
                    {
                      if(snapshot.connectionState == ConnectionState.done ) {
                          return Container(
                              child: Center(child: CameraPreview(cameraController)
                              )
                          );
                        }
                      else if(snapshot.connectionState == ConnectionState.waiting) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(child: CircularProgressIndicator()),
                            ],
                          );
                        }
                      else
                        {
                          return CircularProgressIndicator();
                        }

                    }
                ),
                // Container(
                //     child: Center(child: CameraPreview(cameraController)
                //     )
                // ),
                Opacity(
                  opacity: 0.5,
                  child: Positioned(
                    // top: 20,
                    // right: 20,
                    child: Container(
                        height: MediaQuery.of(context).size.height*0.9,
                        width: MediaQuery.of(context).size.width*0.9,
                        child: widget.image,
                        // child: Image(
                        //
                        //     // image: NetworkImage('https://freepngimg.com/thumb/categories/353.png')
                        // )
                    ),
                  ),
                ),
              ],
            ),


            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).pop(); // Navigate back to GetImage screen
            //   },
            //   child: Text('Go Back'),
            // ),

          ],
        ),
      );
   // }
  // else
  //   {
  //     return Scaffold();
  //   }

     }
  }

