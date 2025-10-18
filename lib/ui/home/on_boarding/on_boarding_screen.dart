import 'package:flutter/material.dart';
import 'package:islami_app/model/on_boarding_model.dart';
import 'package:islami_app/ui/home/on_boarding/widgets/dot_indicator.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_routes.dart';

import '../../../utils/app_assets.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingModel> onBoardingPages = [
    OnBoardingModel(
      imagePath: AppAssets.onBoardingOne,
      title: 'Welcome To Islmi App',
    ),
    OnBoardingModel(
      imagePath: AppAssets.onBoardingTwo,
      title: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our Community',
    ),
    OnBoardingModel(
      imagePath: AppAssets.onBoardingThree,
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    OnBoardingModel(
      imagePath: AppAssets.onBoardingFour,
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),
    OnBoardingModel(
      imagePath: AppAssets.onBoardingFive,
      title: 'Holy Quran Radio',
      description:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];
  PageController pageController = PageController();
  int currentIndex = 0;

  bool isVisited = false;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          Image.asset(AppAssets.logoImage, height: screenSize.height * 0.22),
          SizedBox(height: screenSize.height * 0.02),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: onBoardingPages.length,
              itemBuilder: (context, index) {
                currentIndex = index;
                return Column(
                  children: [
                    Image.asset(
                      onBoardingPages[index].imagePath,
                      height: screenSize.height * 0.4,
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    Text(
                      onBoardingPages[index].title,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (onBoardingPages[index].description != null)
                      ?SizedBox(height: screenSize.height * 0.04),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.02,
                      ),
                      child: Text(
                        onBoardingPages[index].description ?? '',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (index != 0)
                          ?TextButton(
                            onPressed: () {
                              pageController.previousPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Text(
                              'Back',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          )
                        else
                          SizedBox(width: screenSize.width * 0.15),
                        Row(
                          spacing: 6,
                          children: [
                            DotIndicator(active: currentIndex == 0),
                            DotIndicator(active: currentIndex == 1),
                            DotIndicator(active: currentIndex == 2),
                            DotIndicator(active: currentIndex == 3),
                            DotIndicator(active: currentIndex == 4),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            index < 4
                                ? pageController.nextPage(
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeIn,
                                  )
                                : {
                                    // final SharedPreferences prefs = await SharedPreferences.getInstance();
                                    // prefs.setBool('isVisited', true);
                                    Navigator.of(context).pushReplacementNamed(
                                      AppRoutes.homeScreen,
                                    ),
                                  };
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.04),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
