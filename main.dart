import 'package:flutter/material.dart';
import 'package:puzzle/Puzzle_board.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return Sizer(
      builder: (context, orientation, deviceType) {
    
    return MaterialApp(
      //builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        fontFamily: "Castoro",
      ),
      home: const PuzzleBoard() ,
    );});
  }
}
