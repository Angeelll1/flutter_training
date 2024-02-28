import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:latihan_flutetr/convert_nominal/view/convert_nominal_view.dart';
import 'package:latihan_flutetr/Home/view/home_view.dart';
import 'package:latihan_flutetr/search_api/view/search_api_view.dart';
import 'package:latihan_flutetr/tictactoe/view/tictactoe_view.dart';

import 'translate/view/translate_view.dart';


// void main() => runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: Home()));

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Home();
//   }
// }
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(name: '/CovertNominal', page: () => ConvertNominalView()),
        GetPage(name: '/SearchApi', page: () => SearchApiView()),
        GetPage(name: '/TicTacToe', page: () => TicTacToeView()),
        GetPage(name: '/Translate', page: () => TranslateView())
        ],
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('List Aplikasi'),
        ),
        body: Home(),
      ),
    );
  }
}