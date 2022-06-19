

import 'package:flutter/material.dart';

class Radii {
  static const BorderRadius k4pxRadius = BorderRadius.all(Radius.circular(4));
  static const BorderRadius k8pxRadius = BorderRadius.all(Radius.circular(8));
  static const BorderRadius k12pxRadius = BorderRadius.all(Radius.circular(12));
  static const BorderRadius k16pxRadius = BorderRadius.all(Radius.circular(16));
  static const BorderRadius k24pxRadius = BorderRadius.all(Radius.circular(24));
  static const BorderRadius k32pxRadius = BorderRadius.all(Radius.circular(32));

   BorderRadius _border(double val){
    return BorderRadius.all(Radius.circular(val));
  }
}