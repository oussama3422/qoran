import 'package:audio_app/features/qoran/logic/playcubit.dart';
import 'package:audio_app/features/qoran/logic/qoran_cubit.dart';
import 'package:audio_app/features/alahadith/logic/hadith_cubit.dart';
import 'package:audio_app/features/qoran/screens/home_screen.dart';
import 'package:audio_app/features/qoran/screens/splash_screen.dart';
import 'package:audio_app/features/qoran/widgets/bottom_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/qoran/logic/audio_player_qoran_cubit.dart';
import 'features/alahadith/logic/hadith_book_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AudioPlayerQoranCubit(),
          ),
          BlocProvider(
            create: (context) => AudioPlayerCubit(),
          ),
          BlocProvider(
            create: (context) => QuranCubit()..loadQuran(),
          ),
          BlocProvider(
            
            create: (context) => HadithCubit()..getHadithBooks(),
          ),
          BlocProvider(
            create: (context) => HadithBookCubit(),
          ),
        ],
        child: SplashScreen(),
      ),
    );
  }
}
