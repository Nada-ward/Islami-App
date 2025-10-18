import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadeth/hadeth_item.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(
        height: height * 0.66,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
      ),
      items: List.generate(50, (index) => index + 1).map((index) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: HadethItem(index: index),
            );
          },
        );
      }).toList(),
    );
  }
}
