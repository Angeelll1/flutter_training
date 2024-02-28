import 'package:flutter/material.dart';
import 'package:latihan_flutetr/convert_nominal/view/convert_nominal_view.dart';
import 'package:latihan_flutetr/search_api/view/search_api_view.dart';
import 'package:latihan_flutetr/tictactoe/view/tictactoe_view.dart';
import 'package:latihan_flutetr/translate/view/translate_view.dart';



class Home extends StatelessWidget {
  final List<String> applications = [
    'Aplikasi Konversi',
    'Aplikasi API',
    'Tic Tac Toe',
    'Translate',
  ];
  final List page = [
    '../convert_nominal_view.dart',
    '../search_api_view.dart',
    '../tictactoe_view.dart',
    '../translate_view.dart',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListView.builder(
        itemCount: applications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(applications[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => getAppPage(index),
                ),
              );
              // GetPage(name: applications[index], page: page[index]);
            },
          );
        },
      ),
    );
  }

  Widget getAppPage(int index) {
    switch (index) {
      case 0:
        return ConvertNominalView();
      case 1:
        return SearchApiView();
      case 2:
        return TicTacToeView();
      case 3:
        return TranslateView();
      default:
        return Container();
    }
  }
}