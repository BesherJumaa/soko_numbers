import 'package:flutter/material.dart';

class Data {
  // List<List<String>> gridState = [
  //   ["", "", "", "", "", "", ""],
  //   ["", "", "", "", "", "", ""],
  //   ["", "", "", "", "", "", ""],
  //   ["", "P1", "T", "T", "T", "finalP1", ""],
  //   ["", "", "", "", "", "", ""],
  //   ["", "", "", "", "", "", ""],
  //   ["", "", "", "", "", "", ""],
  // ];
  List<List<String>> board = [
    ["", "", "", "", "", "", ""],
    ["", "", "P1", "", "P2", "", ""],
    ["", "", "T", "", "T", "", ""],
    ["", "", "T", "", "T", "", ""],
    ["", "", "finalP1", "", "finalP2", "", ""],
    ["", "", "", "", "", "", ""],
    ["", "", "", "", "", "", ""],
  ];
  int x = 3, y = 3;

  int xP1 = 1, yP1 = 1;
  int xpos = 3;
  int ypos = 3;
  playersPosition() {
    player1Position();
    player2Position();
    player3Position();
    player4Position();
    player5Position();
  }

  bool checkMoves(String direction, int playerX, int playerY) {
    if (direction == "right") {
      if (board[playerX][playerY + 1] != "") {
        return true;
      }
    }
    if (direction == "left") {
      if (board[playerX][playerY - 1] != "") {
        return true;
      }
    }
    if (direction == "up") {
      if (board[playerX - 1][playerY] != "") {
        return true;
      }
    }
    if (direction == "down") {
      if (board[playerX + 1][playerY] != "") {
        return true;
      }
    }
    return false;
  }

  getNextState() {}
  move(String direction, int xPlayer, int yPlayer) {
    if (direction == "right") {
      if (checkMoves(direction, xPlayer, yPlayer)) {
        board[xPlayer][yPlayer + 1] = board[xPlayer][yPlayer];
        board[xPlayer][yPlayer] = "T";
        playersPosition();
      }
    }
    //---------------
    if (direction == "left") {
      if (checkMoves(direction, xPlayer, yPlayer)) {
        board[xPlayer][yPlayer - 1] = board[xPlayer][yPlayer];
        board[xPlayer][yPlayer] = "T";
        playersPosition();
      }
    }
    //-----------------
    if (direction == "up") {
      if (checkMoves(direction, xPlayer, yPlayer)) {
        board[xPlayer - 1][yPlayer] = board[xPlayer][yPlayer];
        board[xPlayer][yPlayer] = "T";
        playersPosition();
      }
    }
    //-----------------
    if (direction == "down") {
      if (checkMoves(direction, xPlayer, yPlayer)) {
        board[xPlayer + 1][yPlayer] = board[xPlayer][yPlayer];
        board[xPlayer][yPlayer] = "T";
        playersPosition();
      }
    }
  }

  Widget printState() {
    return Column(
      children: [
        Text(
          "Board Player1 [$xP1][$yP1]= ${board[xP1][yP1]}",
          style: const TextStyle(color: Colors.blue),
        ),
        Text(
          "Board Player2 [$xP2][$yP2]= ${board[xP2][yP2]}",
          style: const TextStyle(color: Colors.blue),
        ),
        Text(
          "Board Player3 [$xP3][$yP3]= ${board[xP3][yP3]}",
          style: const TextStyle(color: Colors.blue),
        ),
        Text(
          "Board Player4 [$xP4][$yP4]= ${board[xP4][yP4]}",
          style: const TextStyle(color: Colors.blue),
        ),
        Text(
          "Board Player5 [$xP5][$yP5]= ${board[xP5][yP5]}",
          style: const TextStyle(color: Colors.blue),
        ),
      ],
    );
  }

  equal() {}
  isFinal() {}

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
  int xP2 = 1, yP2 = 1;
  int x2pos = 3;
  int y2pos = 3;
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

  int xP3 = 1, yP3 = 1;
  int x3pos = 3;
  int y3pos = 3;
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

  int xP4 = 1, yP4 = 1;
  int x4pos = 3;
  int y4pos = 3;
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

  int xP5 = 1, yP5 = 1;
  int x5pos = 3;
  int y5pos = 3;
  player5Position() {
    for (int xP5 = 0; xP5 < board.length; xP5++) {
      for (int yP5 = 0; yP5 < board.length; yP5++) {
        if (board[xP5][yP5] == "P5") {
          this.xP5 = xP5;
          this.yP5 = yP5;
        }
      }
    }
  }

// Data({this.x, this.y, this.gridState});
}
