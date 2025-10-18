import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeth.dart';
import 'package:islami_app/utils/app_colors.dart';

import '../../../../utils/app_styles.dart';

class HadethItem extends StatefulWidget {
  int index;

  HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.primaryColor,
        image: DecorationImage(
          image: AssetImage('assets/images/suraBg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: SingleChildScrollView(
        child: hadeth == null
            ? Center(
                child: CircularProgressIndicator(color: AppColors.blackColor),
              )
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(hadeth!.title, style: AppStyles.bold24Black),
                    SizedBox(height: 20),
                    Text(
                      hadeth!.content,
                      style: AppStyles.bold16Black,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Future<void> loadHadethFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/hadeth/h$index.txt',
    );
    String title = fileContent.substring(0, fileContent.indexOf('\n'));
    String content = fileContent.substring(fileContent.indexOf('\n') + 1);
    hadeth = Hadeth(title: title, content: content);
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
