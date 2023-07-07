import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

import 'main.dart';

class Classification extends StatefulWidget {
  @override
  _ClassificationState createState() => new _ClassificationState();
}

class _ClassificationState extends State<Classification> {
  File? _image;
  List _results = [];

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: const Color(0xFF825B49)),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF825B49),
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
                    Text("Home",style: TextStyle(
                      fontFamily: "Inter-regular",color: Color(0xFFFFEADA),),), // text
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GameHome()));
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
      body:
      SingleChildScrollView(
        child:

        Column(
          children: [
            if (_image != null)
              Column(
                children: [
                  Padding(
                  padding: const EdgeInsets.all(30),
                  child:Text("Classification Result",
                    style: TextStyle(
                      color: Colors.brown,
                      fontFamily: "Inter-Bold", fontSize: 30.0,),),),
                  Container(margin: EdgeInsets.all(10), child: Image.file(_image!)),
                  Column(
                  children: _results != null
                      ? _results.map((result) {
                    return Column(
                      children: <Widget>[
                        SizedBox(
                          width: 350,
                          height: 70,
                          child:
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                            ),
                            child: Center(child:Text("${result["label"]} -  ${(result["confidence"]* 100).toStringAsFixed(1)}%",
                              style: TextStyle(
                                  letterSpacing: 3.0,
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontFamily: "Inter-Bold",fontWeight: FontWeight.bold),
                            ),
                            ),),),
                      ], );
                  }).toList()
                      : [],
                ),
                  Padding(padding: const EdgeInsets.all(30), child: SizedBox(width: 200, height: 50, child: ElevatedButton(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          "More info",
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen()));
                    },
                  ),),),
                ],
              )
            else
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 400,
                        height: 45,
                        child: IconButton(
                          icon: const Icon(Icons.help_outline),
                          color: Color(0xFF825B49),
                          alignment: Alignment.centerRight,
                          iconSize: 45,onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpScreen()));
                        },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 155,
                        height: 60,
                        child:
                        ElevatedButton(
                          child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                "Gallery",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    letterSpacing: 3.0,
                                    fontSize: 25.0,
                                    color: Color(0xFFFFFFFF),
                                    fontFamily: "Inter-Regular"),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color(0xFFC8A18F),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0))),
                          ),
                          onPressed: () async {
                            final File? image = await pickAnImage(ImageSource.gallery);
                            if (image == null) return;

                            imageClassification(image);
                          },
                        ),),
                      SizedBox(width: 20,height: 150,),
                      SizedBox(
                        width: 155,
                        height: 60,
                        child:ElevatedButton(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                "Camera",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    letterSpacing: 3.0,
                                    fontSize: 25.0,
                                    color: Color(0xFFFFFFFF),
                                    fontFamily: "Inter-Regular"),
                              ),],),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color(0xFFC8A18F),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0))),
                          ),
                          onPressed: () async {
                            final File? image = await pickAnImage(ImageSource.camera);
                            if (image == null) return;

                            imageClassification(image);
                          },
                        ),),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(40),
                    child: Opacity(
                      opacity: 0.6,
                      child: Center(
                        child: Text('No Image Selected!'  ,style: TextStyle(
                          letterSpacing: 3.0,
                          fontSize: 25.0,
                          color: Colors.grey,
                          fontFamily: "Inter-Regular",),),
                      ),
                    ),
                  ),
                ],
              ),

            SizedBox(
              width: 200.0,
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }

  Future loadModel() async {
    Tflite.close();
    String? res;
    res = await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
    print(res);
  }

  Future pickAnImage(ImageSource source) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: source, preferredCameraDevice: CameraDevice.rear);

    if (image == null) return;
    return File(image.path);
  }

  Future imageClassification(File image) async {
    // Run tensorflowlite image classification model on the image
    final List? results = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = results!;
      _image = image;
    });
  }
}
