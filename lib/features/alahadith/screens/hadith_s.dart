import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/style.dart';
import '../logic/hadith_book_slug_cubit.dart';
import '../logic/hadith_book_slug_state.dart';
import '../widgets/hadith_card_wid.dart';

class HadithS extends StatefulWidget {
  final int chapter;
  final String book;
  final String title;
  const HadithS(
      {super.key,
      required this.chapter,
      required this.book,
      required this.title});

  @override
  State<HadithS> createState() => _HadithSState();
}

class _HadithSState extends State<HadithS> {
  // List<HadithModel> hadithsList = [];

  // @override
  // void initState() {
  //  super.initState();
  //   getBookDataBySlug(widget.chapter, widget.book);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Style.background,
        title: Text(
          widget.title,
          style: Style.appBarStyle(),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => HadithBookSlugCubit()
          ..getBookDataBySlug(widget.chapter, widget.book),
        child: BlocBuilder<HadithBookSlugCubit, HadithBookSlugState>(
          builder: (context, state) {
            if (state is HadithBookSlugLoadingState) {
              Style.progress();
            } else if (state is HadithBookSlugLoadedState) {
              return ListView.builder(
                itemCount: state.hadithList.length,
                itemBuilder: (BuildContext context, index) {
                  // print(":::::::>hadithsList[index].headingArabic!::::>${hadithsList[index].headingArabic!}");
                  return HadithCardWidg(
                    hadithModel: state.hadithList[index],
                  );
                },
              );
            }
            return Style.progress();
            // else if (state is HadithBookSlugOccurredErrorState) {
            //   return Center(
            //     child: Text(state.errorMsg),
            //   );
            // }
            // return Center(
            //   child: Text('Something went wrong.'),
            // );
          },
        ),
      ),
    );
  }
}
