import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/slider_provider.dart';

final hello = Provider<String>((ref) {
  return "Subscribe My Channel";
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Widget Build");

    return Scaffold(
      appBar: AppBar(title: Text("Counter Application")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(builder: (context, ref, child){
            final slider = ref.watch(sliderProvider.select((state)=> state.showPassword));
            print("Build 1");
            return GestureDetector(onTap: (){
              final stateProvider = ref.read(sliderProvider.notifier);
              stateProvider.state = stateProvider.state.copyWith(showPassword: !slider);
            },child: Container(
              height: 200,
              width: 200,
              child: slider ? Icon(Icons.remove_red_eye_outlined) : Icon(Icons.image),
            ),);
          }),
          Consumer(builder: (context, ref, child){

            final slider = ref.watch(sliderProvider.select((state)=> state.slider));
            print("Build 2");
            return  Container(
              height: 200,
              width: 200,
              color: Colors.red.withValues(red: slider),
            );
          }),

          Consumer(builder: (context, ref, child){
            final slider = ref.watch(sliderProvider.select((state)=> state.slider));
            print("Build 3");
            return     Slider(
              value: slider,
              onChanged: (value) {
                final stateProvider = ref.read(sliderProvider.notifier);
                 stateProvider.state = stateProvider.state.copyWith(slider: value);
              },
            );
          }),


        ],
      ),
    );
  }
}
