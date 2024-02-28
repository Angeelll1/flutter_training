import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/tictactoe_controller.dart';

class TicTacToeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TicTacToeController controller = Get.put(TicTacToeController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe Game'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: Center(
              child: Text("${controller.currentPlayer} Turn",
                  style: TextStyle(fontSize: 20)),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                var row = index ~/ 3;
                var col = index % 3;
                return GestureDetector(
                  onTap: () => controller.onUserClick(row, col),
                  child: Obx(
                    () => Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Center(
                        child: Text(
                          controller.box[row][col],
                          style: TextStyle(fontSize: 48),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
