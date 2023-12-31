import 'package:camera/camera.dart';
import 'package:camera_app/camera_tut.dart';
import 'package:camera_app/get_gallery_image.dart';
import 'package:camera_app/get_image.dart';
import 'package:camera_app/navigate_page_one.dart';
import 'package:flutter/material.dart';



Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final cameras =await availableCameras();
  // final cameras =await availableCameras();
  runApp(MyApp(cameras: cameras ,));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  MyApp({ required this.cameras, super.key });


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: NavigateAhead(cameras: cameras) ,
    );
  }
}

