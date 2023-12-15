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
  final String hiddenCardpath = " ";
  List<String> cards_list = [
    "Circles",
    "Triangles",
    "Bulat",
    "Squares",
    "Heart",
    "Diamonds",
    "Star",
    "Segi Tiga",
    "Bintang",
    "Hati",
    "Belian",
    "Segi Empat",
  ];
  final int cardCount = 12;
  List<String> answer = [
    "Circles=Bulat",
    "Triangles=Segi Tiga",
    "Bulat=Circles",
    "Squares=Segi Empat",
    "Heart=Hati",
    "Diamonds=Belian",
    "Star=Bintang",
    "Segi Tiga=Triangles",
    "Bintang=Star",
    "Hati=Heart",
    "Belian=Diamonds",
    "Segi Empat=Squares",
  ];
  List<Map<int, String>> matchCheck = [];
  List<String> complete = [];

  //methods
  void initGame() {
    gameColors = List.generate(cardCount, (index) => hiddenCard);
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}


