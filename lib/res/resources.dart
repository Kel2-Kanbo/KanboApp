import 'package:flutter/material.dart';
import 'package:kanbo/res/arrays.dart';
import 'package:kanbo/res/assets.dart';
import 'package:kanbo/res/strings/default_strings.dart';
import 'package:kanbo/res/strings/indonesian_strings.dart';
import 'package:kanbo/res/strings/strings.dart';

import 'app_colors.dart';

class Resources {
  final BuildContext _context;
  Resources(this._context);

  Strings get string {
    Locale? locale = Localizations.maybeLocaleOf(_context);
    switch (locale?.languageCode) {
      case 'id':
        return IndonesianStrings();
      default:
        return DefaultStrings();
    }
  }

  AppColors get color => AppColors();

  Assets get asset => Assets();

  Arrays get list => Arrays();

  static Resources of(BuildContext context) => Resources(context);
}
