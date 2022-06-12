import 'package:flutter/material.dart';

import '../res/resources.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
  ScaffoldMessengerState get snackbar => ScaffoldMessenger.of(this);
  Size get mediaSize => MediaQuery.of(this).size;
}