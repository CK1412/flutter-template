import 'dart:ui';

class Locales {
  Locales._();

  static const Locale defaultLocale = viVN;

  static const viVN = Locale('vi', 'VN');

  static const enUS = Locale('en', 'US');

  static const jaJP = Locale('ja', 'JP');

  static String languageName(String languageCode) {
    final data = {
      viVN.languageCode: 'Tiếng Việt',
      enUS.languageCode: 'English',
      jaJP.languageCode: '日本語',
    };

    return data[languageCode] ?? '';
  }
}
