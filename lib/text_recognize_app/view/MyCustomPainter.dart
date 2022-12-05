import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui show Image;

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class MyCustomPainter extends CustomPainter {
  String pathFile;
  RecognizedText result;
  ui.Image? imgPaint;
  MyCustomPainter(this.pathFile, this.result, this.imgPaint);



  @override
  void paint(Canvas canvas, Size size) async {
    var paint = Paint()
        ..color = Colors.red
        ..strokeWidth = 2
    ..style = PaintingStyle.stroke;
    //GetFileData();
    if(imgPaint != null) {
      canvas.drawImage(imgPaint!, Offset.zero, paint);
      print('draw image');
    }


    for (TextBlock block in result.blocks) {
      final Rect rect = block.boundingBox;
      canvas.drawRect(rect, paint);
      print('draw rectangle');
    }
  }

  Future<void> GetFileData() async {
    imgPaint = await decodeImageFromList(File(pathFile).readAsBytesSync());
  }


  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}