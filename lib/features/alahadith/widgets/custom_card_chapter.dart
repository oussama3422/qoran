import 'package:flutter/material.dart';

import '../../../utils/style.dart';

class CustomChapterCard extends StatelessWidget {
  final String title;
  final int numberChapter;
  const CustomChapterCard({
    super.key,
    required this.title,
    required this.numberChapter,
  });

  @override
  Widget build(BuildContext context) {
    List<String> words = title.split(' ');
    String truncatedTitle = words.length > 3
        ? '...${words[0]} ${words[1]}' // Display only the first two words
        : title;

    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Style.makia,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0x14ffffff),
            offset: Offset(0, 0),
            blurRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          decoration: BoxDecoration(),
          child: Text(
            Style().translateToArabic(truncatedTitle),
            style: Style.customCardStyle(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        ),
      ),
      //  child: Row(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     // Container(
      //     //   margin: EdgeInsets.fromLTRB(0, 9, 34, 0),
      //     //   child: Text(
      //     //     '$numberChapter',
      //     //     style: TextStyle(
      //     //       fontFamily: 'Inter',
      //     //       fontSize: 14,
      //     //       fontWeight: FontWeight.w600,
      //     //       height: 1.2125,
      //     //       color: Style.blackClr,
      //     //     ),
      //     //   ),
      //     // ),
      //     // Container(
      //     //   height: 30,
      //     //   width: 2,
      //     //   color: Style.blackClr,
      //     // ),
      //     Container(
      //       margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      //       child: Text(
      //         Style().translateToArabic(truncatedTitle),
      //         style: TextStyle(
      //           fontFamily: 'Inter',
      //           fontSize: 16,
      //           fontWeight: FontWeight.w600,
      //           height: 1.2125,
      //           color: Style.blackClr,
      //         ),
      //         maxLines: 1,
      //         overflow: TextOverflow.ellipsis, // Set overflow to ellipsis
      //         softWrap: false, // Set softWrap to false
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
