import 'package:flutter/material.dart';

double getBodyHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double setImageWidth(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.35;
}
