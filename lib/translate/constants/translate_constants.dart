import '../models/translate_models.dart';

class TranslateConstants {
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';

  static List<TranslateModel> languages = [
    TranslateModel(
      imageUrl: "🇺🇸",
      languageName: 'English',
      countryCode: 'US',
      languageCode: 'en',
    ),
    TranslateModel(
      imageUrl: "🇮🇩",
      languageName: 'Indonesia',
      countryCode: 'ID',
      languageCode: 'id',
    ),
  ];
}
