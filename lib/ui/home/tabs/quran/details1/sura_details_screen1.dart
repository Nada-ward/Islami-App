import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/providers/most_recent_provider.dart';
import 'package:islami_app/ui/home/tabs/quran/details1/sura_content1.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/app_assets.dart';
import '../quran_resources.dart';

class SuraDetails1 extends StatefulWidget {
  SuraDetails1({super.key});

  @override
  State<SuraDetails1> createState() => _SuraDetails1State();
}

class _SuraDetails1State extends State<SuraDetails1> {
  late int index;

  List<String> versus = [];
  late MostRecentProvider mostRecentProvider;

  @override
  void dispose() {
    super.dispose();
    mostRecentProvider.getLastSuraList();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);

    index = ModalRoute.of(context)?.settings.arguments as int;
    if (versus.isEmpty) {
      loadSuraFile();
    }

    return Scaffold(
      appBar: AppBar(title: Text(QuranResources.englishQuranSuras[index])),
      body: Container(
        // padding: EdgeInsets.symmetric(vertical: height*0.1),
        decoration: BoxDecoration(
          color: AppColors.greyBg,
          image: DecorationImage(
            image: AssetImage(AppAssets.suraBg),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              QuranResources.arabicQuranSuras[index],
              style: AppStyles.bold20Primary,
              textAlign: TextAlign.center,
              // textDirection: TextDirection.rtl,
            ),
            SizedBox(height: height * 0.05),
            Expanded(
              child: versus.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : ListView.separated(
                      itemCount: versus.length,
                      itemBuilder: (context, index) {
                        return SuraContent1(
                          index: index,
                          suraContent: versus[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: height * 0.02);
                      },
                    ),
            ),
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

    versus = lines;
    Future.delayed(Duration(seconds: 2), () {
      setState(() {});
    });
  }
}
