// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../constants/translate_constants.dart';
// import '../models/translate_models.dart';

// class TranslateController extends GetxController implements GetxService {
//   final SharedPreferences sharedPreferences;

//   TranslateController({required this.sharedPreferences}) {
//     loadCurrentLanguage();
//   }

//   Locale _locale = Locale(TranslateConstants.languages[0].languageCode,
//       TranslateConstants.languages[0].countryCode);

//   int _selectedIndex = 0;
//   int get selectedIndex => _selectedIndex;
//   List<TranslateModel> _languages = [];
//   Locale get locale => _locale;
//   List<TranslateModel> get languages => _languages;

//   void loadCurrentLanguage() {
//     _locale = Locale(
//         sharedPreferences.getString(TranslateConstants.LANGUAGE_CODE) ??
//             TranslateConstants.languages[0].languageCode,
//         sharedPreferences.getString(TranslateConstants.COUNTRY_CODE) ??
//             TranslateConstants.languages[0].countryCode);

//     for (int index = 0; index < TranslateConstants.languages.length; index++) {
//       if (TranslateConstants.languages[index].languageCode == _locale.languageCode) {
//         _selectedIndex = index;
//         break;
//       }
//     }
//     _languages = [];
//     _languages.addAll(TranslateConstants.languages);
//     update();
//   }

//    void setLanguage(Locale locale) {
//     Get.updateLocale(locale);
//     _locale = locale;
//     saveLanguage(_locale);
//     update();
//   }

//   void setSelectedIndex(int index) {
//     _selectedIndex = index;
//     update();
//   }

//   void saveLanguage(Locale locale) async {
//     sharedPreferences.setString(
//       TranslateConstants.LANGUAGE_CODE, locale.languageCode);
//     sharedPreferences.setString(TranslateConstants.COUNTRY_CODE, locale.countryCode!);
//   }
// }
