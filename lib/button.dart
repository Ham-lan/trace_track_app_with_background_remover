import 'package:flutter/material.dart';

class SketchButton extends StatelessWidget {
  SketchButton({Key? key, required this.onTap}) : super(key: key);
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height*0.1,
        width: MediaQuery.of(context).size.width*0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),
        ),
        child: Center(child: Text(
            'Proceed to Sketch',
          style: TextStyle(fontWeight: FontWeight.bold , color: Colors.green),
        ),),
      ),
    );
  }
}
