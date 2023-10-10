import 'package:flutter/widgets.dart';

extension Navigation on BuildContext {
  toView(String route) {
    return Navigator.pushReplacementNamed(this, route);
  }

  navigate(String route) {
    return Navigator.pushNamed(this, route);
  }
}
