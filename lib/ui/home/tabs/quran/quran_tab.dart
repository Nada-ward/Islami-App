import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resources.dart';
import 'package:islami_app/ui/home/tabs/quran/sura_item.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';

import '../../../../shared_prefs.dart';
import 'most_recent_widget.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: TextStyle(color: AppColors.whiteColor),
            onChanged: (newText) {
              searchByNewText(newText);
            },
            cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
              ),
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16White,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
              ),
              prefixIcon: Image.asset('assets/images/search.png'),
            ),
          ),
          SizedBox(height: height * 0.02),
          MostRecentWidget(),
          SizedBox(height: height * 0.01),
          Text('Suras List', style: AppStyles.bold16White),
          SizedBox(height: height * 0.01),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    saveLastSuraIndex(filterList[index]);
                    Navigator.of(context).pushNamed(
                      AppRoutes.suraDetailsTwo,
                      arguments: filterList[index],
                    );
                  },
                  child: SuraItem(index: filterList[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.whiteColor,
                  thickness: 2,
                  indent: width * 0.04,
                  endIndent: width * 0.03,
                );
              },
              itemCount: filterList.length,
            ),
          ),

          //
        ],
      ),
    );
  }

  void searchByNewText(String newText) {
    List<int> filteredListByNewText = [];
    for (int i = 0; i < 114; i++) {
      if (QuranResources.englishQuranSuras[i].contains(newText)) {
        filteredListByNewText.add(i);
      }
      if (QuranResources.arabicQuranSuras[i].contains(newText)) {
        filteredListByNewText.add(i);
      }
    }
    filterList = filteredListByNewText;
    setState(() {});
  }
}
