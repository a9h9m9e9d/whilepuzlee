// ignore_for_file: must_be_immutable, file_names
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
class PuzzleGrid extends StatefulWidget {
   var numbers = [];
  Function clickGrid;
   PuzzleGrid({ required this.numbers,required this.clickGrid,Key? key}) : super(key: key);
  @override
  State<PuzzleGrid> createState() => _PuzzleGridState();
}
class _PuzzleGridState extends State<PuzzleGrid> {
double el = 10;
Color  cl = Colors.white;
final options = const LiveOptions(
  delay:  Duration(seconds: 1),
  showItemInterval: Duration(milliseconds: 500),
  showItemDuration: Duration(seconds: 1),
  visibleFraction: 0.05,
  reAnimateOnVisibility: false,
);

  @override
  Widget build(BuildContext context) {
    return Container(
      //Grid distribution on board random
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: LiveGrid.options(
        options: options ,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemCount: widget.numbers.length,
        itemBuilder: (context, index ,Animation<double> animation) {
          return widget.numbers[index] != 0
              ? 
              FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -0.1),
          end: Offset.zero,
        ).animate(animation),
        child: 
              NeumorphicButton(
                onPressed: ()=> widget.clickGrid(index) ,       
                  child: Center(
                    child: Text(
                      "${widget.numbers[index]}",
                       
                    ),
                  ),
                  style: NeumorphicStyle(
      //shape: NeumorphicShape.concave, 
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)), 
      depth: -4,
     intensity: 0.75,
      lightSource: LightSource.bottomLeft,
      color: Colors.grey[200],                    
               ) ) ))
              : const SizedBox.shrink();
        },
      ),
    );
  }
}