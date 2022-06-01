import 'package:flutter/cupertino.dart';

class ScreenSizes {
  var width;
  var height;
  void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}
