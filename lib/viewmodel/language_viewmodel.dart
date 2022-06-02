import 'package:flutter/material.dart';

class LanguageViewModel extends ChangeNotifier {
  Locale _locale = const Locale('en', 'US');
  Locale get language => _locale;

  void setLanguage(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}