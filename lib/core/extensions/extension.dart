import 'package:flutter/widgets.dart';

extension Navigation on BuildContext {
  toView(String route) {
    return Navigator.pushNamed(this, route);
  }
}
