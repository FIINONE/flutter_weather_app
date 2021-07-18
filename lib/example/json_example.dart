// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_lesson_1/domain/api_clients/api_client.dart';
// import 'package:flutter_lesson_1/layout/data/data_example.dart';
// import 'package:flutter_lesson_1/layout/data/human.dart';

// class JsonExample extends StatelessWidget {
//   const JsonExample({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     ApiClinet().getPosts();

//     return MaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           child: _JsonExampleProvider(
//             coder: _JsonExampleCoder(),
//             child: const _ButtonWidget(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _ButtonWidget extends StatelessWidget {
//   const _ButtonWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () => _JsonExampleProvider.read(context)?.coder.encode(),
//             child: Text('Coding'),
//           ),
//           ElevatedButton(
//             onPressed: () => _JsonExampleProvider.read(context)?.coder.decode(),
//             child: Text('Decoding'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _JsonExampleProvider extends InheritedWidget {
//   final _JsonExampleCoder coder;

//   _JsonExampleProvider({
//     Key? key,
//     required this.coder,
//     required Widget child,
//   }) : super(key: key, child: child);

//   static _JsonExampleProvider? watch(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<_JsonExampleProvider>();
//   }

//   static _JsonExampleProvider? read(BuildContext context) {
//     final widget = context
//         .getElementForInheritedWidgetOfExactType<_JsonExampleProvider>()
//         ?.widget;
//     return widget is _JsonExampleProvider ? widget : null;
//   }

//   @override
//   bool updateShouldNotify(_JsonExampleProvider oldWidget) {
//     return true;
//   }
// }

// class _JsonExampleCoder {
//   void encode() {
//     // final _objects = human.map((e) => e.toJson()).toList();
//     // final _jsonString = jsonEncode(_objects);

//     final _jsonString = jsonEncode(human);
//     print(_jsonString);
//   }

//   void decode() {
//     final json = jsonDecode(jsonString) as List<dynamic>;
//     final humans = json
//         .map((dynamic e) => Human.fromJson(e as Map<String, dynamic>))
//         .toList();
//     print(humans);
//   }
// }
