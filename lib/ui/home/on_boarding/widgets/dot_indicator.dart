import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';

class DotIndicator extends StatelessWidget {
  DotIndicator({super.key, required this.active});

  bool active = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.01),
      width: active ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: active ? AppColors.primaryColor : Color(0xff707070),
      ),
    );
  }
}
