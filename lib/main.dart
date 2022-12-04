// ignore_for_file: avoid_print

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:keymap/keymap.dart';
import 'package:flutter/material.dart';
import 'package:soko_number/game/logic.dart';
import 'package:soko_number/game/structure.dart';
import 'package:soko_number/view/explandableFab.dart';
import 'package:soko_number/view/widgets/selectlvlbut.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      navigatorKey: navigatorKey,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Structure s = Structure();
  Structure n = Structure();
  Logic l = Logic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Level ${s.selectedLvl}"), actions: [
        IconButton(
            onPressed: () {
              setState(() {
                s.selectedLevel(s.selectedLvl);
              });
            },
            icon: const Icon(
              Icons.restart_alt,
            )),
      ]),
      drawer: Drawer(
        child: Column(
          children: [
            const Text("Select Level : "),
            CustomBottomLevels(
                text: "Level 1",
                onPressed: () {
                  setState(() {
                    s.selectedLvl = 1;
                    s.selectedLevel(s.selectedLvl);
                  });
                }),
            CustomBottomLevels(
                text: "Level 2",
                onPressed: () {
                  setState(() {
                    s.selectedLvl = 2;
                    s.selectedLevel(s.selectedLvl);
                    print(s.selectedLvl);
                    print(s.selectedLevel(s.selectedLvl));
                  });

                  // Get.to(() => const MyHomePage());
                  // setState(() {});
                }),
            CustomBottomLevels(
                text: "Level 3",
                onPressed: () {
                  setState(() {
                    s.selectedLvl = 3;
                    s.selectedLevel(s.selectedLvl);
                  });
                }),
            CustomBottomLevels(
                text: "Level 4",
                onPressed: () {
                  setState(() {
                    s.selectedLvl = 4;
                    s.selectedLevel(s.selectedLvl);
                  });
                }),
            CustomBottomLevels(
                text: "Level 5",
                onPressed: () {
                  setState(() {
                    s.selectedLvl = 5;
                    s.selectedLevel(s.selectedLvl);
                  });
                }),
            CustomBottomLevels(
                text: "Level 6",
                onPressed: () {
                  setState(() {
                    s.selectedLvl = 6;
                    s.selectedLevel(s.selectedLvl);
                  });
                }),
            CustomBottomLevels(
                text: "Reset",
                onPressed: () {
                  setState(() {
                    s.selectedLvl = 7;
                    s.selectedLevel(s.selectedLvl);
                  });
                }),
          ],
        ),
      ),
      floatingActionButton: ExpandableFab(
        distance: 120,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                l.bfs(s);
              });
            },
            child: const Text("BFS"),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                l.dfs(s);
              });
            },
            child: const Text("DFS"),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                s.depth = 0;
                l.uCS(s);
              });
            },
            child: const Text("UCS"),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                s.depth = 0;
                l.aStar(s);
              });
            },
            child: const Text("Astar"),
          ),
        ],
      ),
      body: _buildGameBody(),
    );
  }

  Widget _buildGameBody() {
    int gridStateLength = s.board.length;
    // s.getAllPositions();
    return SingleChildScrollView(
      child: Center(
        child: Column(children: <Widget>[
          Container(
            height: 400,
            width: 400,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2.0)),
            child: Center(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridStateLength,
                  ),
                  itemBuilder: _drawBoardItems,
                  itemCount: gridStateLength * gridStateLength,
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                s.getNextStates();
                // print(s.getNextState());
              });
            },
            color: Colors.blue,
            child: const Text("Get Next States"),
          ),

          s.printState(),
          IconButton(
              splashColor: Colors.blue,
              onPressed: () {
                s.doMove("up");
                // s.isFinal();
                setState(
                  () {
                    s.isFinal();
                  },
                );
              },
              icon: const Icon(Icons.arrow_circle_up)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  splashColor: Colors.blue,
                  onPressed: () {
                    s.doMove("left");
                    // s.isFinal();
                    setState(
                      () {
                        s.isFinal();
                      },
                    );
                  },
                  icon: const Icon(Icons.arrow_circle_left_outlined)),
              const SizedBox(
                width: 50,
              ),
              IconButton(
                  splashColor: Colors.blue,
                  onPressed: () {
                    s.doMove("right");
                    // s.isFinal();
                    setState(
                      () {
                        s.isFinal();
                      },
                    );
                  },
                  icon: const Icon(Icons.arrow_circle_right_outlined)),
            ],
          ),
          IconButton(
              splashColor: Colors.blue,
              onPressed: () {
                s.doMove("down");
                // s.isFinal();
                setState(
                  () {
                    s.isFinal();
                  },
                );
              },
              icon: const Icon(Icons.arrow_circle_down)),
          //----------------------------------------------
        ]),
      ),
    );
  }

  Widget _drawBoardItems(BuildContext context, int index) {
    // s.selectedLevel(s.selectedLvl);
    // print(s.selectedLvl);

    int gridStateLength = s.board.length;
    int x, y;
    x = (index / gridStateLength).floor();
    y = (index % gridStateLength);

    return KeyboardWidget(
      bindings: [
        KeyAction(LogicalKeyboardKey.arrowRight, "Move Right", () {
          s.doMove("right");
          setState(
            () {
              s.isFinal();
            },
          );
        }),
        KeyAction(LogicalKeyboardKey.arrowLeft, "Move Left", () {
          s.doMove("left");
          setState(() {
            s.isFinal();
          });
        }),
        KeyAction(
          LogicalKeyboardKey.arrowUp,
          "Move Up",
          () {
            s.doMove("up");
            s.isFinal();
            setState(
              () {
                s.isFinal();
              },
            );
          },
        ),
        KeyAction(LogicalKeyboardKey.arrowDown, "Move Down", () {
          s.doMove("down");
          setState(
            () {
              s.isFinal();
            },
          );
        }),
      ],
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 0.1)),
          child: Center(
            child: _drawBoardItem(x, y),
          ),
        ),
      ),
    );
  }

  Widget _drawBoardItem(int x, int y) {
    switch (s.board[x][y]) {
      case '':
        //Blocks cant reach
        return Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.pink,
        );
      //Boxes (that can move)
      case 'P1':
        if (s.xP1 == s.xG1 && s.yP1 == s.yG1) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            color: Colors.red,
            child: const Center(
                child: Text(
              "1",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          );
        }
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          color: Colors.blueGrey,
          child: const Center(
              child: Text(
            "1",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        );
      case 'P2':
        if (s.xP2 == s.xG2 && s.yP2 == s.yG2) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            color: Colors.pinkAccent,
            child: const Center(
                child: Text(
              "2",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          );
        }
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          color: Colors.blueGrey,
          child: const Center(
              child: Text(
            "2",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        );
      case 'P3':
        if (s.xP3 == s.xG3 && s.yP3 == s.yG3) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            color: Colors.green,
            child: const Center(
                child: Text(
              "3",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          );
        }
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          color: Colors.blueGrey,
          child: const Center(
              child: Text(
            "3",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        );
      case 'P4':
        if (s.xP4 == s.xG4 && s.yP4 == s.yG4) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            color: Colors.yellow,
            child: const Center(
                child: Text(
              "4",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          );
        }
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          color: Colors.blueGrey,
          child: const Center(
              child: Text(
            "4",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        );
      case 'P5':
        if (s.xP5 == s.xG5 && s.yP5 == s.yG5) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            color: Colors.deepOrange,
            child: const Center(
                child: Text(
              "5",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          );
        }
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          color: Colors.blueGrey,
          child: const Center(
              child: Text(
            "5",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        );
      case 'T':
        //Available
        return Container(
          color: Colors.grey,
        );
      //targets
      case 'finalP1':
        return Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey,
            child: const Center(
              child: Text(
                "1",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        );
      case 'finalP2':
        return Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey,
            child: const Center(
              child: Text(
                "2",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        );
      case 'finalP3':
        return Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey,
            child: const Center(
              child: Text(
                "3",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        );
      case 'finalP4':
        return Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey,
            child: const Center(
              child: Text(
                "4",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        );
      case 'finalP5':
        return Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey,
            child: const Center(
              child: Text(
                "5",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        );
      default:
        return Text(s.board[x][y].toString());
    }
  }
}
