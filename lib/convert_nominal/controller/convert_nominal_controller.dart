// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConvertController extends GetxController {
  final inputController = TextEditingController();
  var result = ''.obs;

  bool submitValidation(String input) {
    if (!input.isNum ) return false;

    return true;
  }

  onSubmit(input) {
    var inputNumber = int.parse(input);

    result('${formatedinput(inputNumber)} - ${convertToText(inputNumber)}');
  }

  String convertToText(input) {
    List<String> satuan = [
      '',
      'satu',
      'dua',
      'tiga',
      'empat',
      'lima',
      'enam',
      'tujuh',
      'delapan',
      'sembilan',
      'sepuluh'
    ];

    //1 - 10
    if (input < 11) {
      return satuan[input];
    }

    //11 - 19
    else if (input < 20) {
      if (input == 11) {
        return 'sebelas';
      }
      return '${satuan[input - 10]} belas';
    }

    //20 - 99
    else if (input < 100) {
      return '${satuan[(input / 10).floor()]} puluh ${satuan[input % 10]}'
          .trim();
    }

    //100 - 999
    else if (input < 1000) {
      if (input < 200) {
        return 'seratus ${convertToText(input % 100)}'.trim();
      } else {
        return '${satuan[(input / 100).floor()]} ratus ${convertToText(input % 100)}'
            .trim();
      }
    }

    //1000 - 9999
    else if (input < 1000000) {
      if (input < 2000) {
        return 'seribu ${convertToText(input % 1000)}'.trim();
      } else {
        return '${convertToText((input / 1000).floor())} ribu ${convertToText(input % 1000)}'
            .trim();
      }
    } else if (input < 1000000000) {
      return '${convertToText((input / 1000000).floor())} juta ${convertToText(input % 1000000)}'
          .trim();
    } else if (input < 1000000000000) {
      return '${convertToText((input / 1000000000).floor())} miliar ${convertToText(input % 1000000000)}'
          .trim();
    } else {
      return 'Input Limit';
    }
    // update();
  }

  String formatedinput(input) {
    String amount = input.toString();
    String result = '';
    var count = 0;

    for (var i = amount.length - 1; i >= 0; i--) {
      count++;
      result = amount[i] + result;
      if (count % 3 == 0 && i != 0) {
        result = '.$result';
      }
    }
    return result;
  }
}
