import 'package:flutter/material.dart';

extension Snackbar on ScaffoldMessengerState {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> normal(
          String content,
          {SnackBarAction? action}) =>
      showSnackBar(SnackBar(
        content: Text(content),
        behavior: SnackBarBehavior.floating,
        action: action,
      ));
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> error(
          String content,
          {SnackBarAction? action}) =>
      showSnackBar(SnackBar(
        content: Text(content),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        action: action,
      ));
}
