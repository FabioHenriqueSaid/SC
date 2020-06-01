import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();

  //static const Color loginGradientStart = const Color(0xFFfbab66);
   // static const Color loginGradientEnd = const Color(0xFF00E676);
    static const Color loginGradientEnd = const Color(0xFF00B8D4);
    //static const Color loginGradientStart = const Color(0xFF00C853);
    static const Color loginGradientStart = const Color(0xFF00BFA5);
   

  //static const Color loginGradientEnd = const Color(0x120a8f);


  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}