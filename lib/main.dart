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
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _game.cards_list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  itemBuilder: (context, index) {
                    return GestureDetector (
                      onTap: () {
                        setState(() {
                          isMatch[index] = true;
                          if (answerCheck1 == null) {
                          setState(() {
                            answerCheck1 = {"color": _game.cards_list[index].color,"index": index};
                          });
                        } else if (answerCheck2 == null) {
                            setState(() {
                            answerCheck2 = {"color": _game.cards_list[index].color,"index": index};
                          });
                          }
                          if (answerCheck2 != null && answerCheck2 != null) {
                              if (answerCheck1!['color'] != answerCheck2!['color']) {
                                ///when wrong answer reset isMatch
                                Future.delayed(
                                    const Duration(milliseconds: 500), () {
                                  setState(() {
                                    isMatch[answerCheck1!['index']] = false;
                                    isMatch[answerCheck2!['index']] = false;
                                    answerCheck1 = null;
                                    answerCheck2 = null;
                                    AssetsAudioPlayer.newPlayer().open(
                                      Audio(
                                          "assets/audios/wrong_sound.mp3"),
                                      autoStart: true,
                                      showNotification: true,
                                    );
                                  });
                                });
                                print("reseting answered cards");
                              } else {
                                ///when true answer reset current choice
                                AssetsAudioPlayer.newPlayer().open(
                                  Audio(
                                      "assets/audios/right_sound.mp3"),
                                  autoStart: true,
                                  showNotification: true,
                                );
                                setState(() {
                                  answerCheck1 = null;
                                  answerCheck2 = null;
                                });
                                print("proceed next choice");
                              }
                            }

                          if (!isMatch.contains(false)) {
                            AssetsAudioPlayer.newPlayer().open(
                              Audio(
                                  "assets/audios/congratulation_sound.mp3"),
                              autoStart: true,
                              showNotification: true,
                            );
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
                        });
                        // print(answerCheck2);
                        // print(answerCheck1);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        margin: EdgeInsets.all(!isMatch[index] ? 1.0 : 4.0),
                        padding: const EdgeInsets.all(6.0),
                        decoration: ShapeDecoration(
                          color: !isMatch[index]
                              ? isDark
                              ? Colors.grey
                              : Colors.orange
                              : _game.cards_list[index].color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(!isMatch[index] ? 8.0 : 14.0),
                          ),
                          shadows: [
                            BoxShadow(
                              color: !isMatch[index] ? const Color(0x33FFC107) : const Color(0x33000000),
                              blurRadius: !isMatch[index] ? 8.0 : 4.0,
                              offset: const Offset(0, 4),
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
                              fontWeight: FontWeight.w700,
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
