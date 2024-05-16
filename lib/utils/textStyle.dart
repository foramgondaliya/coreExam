import 'package:core_exam/utils/color.dart';
import 'package:flutter/material.dart';

class TextStyling {
  static TextStyle title = TextStyle(
    fontSize: 25,
    color: primaryWhite,
    fontWeight: FontWeight.bold,
  );
  static TextStyle subtitle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: primaryWhite,
  );
  static TextStyle secondaryLabels = TextStyle(
    fontSize: 18,
    color: secondaryGrey,
  );
  static TextStyle primaryLabels = TextStyle(
    fontSize: 18,
    color: primaryBlack,
  );
  static TextStyle toastMessages = TextStyle(
    fontSize: 15,
    color: primaryWhite,
    fontWeight: FontWeight.w400,
  );
  static TextStyle heading = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: primaryBlueColor,
  );
}
