import 'package:flutter/material.dart';

extension BuildcontextExtension on BuildContext {
  void nav(Widget screen, {bool isReplace = false}) {
    if (isReplace) {
      Navigator.of(this).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => screen), (route) => false);
    } else {
      Navigator.of(this).push(MaterialPageRoute(builder: (context) => screen,));
    }
  }

  double getWidth({double percentage=1}){
  return MediaQuery.of(this).size.width*percentage;
}

double getHeight({double percentage=1}){
  return MediaQuery.of(this).size.height*percentage;
}
}


