import 'package:audio_app/features/alahadith/logic/hadith_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/style.dart';
import '../logic/hadith_state.dart';
import '../widgets/custom_card.dart';
import 'hadith_chapter_screen.dart';
import 'package:provider/provider.dart'; // Import Provider package

class HadithHomeScreen extends StatefulWidget {
  const HadithHomeScreen({super.key});

  @override
  State<HadithHomeScreen> createState() => _HadithHomeScreenState();
}

class _HadithHomeScreenState extends State<HadithHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Style.background,
        title: Text(
          'الأحاديث النبوية ',
          textAlign: TextAlign.center,
          style: Style.mainTextStyle(),
        ),
      ),
      body: Provider<HadithCubit>(
        create:(_)=>HadithCubit()..getHadithBooks(),
        child: BlocBuilder<HadithCubit, HadithState>(
          builder: (context, state) {
            if (state is HadithIntial) {
              return Style.progress();
            }
            if (state is HadithLoaded) {
              return Stack(
                children: [
                  ListView.builder(
                    itemCount: state.hadithModel.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // BlocProvider.context.read<SubjectBloc>()<HadithBookCubit>(context)
                          //   ..getBookDataBySlug(
                          //       state.hadithModel[index].bookSlug.toString());
        
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HadithChaptersScreen(
                                slugBook:
                                    state.hadithModel[index].bookSlug.toString(),
                              ),
                            ),
                          );
                        },
                        // child: LightModeWidget(
                        //   title: hadithBook[index].bookSlug.toString(),
                        //   numberChapter: int.parse(
                        //     hadithBook[index].chaptersCount!,
                        //   ),
                        // ),
                        child: CustomCard(
                          title: state.hadithModel[index].bookSlug.toString(),
                          numberChapter: int.parse(
                            state.hadithModel[index].chaptersCount!,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
