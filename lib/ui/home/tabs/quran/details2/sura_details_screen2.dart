import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/providers/most_recent_provider.dart';
import 'package:islami_app/ui/home/tabs/quran/details2/sura_content2.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/app_assets.dart';
import '../quran_resources.dart';

class SuraDetailsScreen2 extends StatefulWidget {
  SuraDetailsScreen2({super.key});

  @override
  State<SuraDetailsScreen2> createState() => _SuraDetails1State();
}

class _SuraDetails1State extends State<SuraDetailsScreen2> {
  late int index;
  String suraContent = '';
  late MostRecentProvider mostRecentProvider;

  @override
  void dispose() {
    super.dispose();
    mostRecentProvider.getLastSuraList();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);

    index = ModalRoute.of(context)?.settings.arguments as int;
    if (suraContent.isEmpty) {
      loadSuraFile();
    }

    return Scaffold(
      appBar: AppBar(title: Text(QuranResources.englishQuranSuras[index])),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        color: AppColors.greyBg,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.cornerLeft),
                Text(
                  QuranResources.arabicQuranSuras[index],
                  style: AppStyles.bold20Primary,
                  textAlign: TextAlign.center,
                ),
                Image.asset(AppAssets.cornerRight),
              ],
            ),

            Expanded(
              child: suraContent.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : SingleChildScrollView(
                      child: SuraContent2(suraContent: suraContent),
                    ),
            ),
            Image.asset(AppAssets.bottomMosque),
          ],
        ),
      ),
    );
  }

  void loadSuraFile() async {
    String fileContent = await rootBundle.loadString(
      'assets/files/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += '[${i + 1}] ';
    }
    suraContent = lines.join();

    Future.delayed(Duration(seconds: 1), () {
      setState(() {});
    });
  }
}

/*
 SizedBox(height: height*0.05,),
            Expanded(child:
            versus.isEmpty ?
            Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            )
                :
            ListView.separated(
              itemCount: versus.length,
              itemBuilder:(context,index){
                return
                  SuraContent2(index: index,suraContent: versus[index]);
              },
              separatorBuilder: (context,index){
                return SizedBox(height: height*0.02,);
              },
            ),

            )

 */
