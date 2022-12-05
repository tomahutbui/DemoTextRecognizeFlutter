import 'dart:math';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'dart:io';

class HomePageCubit extends Cubit<String>{
  HomePageCubit() : super('');

  Future getImage(ImgSource source, BuildContext context) async {
    var image = await ImagePickerGC.pickImage(
        enableCloseButton: true,
        closeIcon: const Icon(
          Icons.close,
          color: Colors.red,
          size: 12,
        ),
        context: context,
        source: source,
        barrierDismissible: true,
        cameraIcon: const Icon(
          Icons.camera_alt,
          color: Colors.red,
        ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
        cameraText: const Text(
          "From Camera",
          style: TextStyle(color: Colors.red),
        ),
        galleryText: const Text(
          "From Gallery",
          style: TextStyle(color: Colors.blue),
        ));

    final InputImage inputImage = InputImage.fromFilePath(image.path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
    textRecognizer.close();
    for (TextBlock block in recognizedText.blocks) {
      final Rect rect = block.boundingBox;
      final List<Point<int>> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        print('line: ${line.text}');
        for (TextElement element in line.elements) {
          print('element: ${element.text}');
        }
      }
    }
    //print(image.path);
    emit(image == null ? '' : image.path);
   /* setState(() {
      _image = image;
    });*/
  }

  Future<void> PickImage(BuildContext context, int type) async {
    getImage(type == 0 ? ImgSource.Gallery : ImgSource.Camera, context);
  }
}