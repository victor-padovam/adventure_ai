import 'package:adventure_ai/language/language_en.dart';
import 'package:adventure_ai/language/language_pt_br.dart';
import 'package:adventure_ai/language/languages.dart';
import 'package:flutter/material.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
        'pt',
      ].contains(
        locale.languageCode,
      );

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      case 'pt':
        return LanguagePTBR();
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
