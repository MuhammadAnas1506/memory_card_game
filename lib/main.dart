import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_cardgame/utils/game_utils.dart';
import 'package:flutter_cardgame/widgets/quiz_app_bar.dart';
import 'package:flutter_cardgame/widgets/quiz_body.dart';
import 'package:flutter_cardgame/widgets/quiz_bottom_bar.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //setting text style
  bool hideTest = false;
  final Game _game = Game();

  bool isMatch = false;
  bool isAlreadyAnswered = false;

  //game stats
  int tries = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _game.initGame();
  }

  void displayDialog(BuildContext context) {
    showDialog<String>(
        barrierColor: Colors.transparent,
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              icon: LottieBuilder.asset(
                "assets/correct_animation.json",
                fit: BoxFit.contain,
                repeat: false,
              )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: Drawer(),
      appBar: QuizAppBar(),
      body: Center(
        child: QuizBody(
          matchingQuiz: MatchingMemory(),
        ),
      ),
      bottomNavigationBar: QuizBottomBar(),
    );
  }
}

class MatchingMemory extends StatefulWidget {
  const MatchingMemory({Key? key}) : super(key: key);

  @override
  State<MatchingMemory> createState() => _MatchingMemoryState();
}

class _MatchingMemoryState extends State<MatchingMemory> {
  // settings for the text style
  TextStyle whiteText = const TextStyle(color: Colors.white);
  bool hideTest = false;
  final Game _game = Game();

  bool isMatch = false;
  bool isAlreadyAnswered = false;

  int cardCount = 0;
  String answerCheck = "";
  String answerCheck1 = "";
  String answerCheck2 = "";

  //game stats
  int score = 0;

  @override
  void initState() {
    super.initState();
    _game.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 40,),
        const Text(
          "Memory Card Game",
          style: TextStyle(
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20,),
        //Row(
        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
        //  crossAxisAlignment: CrossAxisAlignment.center,
        //  children: [
        //    info_card("Tries", "$tries"),
        //    info_card("Score", "$score"),
        //  ],
        //),
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.shortestSide,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              itemCount: _game.gameImg!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
              ),
              padding: const EdgeInsets.all(12.0),
              itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    //incrementing the clicks
                    //tries++;
                    _game.gameImg![index] = _game.cards_list[index];
                    _game.matchCheck.add({index: _game.cards_list[index]});
                  });
                  if (_game.matchCheck.length == 2) {
                    answerCheck1 = _game.matchCheck[0].values.first;
                    answerCheck2 = _game.matchCheck[1].values.first;
                    isAlreadyAnswered = _game.complete.contains(answerCheck1) && _game.complete.contains(answerCheck2);
                    if (_game.complete.contains(answerCheck1) && _game.complete.contains(answerCheck2) == true) {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        setState(() {
                          answerCheck1 = "";
                          answerCheck2 = "";
                          _game.matchCheck.clear();
                        });
                      });
                    } else if (_game.complete.contains(answerCheck2) == true) {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        setState(() {
                          _game.gameImg![_game.matchCheck[0].keys.first] =
                          _game.hiddenCardpath;
                          answerCheck1 = "";
                          answerCheck2 = "";
                          _game.matchCheck.clear();
                        });
                      });
                    } else if (_game.complete.contains(answerCheck1) == true) {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        setState(() {
                          _game.gameImg![_game.matchCheck[1].keys.first] =
                          _game.hiddenCardpath;
                          answerCheck1 = "";
                          answerCheck2 = "";
                          _game.matchCheck.clear();
                        });
                      });
                    } else {
                      answerCheck = answerCheck1+"="+answerCheck2;
                      isMatch = _game.answer.contains(answerCheck);
                      if (isMatch == true) {
                        //incrementing the score
                        score += 1;
                        _game.complete.add(answerCheck1);
                        _game.complete.add(answerCheck2);
                        answerCheck1 = "";
                        answerCheck2 = "";
                        answerCheck = "";
                        _game.matchCheck.clear();
                      }
                      else {
                        Future.delayed(const Duration(milliseconds: 500), () {
                          setState(() {
                            _game.gameImg![_game.matchCheck[0].keys.first] = _game.hiddenCardpath;
                            _game.gameImg![_game.matchCheck[1].keys.first] = _game.hiddenCardpath;
                            answerCheck1 = "";
                            answerCheck2 = "";
                            answerCheck = "";
                            _game.matchCheck.clear();
                          });
                        });
                      }
                    }
                    if (score == 6) {
                      showDialog(
                        context: context,
                        builder: (_) => Dialog(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          child: Container(
                            alignment: FractionalOffset.center,
                            height: 300.0,
                            padding: const EdgeInsets.all(20.0),
                            child:  Lottie.asset(
                              "correct_animation.json",
                              fit: BoxFit.contain,
                              repeat: false,
                            ),
                          ),
                        )
                      );
                    }
                  }
                },
                  child: Container(
                  margin: const EdgeInsets.all(4.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFFF8E1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x33FFC107),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      _game.gameImg![index],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
             }
            )
          )
        ),
      ],
    );
  }
}

