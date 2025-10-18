import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_resources.dart';
import 'package:provider/provider.dart';

import '../../../../providers/most_recent_provider.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class MostRecentWidget extends StatefulWidget {
  MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mostRecentProvider.getLastSuraList();
    });
  }

  // Future<void> getMostRecentSuraList() async {
  //   mostRecentList=await  getLastSuraList();
  // setState(() {
  //
  // });
  // }

  @override
  Widget build(BuildContext context) {
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most Recently', style: AppStyles.bold16White),
          SizedBox(height: height * 0.01),
          SizedBox(
            height: height * 0.18,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                    vertical: height * 0.01,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primaryColor,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            QuranResources.englishQuranSuras[mostRecentProvider
                                .mostRecentList[index]],
                            style: AppStyles.bold20Black,
                          ),
                          Text(
                            QuranResources.arabicQuranSuras[mostRecentProvider
                                .mostRecentList[index]],
                            style: AppStyles.bold20Black,
                          ),
                          Text(
                            '${QuranResources.ayaNumber[mostRecentProvider.mostRecentList[index]]} Verses ',
                            style: AppStyles.bold14Black,
                          ),
                        ],
                      ),
                      Image.asset('assets/images/quran.png'),
                    ],
                  ),
                );
              },
              itemCount: mostRecentProvider.mostRecentList.length,
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.03);
              },
            ),
          ),
        ],
      ),
    );
  }
}
