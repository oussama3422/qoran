import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Style {
  static const background1 = const Color(0xFFF8F8F8);
  static const makia = const Color(0xff93a6e0);
  static const madania = const Color(0xfff5cb5c);
  static const orangeClr = Colors.orange;
  static const blackClr = Colors.black;
  static const greyClr = Colors.grey;
  static const greyOpenClr = Color.fromARGB(255, 182, 188, 182);
  static const whitewithOpa = Color.fromARGB(255, 225, 220, 220);
  static const background = Color(0x222A3F);
  static const cardClr = Color(0x101720);
  static const whiteColor = Color.fromARGB(255, 250, 249, 249);
  static const orangClr = Color.fromARGB(255, 250, 249, 249);

  static const String fontF = 'ARSLAN';
  static const String fontF2 = 'ukji';

  static TextStyle audioScreenTextStyle() => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.25,
        letterSpacing: -0.5,
        color: Color(0xffffffff),
      );
  static TextStyle appBarStyle() => TextStyle(
        color: Style.makia,
        // fontFamily: Style.fontF2,
        fontSize: 21,
        fontWeight: FontWeight.bold,
      );
  static TextStyle appBarStyle2() => TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w800,
        height: 1.4285714286,
        letterSpacing: -0.5,
        color: orangClr,
      );
  static TextStyle mainTextStyle() => TextStyle(
        // fontFamily: 'Inter',
        fontSize: 21,
        fontWeight: FontWeight.w800,
        height: 1.4285714286,
        letterSpacing: -0.5,
        color: makia,
      );
  static TextStyle customCardStyle() => TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.2125,
        color: Style.blackClr,
      );
  static TextStyle customCardStyle2() => TextStyle(
        // fontFamily: 'Inter',
        fontSize: 15,
        fontWeight: FontWeight.w600,
        height: 1.2125,
        color: Style.whiteColor,
      );
  static TextStyle hadithCardStyle() => TextStyle(
        color: Style.whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: Style.fontF2,
      );
  static TextStyle cardSoraStyle() => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.2125,
        color: Color(0xffffffff),
      );
  static TextStyle cardSoraStyle1() => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.2125,
        color: Color(0xff0f0f0f),
      );
  static TextStyle cardSoraStyle2() => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 17,
        fontWeight: FontWeight.w500,
        height: 1.2125,
        color: Color(0xffb0b0b0),
      );
  static TextStyle cardSoraStyle3() => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w800,
        height: 1.25,
        letterSpacing: -0.5,
        color: Color(0xff2e6c80),
      );

  translateStatusToArabic(String englishText) {
    final Map<String, String> nounTranslations = {
      'da`eef': 'ضعيف',
      'sahih': 'صحيح',
      'Sahih': 'صحيح',
      'hasan': 'حسن',
    };
    if (nounTranslations.containsKey(englishText)) {
      return nounTranslations[englishText]!;
    } else {
      return englishText;
    }
  }

  translateToArabic(String englishText) {
    final Map<String, String> nounTranslations = {
      'al-tirmidhi': 'الترمذي',
      'sahih-muslim': 'صحيح مسلم',
      'abu-dawood': 'أبو داوود',
      'ibn-e-majah': 'ابن ماجة',
      'mishkat': 'ميشكات',
      'musnad-ahmad': 'مسند أحمد',
      'al-silsila-sahiha': 'السلسلة الصحيحة',
      'sunan-nasai': 'سنن النسائي',
      'sahih-bukhari': 'صحيح البخاري',
    };

    // Check if the given noun is in the predefined translations
    if (nounTranslations.containsKey(englishText)) {
      return nounTranslations[englishText]!;
    } else {
      // If not found, return the original text
      return englishText;
    }
  }

  static progress() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Style.orangeClr,
            ),
            Gap(5),
            Text('...تحميل'),
          ],
        ),
      );

  static partOne() => Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(-0, -0),
            radius: 2.23,
            colors: <Color>[Color(0xff1f586f), Color(0xff85dddd)],
            stops: <double>[0, 1],
          ),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(36),
              child: const Text(
                'القرآن الكريم',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.25,
                  letterSpacing: -0.5,
                  color: Color(0xffffffff),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 11.33, 0),
              width: double.infinity,
              height: 229,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 25, 9, 43),
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                          height: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '114',
                                  textAlign: TextAlign.center,
                                  style: Style.appBarStyle2(),
                                ),
                                const SizedBox(
                                  height: 27,
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 1, 0),
                                  child: Text(
                                    'متواترة',
                                    textAlign: TextAlign.center,
                                    style: Style.appBarStyle2(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 27,
                                ),
                                Text(
                                  '86',
                                  textAlign: TextAlign.center,
                                  style: Style.appBarStyle2(),
                                ),
                                const SizedBox(
                                  height: 27,
                                ),
                                Text(
                                  '28',
                                  textAlign: TextAlign.center,
                                  style: Style.appBarStyle2(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                                  child: const Text(
                                    'عدد السور',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                                  child: const Text(
                                    'قراءة',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  'السور المكية',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2125,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  'السور المدنية',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2125,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Hero(
                    tag: 'book',
                    child: SizedBox(
                      width: 140,
                      height: 229,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(17),
                        child: Image.asset(
                          'assets/images/book.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  static partOne2() => Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(-0, -0),
            radius: 2.23,
            colors: <Color>[Color(0xff1f586f), Color(0xff85dddd)],
            stops: <double>[0, 1],
          ),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(36),
              child: const Text(
                'القرآن الكريم',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.25,
                  letterSpacing: -0.5,
                  color: Color(0xffffffff),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 11.33, 0),
              width: double.infinity,
              height: 229,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 25, 9, 43),
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                          height: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '114',
                                  textAlign: TextAlign.center,
                                  style: Style.appBarStyle2(),
                                ),
                                const SizedBox(
                                  height: 27,
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 1, 0),
                                  child: Text(
                                    'متواترة',
                                    textAlign: TextAlign.center,
                                    style: Style.appBarStyle2(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 27,
                                ),
                                Text(
                                  '86',
                                  textAlign: TextAlign.center,
                                  style: Style.appBarStyle2(),
                                ),
                                const SizedBox(
                                  height: 27,
                                ),
                                Text(
                                  '28',
                                  textAlign: TextAlign.center,
                                  style: Style.appBarStyle2(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                                  child: const Text(
                                    'عدد السور',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                                  child: const Text(
                                    'قراءة',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  'السور المكية',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2125,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  'السور المدنية',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2125,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Hero(
                    tag: 'book',
                    child: SizedBox(
                      width: 140,
                      height: 229,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(17),
                        child: Image.asset(
                          'assets/images/book.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(100),
            CircularProgressIndicator(
              color: Style.orangeClr,
            )
          ],
        ),
      );
  static partOne3() => Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(-0, -0),
            radius: 2.23,
            colors: <Color>[Color(0xff1f586f), Color(0xff85dddd)],
            stops: <double>[0, 1],
          ),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(36),
              child: const Text(
                'الأحاديث النبوية ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.25,
                  letterSpacing: -0.5,
                  color: Color(0xffffffff),
                ),
              ),
            ),
            Hero(
              tag: 'hadith',
              child: SizedBox(
                // width: ,
                height: 229
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: Image.asset(
                    'assets/images/hadith_img.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Gap(100),
            Text(
              'coming soon ... قريباً',
              style: Style.cardSoraStyle(),
            )
          ],
        ),
      );
}
