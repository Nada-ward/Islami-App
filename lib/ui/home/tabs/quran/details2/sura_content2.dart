import 'package:flutter/material.dart';

import '../../../../../utils/app_styles.dart';

class SuraContent2 extends StatelessWidget {
  String suraContent;

  SuraContent2({super.key, required this.suraContent});

  @override
  Widget build(BuildContext context) {
    // var height =MediaQuery.of(context).size.height;
    return Text(
      '  $suraContent',
      style: AppStyles.bold20Primary,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    );
  }
}
