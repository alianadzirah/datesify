import 'package:flutter/material.dart';

class Game {
  final Color hiddenCard = Colors.red;
  List<Color>? gameColors;
  List<String>? gameImg;
  List<Color> cards = [
    Colors.green,
    Colors.yellow,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.blue
  ];

  late List<String> card1;
  late List<String> card2;

  final String hiddenCardpath = "assets/images/hidden.png";

  List<String> cards_list = [
    "assets/images/ajwa/1.jpg",
    "assets/images/medjool/1.png",
    "assets/images/ajwa/1.jpg",

    "assets/images/rutab/1.JPG",
    "assets/images/meneifi/1.jpg",
    "assets/images/medjool/1.png",

    "assets/images/meneifi/1.jpg",
    "assets/images/rutab/1.JPG",

    "assets/images/shaishe/1.JPG",
    "assets/images/sokari/1.jpg",
    "assets/images/shaishe/1.JPG",
    "assets/images/sokari/1.jpg",
  ];

  final int cardCount = 12;
  List<Map<int, String>> matchCheck = [];

  //methods
  void initGame() {
    gameColors = List.generate(cardCount, (index) => hiddenCard);
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}