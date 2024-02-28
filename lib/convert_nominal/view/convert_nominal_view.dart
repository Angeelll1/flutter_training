import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/convert_nominal_controller.dart';

class ConvertNominalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ConvertController controller = Get.put(ConvertController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Convert Nominal'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.inputController,
              decoration: InputDecoration(hintText: 'Input Nominal'),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60.0),
              child: Obx(() => Text('result: ${controller.result.value}')),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              onPressed: () {
                controller.onSubmit(controller.inputController.value.text);
              },
              child: Text(
                'Convert',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
