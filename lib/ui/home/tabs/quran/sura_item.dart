import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_styles.dart';

import 'quran_resources.dart';

class SuraItem extends StatelessWidget {
  int index = 0;

  SuraItem({required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.vectorImg),
            Text('${index + 1}', style: AppStyles.bold16White),
          ],
        ),
        SizedBox(width: width * 0.04),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              QuranResources.englishQuranSuras[index],
              style: AppStyles.bold20White,
            ),
            Text(
              '${QuranResources.ayaNumber[index]} Verses ',
              style: AppStyles.bold14White,
            ),
          ],
        ),
        Spacer(),
        Text(
          QuranResources.arabicQuranSuras[index],
          style: AppStyles.bold20White,
        ),
      ],
    );
  }
}
