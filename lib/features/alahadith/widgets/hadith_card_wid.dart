import 'package:flutter/material.dart';

import '../../../utils/style.dart';
import '../models/hadith_model.dart';

class HadithCardWidg extends StatefulWidget {
  final HadithModel hadithModel;

  const HadithCardWidg({Key? key, required this.hadithModel}) : super(key: key);

  @override
  State<HadithCardWidg> createState() => _HadithCardWidgState();
}

class _HadithCardWidgState extends State<HadithCardWidg> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    String hadithTextToShow = showMore
        ? widget
            .hadithModel.hadithArabic! // Show the full text if showMore is true
        : truncateText(widget.hadithModel.hadithArabic!,
            100); // Show only the first 100 characters

    return Container(
      // height: 90,
      width: 100,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Style.makia,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Style.whiteColor,
                  ),
                  child: Text(
                    Style().translateStatusToArabic(widget.hadithModel.status!),
                    style: TextStyle(
                      color: Style.blackClr,
                      fontFamily: Style.fontF2,
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    hadithTextToShow,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showMore =
                            !showMore; // Toggle the showMore state on button press
                      });
                    },
                    child: Container(
                      width: 55,
                      height: 30,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Style.whiteColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          showMore ? "...أقل" : "...المزيد",
                          style: TextStyle(
                            color: Style
                                .blackClr, // Use the color you want for the button
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String truncateText(String text, int maxLength) {
    // Function to truncate the text to the specified maxLength
    return text.length <= maxLength
        ? text
        : '${text.substring(0, maxLength)}...';
  }
}
