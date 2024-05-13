import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

class LocaleJsonConverter extends JsonConverter<Locale, Map<String, dynamic>> {
  final String _keyLanguageCode = 'languageCode';
  final String _keyCountryCode = 'countryCode';

  const LocaleJsonConverter();

  @override
  Locale fromJson(Map<String, dynamic> json) {
    return Locale.fromSubtags(
      languageCode: json[_keyLanguageCode],
      countryCode: json[_keyCountryCode],
    );
  }

  @override
  Map<String, dynamic> toJson(Locale object) {
    return {
      _keyLanguageCode: object.languageCode,
      _keyCountryCode: object.countryCode,
    };
  }
}
