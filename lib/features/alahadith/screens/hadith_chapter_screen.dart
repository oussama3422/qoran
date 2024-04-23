import 'package:audio_app/features/alahadith/logic/hadith_book_cubit.dart';
import 'package:audio_app/features/alahadith/logic/hadith_book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import '../../../utils/style.dart';
import '../widgets/custom_card_chapter.dart';
import 'hadith_s.dart';



class HadithChaptersScreen extends StatefulWidget {
  final String slugBook;
  const HadithChaptersScreen({super.key, required this.slugBook});

  @override
  State<HadithChaptersScreen> createState() => _HadithChaptersScreenState();
}

class _HadithChaptersScreenState extends State<HadithChaptersScreen> {
  void showIndicator() {
    final progressHUD = ProgressHUD.of(context);
    progressHUD!.show();
    Future.delayed(
      Duration(seconds: 1),
      () => progressHUD.dismiss(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.whiteColor,
      appBar: AppBar(
        leading: BackButton(
          color: Style.blackClr,
        ),
        backgroundColor: Style.background,
        title: Text(
          Style().translateToArabic(widget.slugBook),
          style: Style.appBarStyle(),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) =>
            HadithBookCubit()..getBookDataBySlug(widget.slugBook),
        child: BlocBuilder<HadithBookCubit, HadithBookState>(
          builder: (context, state) {
            return ProgressHUD(
              child: Builder(builder: (context) {
                return Stack(
                  children: [
                    if (state is HadithBookInitial)
                      Style.progress(),
                    if (state is HadithBookLoaded)
                      ListView.builder(
                        itemCount: state.booksSlugList.length,
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HadithS(
                                    chapter: index + 1,
                                    book: state.booksSlugList[index].bookSlug!,
                                    title: state.booksSlugList[index]
                                            .chapterArabic ??
                                        '',
                                  ),
                                ),
                              );
                            },
                            child: CustomChapterCard(
                              title: state.booksSlugList[index].chapterArabic!,
                              numberChapter: int.parse(
                                state.booksSlugList[index].chapterNumber!,
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
