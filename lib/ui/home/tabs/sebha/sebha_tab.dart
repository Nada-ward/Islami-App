import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> tasbeeh = [
    'سبحان الله',
    "الحمد لله ",
    "لا اله الا الله ",
    "الله اكبر",
  ];
  int counter = 0;
  int index = 0;
  double angle = 1;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
          style: TextStyle(color: Colors.white, fontSize: 36),
        ),
        SizedBox(height: height * 0.01),
        Stack(
          children: [
            Image.asset(
              'assets/images/sebha_head.png',
              height: height * 0.17,
              alignment: Alignment.topRight,
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.09),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  InkWell(
                    onTap: _handleTasbeeh,
                    child: Transform.rotate(
                      angle: -angle,
                      child: Image.asset(
                        'assets/images/SebhaBody.png',
                        height: height * 0.40,
                      ),
                    ),
                  ),
                  Column(
                    spacing: height * 0.02,
                    children: [
                      Text(
                        tasbeeh[index],
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$counter',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _handleTasbeeh() {
    setState(() {
      if (counter == 33) {
        index = (index + 1) % tasbeeh.length;
        counter = 0;
        // index < tasbeeh.length-1 ? index++ : index=0 ;
      } else {
        counter++;
      }
      angle += 1;
    });
  }
}
