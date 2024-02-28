import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicTacToeController extends GetxController {
  var currentPlayer = 'X'.obs;

  var box = [
    ['', '', ''].obs,
    ['', '', ''].obs,
    ['', '', ''].obs
  ].obs;

  var scoreX = 0.obs;
  var scoreO = 0.obs;

  var stopInteraction = false.obs;

  void onUserClick(i, j) {
    if (box[i][j] != '') return;

    box[i][j] = currentPlayer.value;

    (currentPlayer.value == 'X')
        ? currentPlayer.value = 'O'
        : currentPlayer.value = 'X';

    // update();
    var winner = calculateWinner(box);

    if (winner == 'X') {
      scoreX.value = scoreX.value + 1;
      stopInteraction.value = true;
      openGetXDialog(winner);
    } else if (winner == 'O') {
      scoreO.value = scoreO.value + 1;
      stopInteraction.value = true;
      openGetXDialog(winner);
    } else if (winner == 'draw') {
      openGetXDialog(winner);
    }
  }

  calculateWinner(box) {
    bool isDraw = true;

    for (int i = 0; i < 3; i++) {
      if (box[i][0] == box[i][1] &&
          box[i][1] == box[i][2] &&
          box[i][0].isNotEmpty) {
        return box[i][0];
      }
      if (box[0][i] == box[1][i] &&
          box[1][i] == box[2][i] &&
          box[0][i].isNotEmpty) {
        return box[0][i];
      }
    }
    if (box[0][0] == box[1][1] &&
        box[1][1] == box[2][2] &&
        box[0][0].isNotEmpty) {
      return box[0][0];
    }
    if (box[0][2] == box[1][1] &&
        box[1][1] == box[2][0] &&
        box[0][2].isNotEmpty) {
      return box[0][2];
    }

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (box[i][j].isEmpty) {
          isDraw = false;
          break;
        }
      }
    }
    if (isDraw) {
      return 'draw';
    }
  }

  // void onPlayAgain() {
  //   box.value = [
  //     ['', '', ''].obs,
  //     ['', '', ''].obs,
  //     ['', '', ''].obs
  //   ];
  //   currentPlayer.value = 'X';
  //   stopInteraction.value = false;

  //   Get.back();
  //   // update();
  // }

  void onResetGame() {
    box.value = [
      ['', '', ''].obs,
      ['', '', ''].obs,
      ['', '', ''].obs
    ];

    currentPlayer.value = 'X';
    stopInteraction.value = false;
    scoreO.value = 0;
    scoreX.value = 0;
    Get.back();
    // update();
  }

  void openGetXDialog(String display) {
    stopInteraction.value = true;
    Get.defaultDialog(
      backgroundColor: Colors.white,
      title: display == 'draw' ? "DRAW" : "${display} WON !!",
      titleStyle: TextStyle(fontWeight: FontWeight.bold),
      middleText: "Press the Button to Restart Game",
      confirm: TextButton(
          onPressed: () {
            onResetGame();
          },
          child: Text(
            'PLAY AGAIN!!!',
            style: TextStyle(color: Colors.black),
          ),
          style: TextButton.styleFrom(backgroundColor: Colors.red)),
    );
  }
}
