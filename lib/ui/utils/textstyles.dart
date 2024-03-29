import 'package:flutter/material.dart';
import 'package:tsk_mg/ui/utils/colors.dart';

final IText t = _TextStylesMain();

abstract class IText {
  TextStyle get title;
  TextStyle get subtitle;
  TextStyle get medium;
  TextStyle get text;
  TextStyle get textBlack;
  TextStyle get textPrimary;
  TextStyle get textDisabled;
  TextStyle get textError;
}

class _TextStylesMain implements IText {
  static const String _mainFont = 'Poppins';

  @override
  TextStyle title = const TextStyle(
    fontFamily: _mainFont,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle subtitle = const TextStyle(
    fontFamily: _mainFont,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    // color: c.background
  );

  @override
  TextStyle medium = const TextStyle(
    fontFamily: _mainFont,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  @override
  TextStyle text = const TextStyle(
    fontFamily: _mainFont,
    fontSize: 14,
    // color: Colors.black
  );
  @override
  TextStyle textBlack = const TextStyle(
    fontFamily: _mainFont,
    fontSize: 14,
    color: Colors.black,
  );

  @override
  TextStyle textPrimary = TextStyle(
    fontFamily: _mainFont,
    fontSize: 14,
    color: c.primary,
  );

  @override
  TextStyle textDisabled = TextStyle(
    fontFamily: _mainFont,
    fontSize: 14,
    color: Colors.grey.withOpacity(0.7),
  );

  @override
  TextStyle textError = const TextStyle(
    fontFamily: _mainFont,
    fontSize: 14,
    color: Colors.red,
  );
}
