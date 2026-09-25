import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: "Poppins",
  );
}

TextStyle getRegularStyle({double fontSize = 16, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

TextStyle getMediumStyle({double fontSize = 16, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

TextStyle getLightStyle({double fontSize = 14, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

TextStyle getBoldStyle({double fontSize = 14, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

TextStyle getSemiBoldStyle({double fontSize = 14, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

TextStyle getExtraBoldStyle({double fontSize = 14, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.extraBold, color);
}

TextStyle emptyTitleStyle() {
  return getSemiBoldStyle(fontSize: MyFonts.size20, color: const Color(0xFF000000)).copyWith(
    height: 1,
    letterSpacing: 0,
  );
}

TextStyle emptyMessageStyle() {
  return getRegularStyle(fontSize: MyFonts.size12, color: const Color(0xFF767676)).copyWith(
    height: 1.67,
    letterSpacing: 0,
  );
}
