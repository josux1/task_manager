import 'package:flutter/material.dart';

final IColors c = _ColorsMain();

abstract class IColors {
  Color get primary;
}

class _ColorsMain extends IColors {
  @override
  Color primary = const Color(0xff2850E2);
}
