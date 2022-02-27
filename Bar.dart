// ignore_for_file: file_names
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// ignore: must_be_immutable, camel_case_types
class bar extends StatelessWidget {
   Function reset;
  int move;
  int secondsPassed;
   bar({required this.move,required this.reset,required this.secondsPassed,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     //top header of web it is contains button reset , timer and moveing
    return Container(
      height: (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top ) * 0.10,
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          NeumorphicButton(
      onPressed:()=> reset(),
       style: NeumorphicStyle(
      shape: NeumorphicShape.flat, 
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)), 
      depth: 3,
     intensity: 0.6,
      lightSource: LightSource.bottomRight,
      surfaceIntensity: 0.98,
      color: Colors.white,                
               ),
      child: const Text("Reset" ,style: TextStyle(color: Colors.black),),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Text(
        "Move: $move",
        style: const TextStyle(
            color: Colors.black,
            decoration: TextDecoration.none,
            fontSize: 18
        ),
      ),
    ),
   Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Text(
        "Time: $secondsPassed",
        style: const TextStyle(
          fontSize: 18,
          decoration: TextDecoration.none,
          color: Colors.black,
        ),
      ),
    )
        ],
      ),
    );
  }
}