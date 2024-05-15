import 'dart:ui';

class Locales {
  Locales._();

  static const Locale defaultLocale = vi;

  static const vi = Locale('vi');

  static const en = Locale('en');

  static const ja = Locale('ja');

  static String languageName(String languageCode) {
    final data = {
      vi.languageCode: 'Tiếng Việt',
      en.languageCode: 'English',
      ja.languageCode: '日本語',
    };

    return data[languageCode] ?? '';
  }
}
