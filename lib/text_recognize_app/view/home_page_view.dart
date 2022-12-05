import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_page_cubit.dart';

class HomePageView extends StatelessWidget{
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan text'),),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<HomePageCubit, Uint8List?>(
              builder: (context, state) {
                print('state is $state');
                return state == null || state.isEmpty ?
                const Center(child: Text('Nothing show here'),) :
                Image.memory(state);
              },
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                ElevatedButton(
                  key: const Key('a'),
                  onPressed: () => context.read<HomePageCubit>().PickImage(context, 0),
                  child: const Text('From Gallery'),
                ),
                ElevatedButton(
                  onPressed: () => context.read<HomePageCubit>().PickImage(context, 1),
                  child: const Text('From Camera'),
                ),
              ]
          ),
        ],
      ),
    );
  }

}