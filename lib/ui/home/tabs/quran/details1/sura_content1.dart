import 'package:flutter/material.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles.dart';

class SuraContent1 extends StatelessWidget {
  int index;
  String suraContent;

  SuraContent1({super.key, required this.index, required this.suraContent});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: height * 0.03),
      padding: EdgeInsets.symmetric(vertical: height * 0.015),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.primaryColor, // border color
          width: 1.0, // border width
        ),
      ),
      child: Text(
        ' [${index + 1}] $suraContent',
        style: AppStyles.bold20Primary,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
