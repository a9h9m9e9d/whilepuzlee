// ignore_for_file: file_names
import 'dart:async';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:puzzle/Bar.dart';
import 'Puzzle_Grid.dart';
import 'package:sizer/sizer.dart';

class PuzzleBoard extends StatefulWidget {
  const PuzzleBoard({Key? key}) : super(key: key);
  @override
  _PuzzleBoardState createState() => _PuzzleBoardState();
}
class _PuzzleBoardState extends State<PuzzleBoard> {
  //the puzzle number
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int move = 0;

  static const duration = Duration(seconds: 1); 
  int secondsPassed = 0;
  bool isActive = false; // for stop or start game
   Timer? timer;  //timer
  @override
  void initState() {
    super.initState();
    numbers.shuffle();  //random the puzzle
  }
  //start the time when first move
  void startTime() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    //start timer
    timer ??= timer = Timer.periodic(duration, (Timer t) {startTime();});
    
return Scaffold(
  body:   SafeArea(
     child: ListView(
       children:[ Container(
                 alignment: Alignment.center,
                color: Colors.white38, 
                child: Column( 
                  children:[
                     Neumorphic(
                       style:  NeumorphicStyle(
    intensity: 0.5,
    boxShape:  NeumorphicBoxShape.roundRect(
      const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),)), 
    depth: -3 ,
    lightSource: LightSource.bottom,
    color: Colors.grey[100],
  ),
                       child: bar(move: move, reset: reset, secondsPassed: secondsPassed),
                     ),   
                Container(
                  margin: EdgeInsets.symmetric(vertical: 2.h ,horizontal: 2.w),
                  height: 90.h ,
                  width: 35.w,
                  child: PuzzleGrid(clickGrid: clickGrid, numbers: numbers)),        
                  ],       
                ),        
              ), 
       ]   
     ),
      ),
); 
  }

  //moving the grid of puzzle
  void clickGrid(index) {
    if (secondsPassed == 0) {
      isActive = true;
    }
    if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4 >= 0 && numbers[index - 4] == 0) ||
        (index + 4 < 16 && numbers[index + 4] == 0)) {
      setState(() {
        move++;
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
      });
    }
     checkWin();  //function of win the game if sort the puzzle
  }


//reset the board and time and move
void reset() {
    setState(() {
      numbers.shuffle();
      move = 0;
      secondsPassed = 0;
      isActive = false;
   
    });
     
  }

  //check it is sorted or not
  bool isSorted(List list) {
    int prev = list.first;
    
    for (var i = 1; i < list.length - 1; i++) {
      int next = list[i];
      if (prev +1 != next) {
        return false;
      } else{
      prev = next;

      }
    }
    return true;
  }

//function of win game
void checkWin() {
    if (isSorted(numbers)) {
      isActive = false;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "You are win the game",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 220.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child:const Text(
                            "Close",
                            style: TextStyle(color: Colors.white),
                          ),
                          
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }else{

    }
  }
}