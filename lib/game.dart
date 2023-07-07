import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameScreen1 extends StatefulWidget {
  final newscore;
  GameScreen1({this.newscore});
  @override
  _GameScreen1State createState() => _GameScreen1State();
}
class _GameScreen1State extends State<GameScreen1> {
  Game gm = Game();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,children: [SizedBox(width: 400,height: 45, child: IconButton(icon: const Icon(Icons.help_outline),
              color: Colors.brown,
              alignment: Alignment.centerRight,
              iconSize: 45,onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const InstructionGame1()));
              },),),],),
            SizedBox(
              width: 300,
              height: 275,
              child: Image.asset('assets/gamelogo.gif', height: 150),
            ),

            SizedBox(
              width: 10,
              height: 10,
            ),

            SizedBox(width: 230, height: 80, child: Text(
              "Drag and drop the photo to match it",
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 1.0,
                fontSize: 20.0,
                color: Colors.black,
                fontFamily: "Inter-Regular",),
            ),),


            SizedBox(
              width: 10,
              height: 10,
            ),

            Container(
              color: Colors.transparent,
              width: double.infinity,
              alignment: Alignment.center,
              child: Container(
                height: 80,
                width: 250,
                child: ElevatedButton(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        "Play",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 3.0,
                          fontSize: 25.0,
                          color: Colors.black,
                          fontFamily: "Inter-SemiBold",),
                      ),],),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.brown,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Game()));
                  },
                ),
              ),
            ),

            SizedBox(
              width: 10,
              height: 10,
            ),

            Container(
              color: Colors.transparent,
              width: double.infinity,
              alignment: Alignment.center,
              child: Container(
                height: 60,
                width: 150,
                child: ElevatedButton(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        "Exit",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 3.0,
                          fontSize: 25.0,
                          color: Colors.black,
                          fontFamily: "Inter-SemiBold",),
                      ),],),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Color(0xFFCBA18F),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GameHome()));
                  },
                ),
              ),
            ),

          ]),
    );
  }

}

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState()
  {
    return _GameState();
  }
}
class _GameState extends State<Game> {

  late SharedPreferences prefs;

  int tries = 0;
  int score = 0;

  late List<ItemModel> items;
  late List<ItemModel>items3;
  late List<ItemModel>items4;
  late List<ItemModel>items5;

  late bool gameOver;

  int time = 60;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    initGame();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        time = time - 1;
      });
    });
  }

  initGame(){
    gameOver = false;
    score = 0;
    items=[
      ItemModel(image: 'assets/images/ajwa/1.jpg', name:"Ajwa", value:"Ajwa"),
      ItemModel(image: 'assets/images/ajwa/2.jpg', name:"Ajwa", value:"Ajwa"),
      ItemModel(image: 'assets/images/ajwa/3.jpg', name:"Ajwa", value:"Ajwa"),
      ItemModel(image: 'assets/images/ajwa/4.png', name:"Ajwa", value:"Ajwa"),
      ItemModel(image: 'assets/images/ajwa/5.jpg', name:"Ajwa", value:"Ajwa"),

      ItemModel(image: 'assets/images/medjool/1.png',name:"Medjool", value:"Medjool"),
      ItemModel(image: 'assets/images/medjool/2.jpg',name:"Medjool", value:"Medjool"),
      ItemModel(image: 'assets/images/medjool/3.jpg',name:"Medjool", value:"Medjool"),
      ItemModel(image: 'assets/images/medjool/4.jpg',name:"Medjool", value:"Medjool"),
      ItemModel(image: 'assets/images/medjool/5.jpg',name:"Medjool", value:"Medjool"),

      ItemModel(image: 'assets/images/rutab/1.JPG',name:"Rutab", value:"Rutab"),
      ItemModel(image: 'assets/images/rutab/2.JPG',name:"Rutab", value:"Rutab"),
      ItemModel(image: 'assets/images/rutab/3.JPG',name:"Rutab", value:"Rutab"),
      ItemModel(image: 'assets/images/rutab/4.JPG',name:"Rutab", value:"Rutab"),
      ItemModel(image: 'assets/images/rutab/5.jpg',name:"Rutab", value:"Rutab"),

      ItemModel(image: 'assets/images/galaxy/1.JPG',name:"Galaxy", value:"Galaxy"),
      ItemModel(image: 'assets/images/galaxy/2.JPG',name:"Galaxy", value:"Galaxy"),
      ItemModel(image: 'assets/images/galaxy/3.JPG',name:"Galaxy", value:"Galaxy"),
      ItemModel(image: 'assets/images/galaxy/4.JPG',name:"Galaxy", value:"Galaxy"),
      ItemModel(image: 'assets/images/galaxy/5.JPG',name:"Galaxy", value:"Galaxy"),

      ItemModel(image: 'assets/images/meneifi/1.jpg',name:"Meneifi", value:"Meneifi"),
      ItemModel(image: 'assets/images/meneifi/2.JPG',name:"Meneifi", value:"Meneifi"),
      ItemModel(image: 'assets/images/meneifi/3.JPG',name:"Meneifi", value:"Meneifi"),
      ItemModel(image: 'assets/images/meneifi/4.JPG',name:"Meneifi", value:"Meneifi"),
      ItemModel(image: 'assets/images/meneifi/5.JPG',name:"Meneifi", value:"Meneifi"),

      ItemModel(image: 'assets/images/sugaey/1.JPG',name:"Sugaey", value:"Sugaey"),
      ItemModel(image: 'assets/images/sugaey/2.JPG',name:"Sugaey", value:"Sugaey"),
      ItemModel(image: 'assets/images/sugaey/3.JPG',name:"Sugaey", value:"Sugaey"),
      ItemModel(image: 'assets/images/sugaey/4.JPG',name:"Sugaey", value:"Sugaey"),
      ItemModel(image: 'assets/images/sugaey/5.jpg',name:"Sugaey", value:"Sugaey"),

      ItemModel(image: 'assets/images/shaishe/1.JPG',name:"Shaishe", value:"Shaishe"),
      ItemModel(image: 'assets/images/shaishe/2.JPG',name:"Shaishe", value:"Shaishe"),
      ItemModel(image: 'assets/images/shaishe/3.JPG',name:"Shaishe", value:"Shaishe"),
      ItemModel(image: 'assets/images/shaishe/4.JPG',name:"Shaishe", value:"Shaishe"),
      ItemModel(image: 'assets/images/shaishe/5.JPG',name:"Shaishe", value:"Shaishe"),

      ItemModel(image: 'assets/images/nabtatali/1.JPG',name:"Nabtat Ali", value: "Nabtat Ali"),
      ItemModel(image: 'assets/images/nabtatali/2.JPG',name:"Nabtat Ali", value: "Nabtat Ali"),
      ItemModel(image: 'assets/images/nabtatali/3.JPG',name:"Nabtat Ali", value: "Nabtat Ali"),
      ItemModel(image: 'assets/images/nabtatali/4.JPG',name:"Nabtat Ali", value: "Nabtat Ali"),
      ItemModel(image: 'assets/images/nabtatali/5.jpg',name:"Nabtat Ali", value: "Nabtat Ali"),

      ItemModel(image: 'assets/images/sokari/1.jpg',name:"Sokari", value:"Sokari"),
      ItemModel(image: 'assets/images/sokari/2.jpg',name:"Sokari", value:"Sokari"),
      ItemModel(image: 'assets/images/sokari/3.jpg',name:"Sokari", value:"Sokari"),
      ItemModel(image: 'assets/images/sokari/4.png',name:"Sokari", value:"Sokari"),
      ItemModel(image: 'assets/images/sokari/5.jpg',name:"Sokari", value:"Sokari"),
    ];
    items.shuffle();

    items3 = List<ItemModel>.from(items.take(5));

    items4 = List<ItemModel>.from(items3);
    items5 = List<ItemModel>.from(items3);

    items4.shuffle();
    items5.shuffle();

  }

  final playerx = new AudioCache(fixedPlayer: AudioPlayer());

  @override
  Widget build(BuildContext context) {
    highScore();
    if (time <=  0 ) {
      highScore();
      playerx.fixedPlayer?.stop();
      gameOver = true;
      timer.cancel();
    }
    if(items4.isEmpty) {
      highScore();
      playerx.fixedPlayer?.stop();
      gameOver = true;
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: Image.asset('assets/backgroundgame.jpg').image,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(elevation: 0,),
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if(!gameOver)
              Column( children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Icon(Icons.timer, size: 50,),
                    SizedBox(width: 5, height: 10,),
                    SizedBox(width: 60, height: 50, child: Text.rich(TextSpan(
                        children: [
                          TextSpan(text: "$time", style: const TextStyle(
                            color: Color(0xFFC8A18F),
                            fontFamily: "Inter-Bold",
                            fontSize: 35.0,
                          ))
                        ]
                    )),),

                  ],),
                SizedBox(
                  width: double.infinity,
                  height: 580,
                  child: Row(
                    children: <Widget>[
                      if (time != 60)
                        Column(
                            children: items4.take(5).map((item) {
                              return Container(
                                margin: const EdgeInsets.all(8.0),
                                child: Draggable<ItemModel>(
                                  data: item,
                                  childWhenDragging: Image.asset(
                                    item.image, color: Colors.grey,
                                    width: 100.0,),
                                  feedback: Image.asset(item.image, width: 100,),
                                  child: Image.asset(item.image, width: 100,),
                                ),
                              );
                            }).toList()
                        ),
                      const Spacer(),

                      if (time != 60)
                        Column(
                            children: items5.take(5).map((item) {
                              return DragTarget<ItemModel>(
                                onAccept: (receivedItem) {
                                  if (item.value == receivedItem.value) {
                                    setState(() {
                                      items4.remove(receivedItem);
                                      items5.remove(item);
                                      score += 10;
                                      item.accepting = false;
                                      Fluttertoast.showToast(
                                        msg: "Correct answer. Good job!",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                        backgroundColor: Colors.brown,
                                      );
                                    });
                                  } else {
                                    setState(() {
                                      score -= 5;
                                      tries++;
                                      item.accepting = false;
                                      Fluttertoast.showToast(
                                          msg: "Wrong answer X",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          textColor: Colors.white,
                                          backgroundColor: Colors.brown,
                                          fontSize: 16.0
                                      );
                                    });
                                  }
                                },
                                onLeave: (receivedItem) {
                                  setState(() {
                                    item.accepting = false;
                                  });
                                },
                                onWillAccept: (receivedItem) {
                                  setState(() {
                                    item.accepting = true;
                                  });
                                  return true;
                                },
                                builder: (context, acceptedItems, rejectedItem) =>
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: item.accepting ? const Color(
                                            0xFFFDEAC3) : const Color(0xFFFFB5A4),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.all(8.0),
                                      child: Text(
                                        item.name, textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 3.0,
                                            fontFamily: "Inter-SemiBold",
                                            fontSize: 18.0),),
                                    ),


                              );
                            }).toList()

                        ),

                    ],
                  ),
                ),
                const SizedBox(height: 10, width: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 170,
                      height: 60,
                      child: ElevatedButton(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              "Start",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                letterSpacing: 3.0,
                                fontSize: 25.0,
                                color: Colors.white,
                                fontFamily: "Inter-Bold",),
                            ),],),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.brown,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        ),
                        onPressed: () {
                          startTimer();
                          playerx.play('gameaudio.mp3');
                        },
                      ),
                    ),
                    const SizedBox(height: 20, width: 20,),
                    SizedBox(
                      width: 170,
                      height: 60,
                      child: ElevatedButton(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              "End",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                letterSpacing: 3.0,
                                fontSize: 25.0,
                                color: Colors.white,
                                fontFamily: "Inter-Bold",),
                            ),],),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.brown,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        ),
                        onPressed: () {
                          startTimer();
                          highScore();
                          gameOver = true;
                          playerx.fixedPlayer?.stop();
                        },
                      ),
                    ),
                  ],),



              ],),

            if(gameOver)
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 60,
                      alignment: Alignment.center,
                      child: const Text(
                        "GAME OVER !",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Color(0xFFFF1111),
                          fontFamily: "Inter-SemiBold",),
                      ),
                    ),

                    Container(
                      width: 364,
                      height: 380,
                      decoration: BoxDecoration(
                        color: Color(0xFFFDEAC3),
                      ),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Your score,",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                letterSpacing: 3.0,
                                fontSize: 25.0,
                                color: Color(0xFF4F4F4F),
                                fontFamily: "Inter-SemiBold",),
                            ),
                            Text(
                              '${score}', /*put into database*/
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                letterSpacing: 3.0,
                                fontSize: 45.0,
                                color: Color(0xFF4F4F4F),
                                fontFamily: "Inter-SemiBold",),
                            ),
                            Container(
                              width: double.infinity,
                              height: 20,
                              alignment: Alignment.center,
                            ),
                            Container(
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    width: 5,
                                    color: const Color(0xFFF1C27D),
                                  )
                              ),
                              child: Column(mainAxisAlignment: MainAxisAlignment
                                  .center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Wrong tries: ${tries}', /*call high score database*/
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        letterSpacing: 3.0,
                                        fontSize: 20.0,
                                        color: Color(0xFF4F4F4F),
                                        fontFamily: "Inter-SemiBold",),
                                    ),
                                  ]
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 40,
                              alignment: Alignment.center,
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: ElevatedButton(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      children: const <Widget>[
                                        Icon(Icons.home, size: 50,),
                                      ],),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFFB5A4),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50.0))),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => GameScreen1()));
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: ElevatedButton(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      children: const <Widget>[
                                        Icon(Icons.replay, size: 50,),
                                      ],),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFFD5A4),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50.0))),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => Game()));
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: ElevatedButton(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      children: const <Widget>[
                                        Icon(Icons.exit_to_app, size: 50,),
                                      ],),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFC8A18F),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50.0))),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => GameHome()));
                                    },
                                  ),
                                ),
                              ],
                            )
                          ]
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      height: 60,
                      alignment: Alignment.center,
                    ),

                  ]),
          ],
        ),
      ),
    );

  }

  highScore() async {
    prefs = await SharedPreferences.getInstance();
    /*prefs.setInt('scoredata', score);*/

    if (prefs.getInt('scoredata')! < score)
      prefs.setInt('scoredata', score);

  }

}

class ItemModel {
  final String name;
  final String value;
  final String image;
  bool accepting;
  ItemModel({required this.name, required this.value, required this.image, this.accepting= false});
}

class InstructionGame1 extends StatelessWidget {
  const InstructionGame1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, appBar: AppBar(elevation: 0,),
      body: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                "How to play?",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  fontFamily: "Inter-Bold",),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 25, left: 25, right: 25),
              child:
              Text(
                "1. Click play button \n\n2. Press start button \n\n3. Drag the image to it pair before the timer end \n\n4. If you finish match the image before the timer end, press the end button \n\n5. Each correct answer will be given 10 marks and for each wrong pair will deduct 5 marks.",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontFamily: "Inter-SemiBold",),
              ),
            ),
          ]),
    );
  }
}