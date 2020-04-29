import 'package:sc/ios/views/home.view.dart';
import 'package:sc/ios/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:sc/ios/views/home.view.dart';

class IOSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Contacts',
      debugShowCheckedModeBanner: false,
      theme: iosTheme(),
      home: HomeView(),
    );
  }
}
