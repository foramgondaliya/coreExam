import 'package:core_exam/utils/color.dart';
import 'package:core_exam/utils/textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomWidget {
  static Container getAppBar({
    required BuildContext context,
    required String title,
  }) {
    return Container(
      height: 120,
      color: primaryBlueColor,
      child: Column(
        children: [
          SizedBox(
            height: 48,
          ),
          Container(
            height: 60,
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyling.title,
            ),
          ),
        ],
      ),
    );
  }
}
