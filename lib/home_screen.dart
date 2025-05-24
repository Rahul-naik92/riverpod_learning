import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final hello = Provider<String>((ref){

  return "Subscribe";

});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final subscribe=ref.watch(hello);
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(subscribe),),
    );
  }
}

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final subScribe = ref.watch(hello);
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(child: Text(subScribe),),
//     );
//   }
// }