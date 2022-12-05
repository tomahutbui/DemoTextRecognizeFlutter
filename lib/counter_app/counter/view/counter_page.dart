
import 'package:demo_text_recognize/counter_app/counter/cubit/counter_cubit.dart';
import 'package:demo_text_recognize/counter_app/counter/view/counter_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget{
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
        create: (_) => CounterCubit(),
        child: const CounterView(),
    );
  }
}