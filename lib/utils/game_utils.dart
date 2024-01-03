import 'package:flutter/material.dart';
import 'package:flutter_cardgame/models/cards_game_model.dart';

class Game {
  final Color hiddenCard = Colors.red;
  List<CardsModel> cards_list = [
    CardsModel(name: "Circles", imageUrl: 'imageUrl', color: Colors.green),
    CardsModel(name: "Bulat", imageUrl: 'imageUrl', color: Colors.green),
    CardsModel(name: "Squares", imageUrl: 'imageUrl', color: Colors.yellow),
    CardsModel(name: "Heart", imageUrl: 'imageUrl', color: Colors.cyan),
    CardsModel(name: "Diamonds", imageUrl: 'imageUrl', color: Colors.amber),
    CardsModel(name: "Star", imageUrl: 'imageUrl', color: Colors.pink),
    CardsModel(name: "Segi Tiga", imageUrl: 'imageUrl', color: Colors.blue),
    CardsModel(name: "Bintang", imageUrl: 'imageUrl', color: Colors.pink),
    CardsModel(name: "Hati", imageUrl: 'imageUrl', color: Colors.cyan),
    CardsModel(name: "Belian", imageUrl: 'imageUrl', color: Colors.amber),
    CardsModel(name: "Segi Empat", imageUrl: 'imageUrl', color: Colors.yellow),
    CardsModel(name: "Triangles", imageUrl: 'imageUrl', color: Colors.blue),
  ];

  List<Color>? gameColors;
  List<String>? gameImg;

  final String hiddenCardpath = " ";

  final int cardCount = 12;

  List<Map<int, String>> matchCheck = [];
  List<String> complete = [];

  //methods
  void initGame() {
    cards_list.shuffle();
  }
}
