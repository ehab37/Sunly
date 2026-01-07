import 'package:flutter/material.dart';
import 'package:sunly/constants.dart';

OutlineInputBorder customBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(kBorderRadius),
    borderSide: BorderSide(color: kPrimaryColor),
  );
}