// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class States {
  static int visited = 0;
  static int deepth = 0;
  static int cost = 0;
}

class Structure {
  int xP1 = 1, yP1 = 1;
  int xP2 = 1, yP2 = 1;
  int xP3 = 1, yP3 = 1;
  int xP4 = 1, yP4 = 1;
  int xP5 = 1, yP5 = 1;
  int xG1 = 1, yG1 = 1;
  int xG2 = 1, yG2 = 1;
  int xG3 = 1, yG3 = 1;
  int xG4 = 1, yG4 = 1;
  int xG5 = 1, yG5 = 1;
  var depth = 0;
  int cost = 0;

  States state = States();
  // Structure parent=Structure();
  //Level 1
  List<List<String>> board = [
    ["", "", "", "", "", "", ""],
    ["", "", "", "", "", "", ""],
    ["", "", "", "", "", "", ""],
    ["", "P1", "T", "T", "T", "finalP1", ""],
    ["", "", "", "", "", "", ""],
    ["", "", "", "", "", "", ""],
    ["", "", "", "", "", "", ""],
  ];

  int selectedLvl = 1;
  selectedLevel(int selected) {
    switch (selected) {
      case 1:
        return board = [
          ["", "", "", "", "", "", ""],
          ["", "", "", "", "", "", ""],
          ["", "", "", "", "", "", ""],
          ["", "P1", "T", "T", "T", "finalP1", ""],
          ["", "", "", "", "", "", ""],
          ["", "", "", "", "", "", ""],
          ["", "", "", "", "", "", ""],
        ];

      case 2:
        return board = [
          ["", "", "", "", "", "", ""],
          ["", "", "", "", "", "", ""],
          ["", "", "P1", "", "P2", "", ""],
          ["", "", "T", "", "T", "", ""],
          ["", "", "T", "", "T", "", ""],
          ["", "", "finalP1", "", "finalP2", "", ""],
          ["", "", "", "", "", "", ""],
        ];

      case 3:
        return board = [
          ["", "", "", "", "", "", ""],
          ["", "", "", "", "", "", ""],
          ["", "", "", "", "", "", ""],
          ["", "", "P1", "finalP2", "T", "", ""],
          ["", "", "", "T", "", "", ""],
          ["", "", "T", "finalP1", "P2", "", ""],
          ["", "", "", "", "", "", ""],
        ];

      case 4:
        return board = [
          ["", "", "", "", "", "", ""],
          ["", "", "", "", "", "", ""],
          ["", "", "", "", "", "", ""],
          ["", "P1", "", "P2", "", "P3", ""],
          ["", "finalP3", "T", "finalP2", "T", "finalP1", ""],
          ["", "", "", "T", "", "", ""],
          ["", "", "", "", "", "", ""],
        ];
      case 5:
        return board = [
          ["", "", "", "", "", "", ""],
          ["", "", "", "", "", "", ""],
          ["", "", "P1", "", "", "", ""],
          ["", "", "finalP1", "P2", "", "T", ""],
          ["", "", "T", "finalP2", "P3", "finalP4", ""],
          ["", "", "T", "T", "finalP3", "P4", ""],
          ["", "", "", "", "", "", ""],
        ];
      case 6:
        board = [
          ["", "", "", "", "", "", ""],
          ["", "", "", "", "", "", ""],
          ["", "", "T", "T", "P2", "", ""],
          ["", "", "T", "P1", "finalP1", "P5", ""],
          ["", "", "P3", "", "P4", "finalP4", ""],
          ["", "", "", "", "", "", ""],
          ["", "", "", "", "", "", ""],
        ];
        xG2 = 2;
        yG2 = 4;
        xG3 = 4;
        yG3 = 4;
        xG5 = 3;
        yG5 = 5;
        break;
      case 7:
        xP1 = 1;
        xP2 = 1;
        xP3 = 1;
        xP4 = 1;
        xP5 = 1;
        yP1 = 1;
        yP2 = 1;
        yP3 = 1;
        yP4 = 1;
        yP5 = 1;
        xG1 = 1;
        yG1 = 1;
        xG2 = 1;
        yG2 = 1;
        xG3 = 1;
        yG3 = 1;
        xG4 = 1;
        yG4 = 1;
        xG5 = 1;
        yG5 = 1;
        break;
    }
    printState();
  }

  getAllPositions() {
    player1Position();
    player2Position();
    player3Position();
    player4Position();
    player5Position();
    goal1Position();
    goal2Position();
    goal3Position();
    goal4Position();
    goal5Position();

    drawGoals(xG1, yG1, "finalP1");
    drawGoals(xG2, yG2, "finalP2");
    drawGoals(xG3, yG3, "finalP3");
    drawGoals(xG4, yG4, "finalP4");
    drawGoals(xG5, yG5, "finalP5");

    // print(getNextState());
  }

  drawGoals(int xGoal, int yGoal, String goals) {
    if (board[xGoal][yGoal] == "T") {
      return board[xGoal][yGoal] = goals;
    }
  }

  bool checkMoves(String direction, int playerX, int playerY) {
    if (direction == "right") {
      if (board[playerX][playerY + 1] != "P1" &&
          board[playerX][playerY + 1] != "P2" &&
          board[playerX][playerY + 1] != "P3" &&
          board[playerX][playerY + 1] != "P4" &&
          board[playerX][playerY + 1] != "P5") {
        if (board[playerX][playerY + 1] != "") {
          return true;
        }
      }
    }
    if (direction == "left") {
      if (board[playerX][playerY - 1] != "P1" &&
          board[playerX][playerY - 1] != "P2" &&
          board[playerX][playerY - 1] != "P3" &&
          board[playerX][playerY - 1] != "P4" &&
          board[playerX][playerY - 1] != "P5") {
        if (board[playerX][playerY - 1] != "") {
          return true;
        }
      }
    }
    if (direction == "up") {
      if (board[playerX - 1][playerY] != "" &&
          board[playerX - 1][playerY] != "P1" &&
          board[playerX - 1][playerY] != "P2" &&
          board[playerX - 1][playerY] != "P3" &&
          board[playerX - 1][playerY] != "P4" &&
          board[playerX - 1][playerY] != "P5") {
        return true;
      }
    }

    if (direction == "down") {
      if (board[playerX + 1][playerY] != "" &&
          board[playerX + 1][playerY] != "P1" &&
          board[playerX + 1][playerY] != "P2" &&
          board[playerX + 1][playerY] != "P3" &&
          board[playerX + 1][playerY] != "P4" &&
          board[playerX + 1][playerY] != "P5") {
        return true;
      }
    }
    return false;
  }

  move(String direction, int xPlayer, int yPlayer) {
    if (direction == "up") {
      if (board[xPlayer][yPlayer] != "T") {
        if (checkMoves(direction, xPlayer, yPlayer)) {
          board[xPlayer - 1][yPlayer] = board[xPlayer][yPlayer];
          board[xPlayer][yPlayer] = "T";
          getAllPositions();
        }
      }
    }
    if (direction == "down") {
      if (board[xPlayer][yPlayer] != "T") {
        if (checkMoves(direction, xPlayer, yPlayer)) {
          board[xPlayer + 1][yPlayer] = board[xPlayer][yPlayer];
          board[xPlayer][yPlayer] = "T";
          getAllPositions();
        }
      }
    }
    if (direction == "right") {
      if (board[xPlayer][yPlayer] != "T") {
        if (checkMoves(direction, xPlayer, yPlayer)) {
          board[xPlayer][yPlayer + 1] = board[xPlayer][yPlayer];
          board[xPlayer][yPlayer] = "T";
          getAllPositions();
        }
      }
    }
    //---------------
    if (direction == "left") {
      if (board[xPlayer][yPlayer] != "T") {
        if (checkMoves(direction, xPlayer, yPlayer)) {
          board[xPlayer][yPlayer - 1] = board[xPlayer][yPlayer];
          board[xPlayer][yPlayer] = "T";
          getAllPositions();
        }
      }
    }
    //-----------------

    //-----------------
  }

  doMove(direction) {
    bool check1 = checkMoves(direction, xP1, yP1);
    bool check2 = checkMoves(direction, xP2, yP2);
    bool check3 = checkMoves(direction, xP3, yP3);
    bool check4 = checkMoves(direction, xP4, yP4);
    bool check5 = checkMoves(direction, xP5, yP5);
    if (check1) {
      move(direction, xP1, yP1);
    }
    if (check2) {
      move(direction, xP2, yP2);
    }
    if (check3) {
      move(direction, xP3, yP3);
    }
    if (check4) {
      move(direction, xP4, yP4);
    }
    if (check5) {
      move(direction, xP5, yP5);
    }
  }

  int herustic() {
    return (xP1 - xG1).abs() +
        (yP1 - yG1).abs() +
        (xP2 - xG2).abs() +
        (yP2 - yG2).abs() +
        (xP3 - xG3).abs() +
        (yP3 - yG3).abs() +
        (xP4 - xG4).abs() +
        (yP4 - yG4).abs() +
        (xP5 - xG5).abs() +
        (yP5 - yG5).abs();
  }

  getCost() {
    cost = herustic().toInt() + depth;
    print("Herustic  = ${herustic().toInt()}");
    print("Depth = $depth");
    print("Cost = $cost");
    print("--------------------------");
    return cost;
  }

  List<Structure> getNextStates() {
    // state.depth++;
    depth++;
    getCost();
    List<Structure> nextStates = [];
    Structure s = deepCopy();
    bool checkRight = s.checkCloneMove("right");
    bool checkLeft = s.checkCloneMove("left");
    bool checkUp = s.checkCloneMove("up");
    bool checkDown = s.checkCloneMove("down");
    if (checkUp) {
      s = deepCopy();
      s.doMove("up");
      print("Moving up");
      nextStates.add(s);

      print(board);
      print(s.board);
      print("=======================================");
    }
    if (checkDown) {
      s = deepCopy();
      print("Moving down");
      s.doMove("down");

      nextStates.add(s);

      // print(board);
      // print(s.board);
      // print("=======================================");
    }
    if (checkRight) {
      s = deepCopy();
      s.doMove("right");
      print("Moving Right");
      nextStates.add(s);

      // print(board);
      // print(s.board);
      // print("=======================================");
    }

    if (checkLeft) {
      s = deepCopy();
      s.doMove("left");
      print("Moving left");
      nextStates.add(s);

      // print(board);
      // print(s.board);
      // print("=======================================");
    }

    // for (int i = 0; i < nextStates.length; i++) {
    //   print("Next States $i: ${nextStates[i].board}");
    // }
    return nextStates;
  }

  deepCopy() {
    Structure s = Structure();

    s.xP1 = xP1;
    s.xP2 = xP2;
    s.xP3 = xP3;
    s.xP4 = xP4;
    s.xP5 = xP5;
    s.yP1 = yP1;
    s.yP2 = yP2;
    s.yP3 = yP3;
    s.yP4 = yP4;
    s.yP5 = yP5;
    s.xG1 = xG1;
    s.xG2 = xG2;
    s.xG3 = xG3;
    s.xG4 = xG4;
    s.xG5 = xG5;
    s.yG1 = yG1;
    s.yG2 = yG2;
    s.yG3 = yG3;
    s.yG4 = yG4;
    s.yG5 = yG5;
    s.depth = depth;
    s.cost = cost;
    s.selectedLvl = selectedLvl;
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board.length; j++) {
        s.board[i][j] = board[i][j];
      }
    }

    return s;
  }

  late Structure s = deepCopy();
  bool checkCloneMove(direction) {
    bool check5 = checkMoves(direction, xP5, yP5);
    bool check4 = checkMoves(direction, xP4, yP4);
    bool check3 = checkMoves(direction, xP3, yP3);
    bool check2 = checkMoves(direction, xP2, yP2);
    bool check1 = checkMoves(direction, xP1, yP1);

    if (check1 || check2 || check3 || check4 || check5) {
      return true;
    }
    return false;
  }

  Widget printState() {
    getAllPositions();
    return Center(
      child: Column(
        children: [
          Text(
            "Depth is : ${States.deepth}",
            style: const TextStyle(color: Colors.green),
          ),
          Text(
            "Visited nodes number is : ${States.visited}",
            style: const TextStyle(color: Colors.green),
          ),
          // Text("Next State: "
          //     "box1 = [${s.xP1}] [${s.yP1}] "
          //     "box2 = [${s.xP2}] [${s.yP2}] "
          //     "box3 = [${s.xP3}] [${s.yP3}] "
          //     "box4 = [${s.xP4}] [${s.yP4}] "
          //     "box5 = [${s.xP5}] [${s.yP5}] "
          //     ""),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Board Box 1 [$xP1][$yP1]= ${board[xP1][yP1]}",
                    style: const TextStyle(color: Colors.blue),
                  ),
                  Text(
                    "Board Box 2 [$xP2][$yP2]= ${board[xP2][yP2]}",
                    style: const TextStyle(color: Colors.blue),
                  ),
                  Text(
                    "Board Box 3 [$xP3][$yP3]= ${board[xP3][yP3]}",
                    style: const TextStyle(color: Colors.blue),
                  ),
                  Text(
                    "Board Box 4 [$xP4][$yP4]= ${board[xP4][yP4]}",
                    style: const TextStyle(color: Colors.blue),
                  ),
                  Text(
                    "Board Box 5 [$xP5][$yP5]= ${board[xP5][yP5]}",
                    style: const TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  Text(
                    "Board Goal 1 [$xG1][$yG1]= ${board[xG1][yG1]}",
                    style: const TextStyle(color: Colors.red),
                  ),
                  Text(
                    "Board Goal 2 [$xG2][$yG2]= ${board[xG2][yG2]}",
                    style: const TextStyle(color: Colors.red),
                  ),
                  Text(
                    "Board Goal 3 [$xG3][$yG3]= ${board[xG3][yG3]}",
                    style: const TextStyle(color: Colors.red),
                  ),
                  Text(
                    "Board Goal 4 [$xG4][$yG4]= ${board[xG4][yG4]}",
                    style: const TextStyle(color: Colors.red),
                  ),
                  Text(
                    "Board Goal 5 [$xG5][$yG5]= ${board[xG5][yG5]}",
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  equal() {}
  isFinal() {
    getAllPositions();
    if (xP1 == xG1 &&
        yP1 == yG1 &&
        xP2 == xG2 &&
        yP2 == yG2 &&
        xP3 == xG3 &&
        yP3 == yG3 &&
        xP4 == xG4 &&
        yP4 == yG4 &&
        xP5 == xG5 &&
        yP5 == yG5) {
      Get.dialog(SimpleDialog(
        alignment: Alignment.center,
        titlePadding: const EdgeInsets.all(10),
        insetPadding: const EdgeInsets.all(10),
        elevation: 0,
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        title: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  "You Won Level $selectedLvl!!",
                ),
                // Text("Depth is : ${States.deepth} "),
                // Text("visited nodes number is : ${States.visited} "),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.blue,
        // children: [
        //   MaterialButton(
        //       color: Colors.blue,
        //       onPressed: () {
        //         selectedLvl++;
        //         Get.to(() => MyHomePage());
        //       },
        //       child: const Text(
        //         "Next Level",
        //         style: TextStyle(color: Colors.white),
        //       )),
        // ],
      ));
      print("won");
      return true;
    }
    print("didnt win");
    return false;
  }

//*******************************************************************
  player1Position() {
    for (int xP1 = 0; xP1 < board.length; xP1++) {
      for (int yP1 = 0; yP1 < board.length; yP1++) {
        if (board[xP1][yP1] == "P1") {
          this.xP1 = xP1;
          this.yP1 = yP1;
        }
      }
    }
  }

  //-------------------------------------

  player2Position() {
    for (int xP2 = 0; xP2 < board.length; xP2++) {
      for (int yP2 = 0; yP2 < board.length; yP2++) {
        if (board[xP2][yP2] == "P2") {
          this.xP2 = xP2;
          this.yP2 = yP2;
        }
      }
    }
  } //-------------------------------------

  player3Position() {
    for (int xP3 = 0; xP3 < board.length; xP3++) {
      for (int yP3 = 0; yP3 < board.length; yP3++) {
        if (board[xP3][yP3] == "P3") {
          this.xP3 = xP3;
          this.yP3 = yP3;
        }
      }
    }
  } //-------------------------------------

  player4Position() {
    for (int xP4 = 0; xP4 < board.length; xP4++) {
      for (int yP4 = 0; yP4 < board.length; yP4++) {
        if (board[xP4][yP4] == "P4") {
          this.xP4 = xP4;
          this.yP4 = yP4;
        }
      }
    }
  } //-------------------------------------

  player5Position() {
    for (int xP5 = 0; xP5 < board.length; xP5++) {
      for (int yP5 = 0; yP5 < board.length; yP5++) {
        if (board[xP5][yP5] == "P5") {
          this.xP5 = xP5;
          this.yP5 = yP5;
        }
      }
    }
  } //*******************************************************************

  goal1Position() {
    for (int xG1 = 0; xG1 < board.length; xG1++) {
      for (int yG1 = 0; yG1 < board.length; yG1++) {
        if (board[xG1][yG1] == "finalP1") {
          this.xG1 = xG1;
          this.yG1 = yG1;
        }
      }
    }
  }

  //-------------------------------------

  goal2Position() {
    for (int xG2 = 0; xG2 < board.length; xG2++) {
      for (int yG2 = 0; yG2 < board.length; yG2++) {
        if (board[xG2][yG2] == "finalP2") {
          this.xG2 = xG2;
          this.yG2 = yG2;
        }
      }
    }
  } //-------------------------------------

  goal3Position() {
    for (int xG3 = 0; xG3 < board.length; xG3++) {
      for (int yG3 = 0; yG3 < board.length; yG3++) {
        if (board[xG3][yG3] == "finalP3") {
          this.xG3 = xG3;
          this.yG3 = yG3;
        }
      }
    }
  } //-------------------------------------

  goal4Position() {
    for (int xG4 = 0; xG4 < board.length; xG4++) {
      for (int yG4 = 0; yG4 < board.length; yG4++) {
        if (board[xG4][yG4] == "finalP4") {
          this.xG4 = xG4;
          this.yG4 = yG4;
        }
      }
    }
  } //-------------------------------------

  goal5Position() {
    for (int xG5 = 0; xG5 < board.length; xG5++) {
      for (int yG5 = 0; yG5 < board.length; yG5++) {
        if (board[xG5][yG5] == "finalP5") {
          this.xG5 = xG5;
          this.yG5 = yG5;
        }
      }
    }
  }

// Data({this.x, this.y, this.gridState});
}
