import 'package:flutter/material.dart';

extension WidgetSpacing on int   {

  SizedBox get vSpace=> SizedBox(height: toDouble());
  SizedBox get hSpace=> SizedBox(width: toDouble());

}