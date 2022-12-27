import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class OutlineFontComponent extends StatelessWidget {
  final String text;
  final double size;
   const OutlineFontComponent({Key? key,required this.text,required this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.bold,
              // fontFamily: Fontf,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 6
                ..color = Colors.black),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: size,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
