// import 'package:audio_app/logic/cubit/qoran_cubit.dart';
// import 'package:audio_app/utils/data.dart';
import 'package:audio_app/features/qoran/screens/audio_screen.dart';
import 'package:audio_app/features/qoran/screens/splash_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/style.dart';
import '../../../utils/data.dart';
import '../logic/qoran_cubit.dart';
import '../models/qoran_model.dart';
import '../widgets/card_sora_widget.dart';
import 'package:provider/provider.dart'; // Import Provider package

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.muted_teal,
//       appBar: AppBar(
//         backgroundColor: AppColors.light_beige,
//         title: Text(
//           'القرأن الكريم',
//           style: TextStyle(
//             color: AppColors.terracotta_red,
//             fontFamily: AppColors.fontF2,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: BlocBuilder<QuranCubit, List<QoranModel>>(
//         builder: (context, qoranModel) {
//           print(qoranModel.length);
//           return qoranModel.isEmpty
//               ? const Center(child: CircularProgressIndicator())
//               : _buildQuranList(context, qoranModel);
//         },
//       ),
//     );
//   }

//   Widget _buildQuranList(BuildContext context, List<QoranModel> qoranModel) {
//     return ListView.builder(
//       itemCount: qoranModel.length,
//       itemBuilder: (context, index) {
//         return Column(
//           children: [
//             AudioPlayerWidget(
//               audioUrl: qoranModel[index].audioUrl.toString(),
//               nameOfSoratInFrance: surahList[index].name,
//               nameOfSoratInArabic: surahList[index].arabicName,
//               numberofAyat: surahList[index].verses,
//               index: index,
//               typeArabic: surahList[index].type,
//             ),
//             const Divider(
//               color: Colors.grey,
//               height: 1,
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../../../core/data.dart';
// import '../widgets/card_sora_widget.dart';
// import 'package:just_audio/just_audio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AudioPlayer? player;
  bool isPlaying = false;
  int playingIndex = -1;
  // late bool _isConnected;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    // _checkConnectivity();
    _initConnectivityListener();
  }

  // Future<void> _checkConnectivity() async {
  //   var connectivityResult = await Connectivity().checkConnectivity();
  //   setState(() {
  //     _isConnected = connectivityResult != ConnectivityResult.none;
  //   });
  //   if (_isConnected) {
  //     // Navigate to the home page
  //     _navigateToHome();
  //   }
  // }

  void _initConnectivityListener() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        // If there is no internet connectivity, navigate to the splash screen
        _navigateToSplashScreen();
      }
    });
  }

  void _navigateToSplashScreen() {
    // Navigate to the splash screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SplashScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Provider<QuranCubit>(
        create: (_) => QuranCubit()..loadQuran(),
        child: Scaffold(
          backgroundColor: const Color(0xFFF8F8F8),
          // backgroundColor: AppColors.muted_teal,
          // appBar: AppBar(
          //   backgroundColor: AppColors.light_beige,
          //   title: Container(
          //     margin: const EdgeInsets.fromLTRB(0, 0, 5.33, 36),
          //     child: const Text(
          //       'القرآن الكريم',
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //
          // fontFamily: 'Inter',
          //         fontSize: 16,
          //         fontWeight: FontWeight.w600,
          //         height: 1.25,
          //         letterSpacing: -0.5,
          //         color: Color(0xffffffff),
          //       ),
          //     ),
          //   ),
          //   centerTitle: true,
          // ),
          body: Column(
            children: [
              Style.partOne(),
              Expanded(
                child: BlocBuilder<QuranCubit, List<QoranModel>>(
                  builder: (context, qoranModel) {
                    return qoranModel.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : _buildQuranList(context, qoranModel);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuranList(BuildContext context, List<QoranModel> qoranModel) {
    return ListView.builder(
      itemCount: qoranModel.length,
      itemBuilder: (context, idx) {
        return InkWell(
          onTap: () async {
            // Handle different playback scenarios:
            if (isPlaying && idx != playingIndex) {
              // Stop the current audio if playing a different one
              await player!.stop();
            }

            setState(() {
              isPlaying = idx == playingIndex ? !isPlaying : true;
              playingIndex = idx;
            });
            if (isPlaying) {
              await player!
                  .play(UrlSource(qoranModel[idx].audioUrl.toString()));
            } else {
              await player!.pause();
            }
          },
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AudioScreen(
                    nameSora: surahList[idx].arabicName,
                    typeSora: surahList[idx].type,
                    numberOfAyat: surahList[idx].verses.toString(),
                    audioUrl: qoranModel[idx].audioUrl.toString(),
                    // listofAudios:qoranModel,
                  ),
                ),
              );
            },
            child: CardSoraWidget(
              index: idx + 1,
              soratType: surahList[idx].type,
              numberAyat: surahList[idx].verses.toString(),
              nameOfSora: surahList[idx].arabicName,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    player!.dispose();
    super.dispose();
  }
}
