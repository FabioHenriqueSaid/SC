import 'dart:io';
import 'package:sc/ios/ios.app.dart';
import 'package:flutter/material.dart';
import 'package:sc/android/android.app.dart';

void main() {
  if (Platform.isIOS) {
    runApp(IOSApp());
  } else {
    runApp(AndroidApp());
  }
}
