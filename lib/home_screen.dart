import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/slider_provider.dart';
final hello = Provider<String>((ref) {
  return "Subscribe My Channel";
});

final counter = StateProvider<int>((ref) {
  return 0;
});

final switchProvider = StateProvider<bool>((ref) {
  return false;
});



// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final myHello = ref.watch(hello);
//         return Scaffold(
//       appBar: AppBar(title: Text("Learning Riverpod"), centerTitle: true,),
//       body: Center(
//         child: Text("Hello $myHello"),
//       ),
//     );
//   }
// }

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    print('Build');
    return Scaffold(
      appBar: AppBar(title: Text("Learning Riverpod"), centerTitle: true),
      body: Column(
        children: [
          Consumer(builder: (context, ref, child){
            final simpleCount = ref.watch(counter);
            print('Build--2');
            return  Center(
              child: Text(simpleCount.toString(), style: TextStyle(fontSize: 20)),
            );
          }),

          Consumer(builder: (context, ref, child){
            final switchProviderex = ref.watch(switchProvider);
            print('Build--3');
            return Switch(value: switchProviderex, onChanged: (value){
              //ref.read(switchProviderex.notifier).re
              ref.read(switchProvider.notifier).state=value;
            });
          }),

          
          ElevatedButton(onPressed: (){
            ref.read(counter.notifier).state++;
          }, child: Text('+'))
        ],
      ),
    );
  }
}
