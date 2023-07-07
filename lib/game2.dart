import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:datesify/newgame/info_card.dart';
import 'package:datesify/newgame/game_utils.dart';

class GameScreen2 extends StatefulWidget {
  final newscore;
  GameScreen2({this.newscore});
  @override
  _GameScreen2State createState() => _GameScreen2State();
}
class _GameScreen2State extends State<GameScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Column(
        /**/
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,children: [SizedBox(width: 400,height: 45, child: IconButton(icon: const Icon(Icons.help_outline),
              color: Colors.brown,
              alignment: Alignment.centerRight,
              iconSize: 45,onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const InstructionGame2()));
              },),),],),
            SizedBox(
              width: 300,
              height: 275,
              child: Image.asset('assets/gamelogo2.gif', height: 150),
            ),

            SizedBox(
              width: 10,
              height: 10,
            ),

            SizedBox(width: 230, height: 80, child: Text(
              "Remember the dates fruit",
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Gamee()));
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

class Gamee extends StatefulWidget {
  const Gamee({Key? key}) : super(key: key);

  @override
  _GameeState createState() => _GameeState();
}

class _GameeState extends State<Gamee> {
  //setting text style
  TextStyle whiteText = TextStyle(color: Colors.white);
  bool hideTest = false;
  Game _game = Game();

  //game stats
  int tap = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _game.initGame();

    _game.gameImg?.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFEADA),
      appBar: AppBar(elevation: 0,),
      body:
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if(score!=60)
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      info_card("Tap", "$tap"),
                      info_card("Score", "$score"),
                    ],
                  ),
                  SizedBox(
                      height: 705,
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                          itemCount: _game.gameImg!.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                          ),
                          padding: EdgeInsets.all(16.0),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                print(_game.matchCheck);
                                setState(() {
                                  //incrementing the clicks
                                  tap++;
                                  _game.gameImg![index] = _game.cards_list[index];
                                  _game.matchCheck
                                      .add({index: _game.cards_list[index]});
                                  print(_game.matchCheck.first);
                                });
                                if (_game.matchCheck.length == 2) {
                                  if (_game.matchCheck[0].values.first ==
                                      _game.matchCheck[1].values.first) {
                                    print("true");
                                    //incrementing the score
                                    score += 10;
                                    _game.matchCheck.clear();
                                  } else {
                                    print("false");

                                    Future.delayed(Duration(milliseconds: 500), () {
                                      print(_game.gameColors);
                                      setState(() {
                                        _game.gameImg![_game.matchCheck[0].keys.first] =
                                            _game.hiddenCardpath;
                                        _game.gameImg![_game.matchCheck[1].keys.first] =
                                            _game.hiddenCardpath;
                                        _game.matchCheck.clear();
                                      });
                                    });
                                  }
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: Colors.brown,
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: AssetImage(_game.gameImg![index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          })),
                ],
            ),

          if(score==60)
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
                                    'Your tap: ${tap}', /*call high score database*/
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
                                        builder: (context) => GameScreen2()));
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
                                        builder: (context) => Gamee()));
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

    );
  }
}

class InstructionGame2 extends StatelessWidget {
  const InstructionGame2({Key? key}) : super(key: key);

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
                "1. Click play button \n\n2. Tap the image and remember it's position. \n\n3. Choose the same image. \n\n4. Each correct answer will be given 10 marks and for each tap will increase the tap number.",
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