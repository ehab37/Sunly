import 'package:flutter/material.dart';

class InfoBox {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
  customSnackBar(BuildContext context, String message) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
