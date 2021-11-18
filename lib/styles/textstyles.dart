import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show TextStyle, FontWeight;
import 'package:health_bit/styles/colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get cardLabelHighlight {
    return TextStyle(
      fontSize: 13.5,
      fontWeight: FontWeight.w500,
      color: AppColors.mainWhite
    );
  }

  static TextStyle get cardLabel {
    return TextStyle(
        fontSize: 13.5,
        fontWeight: FontWeight.w500,
        color: AppColors.mainWhite
    );
  }

  static TextStyle get appBar{
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.mainTeal,
        fontFamily: 'Simplicity'
    );
  }

  static TextStyle get toolInfo {
    return TextStyle(
      fontSize: 12,
      color: Color(0xFFB0B0B0)
    );
  }

  static TextStyle get socialLogin {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
  }

  static TextStyle get cta {
    return TextStyle(
      fontSize: 16,
      color: AppColors.mainBlack,
    );
  }

  static TextStyle get label {
    return TextStyle(
      fontSize: 20,
      color: AppColors.mainWhite,
    );
  }

  static TextStyle get banner {
    return TextStyle(
        fontSize: 50,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold,
        fontFamily: 'Simplicity'
    );
  }

  static TextStyle get input {
    return TextStyle(
      fontSize: 14,
      color: Colors.black,
    );
  }
}
