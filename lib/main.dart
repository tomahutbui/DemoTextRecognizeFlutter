import 'package:demo_text_recognize/App.dart';
//import 'package:demo_text_recognize/counter_app/counter_observer.dart';
import 'package:demo_text_recognize/text_recognize_app/app.dart';
import 'package:demo_text_recognize/text_recognize_app/app_observer.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

void main() {
  Bloc.observer = TextRecognizeObserver();
  runApp(const TextRecognizeApp());
}

