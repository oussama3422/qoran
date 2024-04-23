import 'package:flutter/material.dart';

import '../../../utils/style.dart';

class CardSoraWidget extends StatelessWidget {
  final String numberAyat;
  final int index;
  final String nameOfSora;
  final String soratType;
  const CardSoraWidget({
    super.key,
    required this.soratType,
    required this.nameOfSora,
    required this.index,
    required this.numberAyat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.fromLTRB(0, 4, 6, 5),
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 1, 128, 0),
            width: 24,
            height: 24,
            child: Image.asset(
              'assets/images/row.png',
              width: 24,
              height: 24,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 10, 21),
            width: 60,
            height: 20,
            decoration: BoxDecoration(
              color: soratType == 'مكية'
                  ? Style.makia
                  : Style.madania,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Center(
              child: Text(
                soratType,
                style: Style.cardSoraStyle(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  // margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: Text(
                    '${nameOfSora}',
                    style: Style.cardSoraStyle1(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(0),
                  child: Text(
                    '$numberAyat آيات',
                    style: Style.cardSoraStyle2(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 40,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: const DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('assets/images/star.png'),
              ),
            ),
            child: Center(
              child: Text(
                index.toString(),
                textAlign: TextAlign.center,
                style: Style.cardSoraStyle3(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
