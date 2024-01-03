import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cardgame/utils/game_utils.dart';
import 'package:flutter_cardgame/widgets/quiz_app_bar.dart';
import 'package:flutter_cardgame/widgets/quiz_body.dart';
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
              ));
        });
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
      // bottomNavigationBar: QuizBottomBar(),
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

  late List isMatch = List.generate(_game.cards_list.length, (index) => false);
  bool isAlreadyAnswered = false;

  int cardCount = 0;
  Map<String, dynamic>? answerCheck1;
  Map<String, dynamic>? answerCheck2;
  bool isDark = false;
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
        const SizedBox(
          height: 24,
        ),
        const Text(
          "Memory Card Game",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
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
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _game.cards_list.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    padding: const EdgeInsets.all(12.0),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            isMatch[index] = true;
                            if (answerCheck1 == null) {
                              setState(() {
                                answerCheck1 = {
                                  "color": _game.cards_list[index].color,
                                  "index": index
                                };
                              });
                            } else if (answerCheck2 == null) {
                              setState(() {
                                answerCheck2 = {
                                  "color": _game.cards_list[index].color,
                                  "index": index
                                };
                              });
                            }

                            if (answerCheck2 != null && answerCheck2 != null) {
                              if (answerCheck1!['color'] !=
                                  answerCheck2!['color']) {
                                ///when wrong answer reset isMatch
                                Future.delayed(Duration(milliseconds: 500), () {
                                  setState(() {
                                    isMatch[answerCheck1!['index']] = false;
                                    isMatch[answerCheck2!['index']] = false;
                                    answerCheck1 = null;
                                    answerCheck2 = null;
                                  });
                                });

                                print("reseting answered cards");
                              } else {
                                ///when true answer reset current choice
                                setState(() {
                                  answerCheck1 = null;
                                  answerCheck2 = null;
                                });
                                print("proceed next choice");
                              }
                            }
                          });
                          // print(answerCheck2);
                          // print(answerCheck1);
                          if (!isMatch.contains(false)) {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) => Dialog(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      child: Container(
                                        alignment: FractionalOffset.center,
                                        height: 300.0,
                                        padding: const EdgeInsets.all(20.0),
                                        child: Lottie.asset(
                                          "assets/correct_animation.json",
                                          fit: BoxFit.contain,
                                          repeat: false,
                                        ),
                                      ),
                                    ));
                            Future.delayed(const Duration(seconds: 2), () {
                              Navigator.pop(context);
                            });
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.all(4.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: ShapeDecoration(
                            color: !isMatch[index]
                                ? isDark
                                    ? Colors.grey
                                    : Colors.orange
                                : _game.cards_list[index].color,
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
                            child: AutoSizeText(
                              !isMatch[index]
                                  ? ""
                                  : _game.cards_list[index].name!,
                              minFontSize: 16,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }))),
      ],
    );
  }
}
