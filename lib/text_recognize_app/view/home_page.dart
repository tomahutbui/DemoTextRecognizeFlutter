import 'dart:typed_data';

import 'package:demo_text_recognize/counter_app/counter/counter.dart';
import 'package:demo_text_recognize/text_recognize_app/bloc/home_page_cubit.dart';
import 'package:demo_text_recognize/text_recognize_app/view/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // TODO: implement build
    return BlocProvider(
      create: (_) => HomePageCubit(),

      child: const HomePageView()
    );
  }

}