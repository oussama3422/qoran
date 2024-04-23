import 'package:flutter/material.dart';

import '../../../utils/style.dart';

class CustomCard extends StatelessWidget {
  final String title;
  int? numberChapter;
  CustomCard({
    super.key,
    required this.title,
    this.numberChapter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        16,
      ),
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
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(
            Style().translateToArabic(title),
            style: Style.customCardStyle2(),
          ),
        ),
      ),
      // child: Row(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Container(
      //       margin: EdgeInsets.fromLTRB(0, 9, 34, 0),
      //       child: Text(
      //         '$numberChapter ',
      //         style: TextStyle(
      //           fontFamily: 'Inter',
      //           fontSize: 15,
      //           fontWeight: FontWeight.w600,
      //           height: 1.2125,
      //           color: Style.blackClr,
      //         ),
      //       ),
      //     ),
      //     Container(
      //       height: 30,
      //       width: 2,
      //       color: Color(0xffbfc9e7),
      //     ),
      //     Container(
      //       margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      //       child: Text(
      //         Style().translateToArabic(title),
      //         style: TextStyle(
      //           fontFamily: 'Inter',
      //           fontSize: 15,
      //           fontWeight: FontWeight.w600,
      //           height: 1.2125,
      //           color: Style.blackClr,
      //        ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
