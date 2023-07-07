import 'dart:async';
import 'package:datesify/classify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'info.dart';
import 'game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  runApp(MaterialApp(title: 'Navigation Basics',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      initialRoute: '/first',
      routes: {
        '/first': (context) => Splash(),
        '/second': (context) => MyHomePage(),
        '/third': (context) => HelpScreen(),
        '/forth': (context) => AboutScreen(),
        '/fifth': (context) => InfoScreen(),
        '/sixth': (context) => GameScreen(),
        '/seventh': (context) => Classification()
      }));
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                MyHomePage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
        color: Colors.white,
          child: Image.asset('assets/splash2.png', height: 150),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0,),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.brown,
              ),
              child: SizedBox(
                width: 150,
                height: 150,
                child: Image.asset('assets/datesify.png', height: 150),
              ),
            ),
            ListTile(
              title: const Text(
                'Help',
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 3.0,
                  fontFamily: "Inter-Regular",
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HelpScreen()));
              },
            ),
            ListTile(
              title: const Text(
                'About',
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 3.0,
                  fontFamily: "Inter-Regular",
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutScreen()));
              },
            ),
            Column(children: <Widget>[
              const SizedBox(height: 300),
              SizedBox(
                height: 40,
                width: 140,
                child: ElevatedButton(
                  child: const Text(
                    'Exit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 3.0,
                      fontFamily: "Inter-Regular",
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.brown,
                    padding: const EdgeInsets.all(0.0),
                  ),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
              ),
            ])
          ],
        ),
      ),

      body:
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 60,
              alignment: Alignment.center,
              child: const Text(
                "DATESIFY",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.black,
                  fontFamily: "Helvetica Neue",),
              ),
            ),

            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('assets/homepage.png', height: 150),
            ),

            Container(
              width: 300,
              height: 80,
              alignment: Alignment.center,
              child: const Text(
                "This application is to learn about dates fruit.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 17.0,
                  color: Colors.black,
                  fontFamily: "Inter-regular",),
              ),
            ),

            Container(
              margin: const EdgeInsets.all(5),
              color: Colors.transparent,
              width: double.infinity,
              alignment: Alignment.center,
              child: SizedBox(
                width: 325.0,
                child: ElevatedButton(child: const Text(
                  "Let's Discover",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Color(0xFFFFEADA),
                    fontFamily: "Inter-SemiBold",),
                ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.brown,
                    padding: const EdgeInsets.only(left: 50, right:50, top: 20, bottom: 20),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Classification()));
                  },
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.all(5),
              color: Colors.transparent,
              width: double.infinity,
              alignment: Alignment.center,
              child: SizedBox(
                width: 325.0,
                child: ElevatedButton(child: const Text(
                  "Learn More",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Color(0xFFFFEADA),
                    fontFamily: "Inter-SemiBold",),
                ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.brown,
                    padding: const EdgeInsets.only(left: 50, right:50, top: 20, bottom: 20),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen()));
                  },
                ),
              ),
            ),


            Container(
              margin: const EdgeInsets.all(5),
              color: Colors.transparent,
              width: double.infinity,
              alignment: Alignment.center,
              child: SizedBox(
                width: 325.0,
                child: ElevatedButton(
                  child: const Text("Let's Play Game",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Color(0xFFFFEADA),
                      fontFamily: "Inter-SemiBold",
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.brown,
                    padding: const EdgeInsets.only(left: 50, right:50, top: 20, bottom: 20),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen()));
                  },
                ),
              ),
            ),
          ]),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { /*return listview here*/
    return Scaffold(backgroundColor: Colors.white, appBar: AppBar(elevation: 0,),
      body:
          Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "DATESIFY",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.black,
                    fontFamily: "Helvetica Neue",),
                ),

                SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.asset('assets/datesify.png', height: 250),
                ),

                Text(
                  "creator: Alia Nadzirah\nDatesify © 2022",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    letterSpacing: 1.5,
                    fontFamily: "Inter-Regular",),
                ),

              ]),),

    );
  }
}

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, appBar: AppBar(elevation: 0,),
      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(
              width: 200.0,
              height: 50.0,
            ),
        Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child:
            Center(child: Text(
              "Steps to do classification",
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: "Inter-Bold",),
            ),),
            ),
            Container(
            width: 350,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child:Text(
              "If you want to upload picture from gallery:",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontFamily: "Inter-SemiBold",),
            ),
            ),

            Container(
                width: 300,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "1) Click the gallery button",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    letterSpacing: 1.5,
                    fontFamily: "Inter-Regular",),
                ),
              ),
            Image.asset('assets/steps/gallery1.jpg', width: 300),
            SizedBox(width: 10, height: 20),
        Container(
            width: 300,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child:
            Text(
                "2) Choose image file in the gallery",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  letterSpacing: 1.5,
                  fontFamily: "Inter-Regular",),
            ),),
            Image.asset('assets/steps/gallery2.jpg', width: 300),
            SizedBox(width: 10, height: 20),
        Container(
            width: 300,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child:
            Text(
                "3) The output will be displayed",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  letterSpacing: 1.5,
                  fontFamily: "Inter-Regular",),
            ),),
            Image.asset('assets/steps/gallery3.jpg', width: 300),

            const SizedBox(
              width: 200.0,
              height: 30.0,
            ),
        Container(
            width: 350,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child:
            Text(
                "If you want to take picture from camera:",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontFamily: "Inter-SemiBold",),
            ),),
        Container(
            width: 300,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child:
           Text(
                "1) Click the camera button",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  letterSpacing: 1.5,
                  fontFamily: "Inter-Regular",),
            ),),
            Image.asset('assets/steps/camera1.jpg', width: 300),
            SizedBox(width: 10, height: 20),
        Container(
            width: 300,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child:
            Text(
                "2) Take photo using the camera",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  letterSpacing: 1.5,
                  fontFamily: "Inter-Regular",),
            ),),
            Image.asset('assets/steps/camera2.jpg', width: 300),
            SizedBox(width: 10, height: 20),
        Container(
            width: 300,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child:
            Text(
                "3) The output will be displayed",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  letterSpacing: 1.5,
                  fontFamily: "Inter-Regular",),
            ),),
            Image.asset('assets/steps/camera3.jpg', width: 300),

            const SizedBox(
              width: 200.0,
              height: 50.0,
            ),

          ]),),
    );
  }
}

class InfoScreen extends  StatefulWidget {
  InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}
class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, appBar: AppBar(elevation: 0,),
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: SizedBox.fromSize(
              size: Size(56, 56), // button width and height
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                }, // button pressed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.home, size: 30.0,color: Color(0xFFFFEADA),), // icon
                    Text("Home", style: TextStyle(
                      fontFamily: "Inter-regular", color: Color(0xFFFFEADA),),), // text
                  ],
                ),
              ),
            ),),
            Expanded(child: SizedBox.fromSize(
              size: Size(56, 56), // button width and height
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Classification()));
                }, // button pressed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.camera_alt, size: 30.0,color: Color(0xFFFFEADA),), // icon
                    Text("Classify",style: TextStyle(
                      fontFamily: "Inter-regular",color: Color(0xFFFFEADA),),), // text
                  ],
                ),
              ),
            ),),
            Expanded(child: SizedBox.fromSize(
              size: Size(56, 56), // button width and height
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen()));
                }, // button pressed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.info, size: 30.0,color: Color(0xFFFFEADA),), // icon
                    Text("Information",style: TextStyle(
                      fontFamily: "Inter-regular",color: Color(0xFFFFEADA),),), // text
                  ],
                ),
              ),
            ),),
            Expanded(child: SizedBox.fromSize(
              size: Size(56, 56), // button width and height
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen()));
                }, // button pressed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.videogame_asset, size: 30.0,color: Color(0xFFFFEADA),), // icon
                    Text("Game",style: TextStyle(
                      fontFamily: "Inter-regular",color: Color(0xFFFFEADA),),), // text
                  ],
                ),
              ),
            ),),
            SizedBox(height: 10,)
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0)
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Know more about dates", style: TextStyle(fontFamily: "Inter-SemiBold",fontSize: 23.0,
                        color: Color(0xFFFFEADA),),),
                      Text("There are more than 100 types all around the world", style: TextStyle(fontFamily: "Inter-Regular",fontSize: 13.0,
                        color: Color(0xFFFFEADA),),),
                      Search(),
                    ],),

                  width: double.infinity,
                  alignment: Alignment.center,

                ),
                Padding(padding: const EdgeInsets.only(top: 30, bottom: 30, left: 40,), child:Text("Dates species", style: TextStyle(fontFamily: "Inter-Bold", fontSize: 23.0,),),),

                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 25.0,
                  mainAxisSpacing: 25.0,

                  padding: const EdgeInsets.only(left: 25, right: 25),
                  children: <Widget>[
                    getButton(0, 'Ajwa', 'assets/datesicon/ajwa2.png', Color(0xFFFFEADA)),
                    getButton(1, 'Medjool', 'assets/datesicon/medjool2.png', Color(0xFFFFD5A4)),
                    getButton(2, 'Rutab', 'assets/datesicon/rutab2.png', Color(0xFFFFB5A4)),
                    getButton(3, 'Nabtat Ali', 'assets/datesicon/nabtatali2.png', Color(0xFFFDEAC3)),
                    getButton(4, 'Galaxy', 'assets/datesicon/galaxy2.png', Color(0xFFF4CBBA)),
                    getButton(5, 'Meneifi', 'assets/datesicon/meneifi2.png', Color(0xFFCBA18F)),
                    getButton(6, 'Sugaey', 'assets/datesicon/sugaey2.png', Color(0xFFFFEADA)),
                    getButton(7, 'Shaishe', 'assets/datesicon/shaishe2.png', Color(0xFFFFD5A4)),
                    getButton(8, 'Sokari', 'assets/datesicon/sokari2.png', Color(0xFFFFB5A4)),
                  ],
                ),
                const SizedBox(height:20,),
              ],
            ),],),),);
  }

  ElevatedButton getButton(int id, String title, String image, Color colors) {
    return ElevatedButton(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(image, height: 100),
          ),
          SizedBox(
            width: 100,
            height: 10,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 3.0,
              fontSize: 17.0,
              color: Colors.black54,
              fontFamily: "Inter-SemiBold",),
          ),],),
      style: ElevatedButton.styleFrom(
        backgroundColor: colors,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => datesinfo(id)));
      },
    );
  }
}

class GameScreen extends StatefulWidget {
  final newscore;
  GameScreen({this.newscore});
  @override
  _GameScreenState createState() => _GameScreenState();
}
class _GameScreenState extends State<GameScreen> {
  Game gm = Game();
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const InstructionGame()));
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                ),
              ),
            ),

          ]),
    );
  }

}

