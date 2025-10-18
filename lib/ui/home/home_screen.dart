import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/ui/home/tabs/time/time_tab.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> imageName = [
  AppAssets.quranBg,
  AppAssets.hadethBg,
  AppAssets.sebhaBg,
  AppAssets.radioBg,
  AppAssets.timeBg,
];
List<Widget> tabs = [
  QuranTab(),
  HadethTab(),
  SebhaTab(),
  RadioTab(),
  TimeTab(),
];

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Image.asset(
          imageName[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logoImage, height: height * 0.22),
              Expanded(child: tabs[selectedIndex]),
            ],
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(
              context,
            ).copyWith(canvasColor: AppColors.primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              // backgroundColor: AppColors.primaryColor,
              // type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: builtBottomNavigationBar(
                    imageName: AppAssets.iconQuran,
                    index: 0,
                  ),
                  label: 'Quran',
                ),
                BottomNavigationBarItem(
                  icon: builtBottomNavigationBar(
                    imageName: AppAssets.iconHadeth,
                    index: 1,
                  ),
                  label: 'Hadeth',
                ),
                BottomNavigationBarItem(
                  icon: builtBottomNavigationBar(
                    imageName: AppAssets.iconSebha,
                    index: 2,
                  ),
                  label: 'Sebha',
                ),
                BottomNavigationBarItem(
                  icon: builtBottomNavigationBar(
                    imageName: AppAssets.iconRadio,
                    index: 3,
                  ),
                  label: 'Radio',
                ),
                BottomNavigationBarItem(
                  icon: builtBottomNavigationBar(
                    imageName: AppAssets.iconTime,
                    index: 4,
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget builtBottomNavigationBar({
    required int index,
    required String imageName,
  }) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColors.greyBg,
            ),
            child: ImageIcon(AssetImage(imageName)),
          )
        : ImageIcon(AssetImage(imageName));
  }
}
