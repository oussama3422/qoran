// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:gap/gap.dart';
// import 'package:video_player/video_player.dart';

// import '../../../utils/style.dart';

// class AudioScreen extends StatefulWidget {
//   final String nameSora;
//   final String typeSora;
//   final String numberOfAyat;
//   final String audioUrl;
//   const AudioScreen({
//     super.key,
//     required this.nameSora,
//     required this.typeSora,
//     required this.numberOfAyat,
//     required this.audioUrl,
//   });

//   @override
//   State<AudioScreen> createState() => _AudioScreenState();
// }

// class _AudioScreenState extends State<AudioScreen> {
//   late VideoPlayerController _controller;
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(Uri.parse(widget.audioUrl))
//       ..initialize();
//     _controller.play();
//     _controller.setLooping(true);
//     _controller.addListener(() {
//       if (_controller.value.position == _controller.value.duration) {
//         _controller.seekTo(Duration.zero);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(15),
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 gradient: RadialGradient(
//                   center: Alignment(-0, -0),
//                   radius: 2.23,
//                   colors: <Color>[Color(0xff1f586f), Color(0xff85dddd)],
//                   stops: <double>[0, 1],
//                 ),
//                 borderRadius: BorderRadius.only(
//                   bottomRight: Radius.circular(20),
//                   bottomLeft: Radius.circular(20),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color(0x3f000000),
//                     offset: Offset(0, 4),
//                     blurRadius: 10,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.all(36),
//                     child: Text(
//                       ' سورة ${widget.nameSora}',
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                         fontFamily: 'Inter',
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         height: 1.25,
//                         letterSpacing: -0.5,
//                         color: Color(0xffffffff),
//                       ),
//                     ),
//                   ),
//                   Hero(
//                     tag: 'book',
//                     child: SizedBox(
//                       width: 140,
//                       height: 229,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(17),
//                         child: Image.asset(
//                           'assets/images/book.png',
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Gap(10),
//                   Container(
//                     child: Text(
//                       '${widget.typeSora}',
//                       style: Style.audioScreenTextStyle(),
//                     ),
//                   ),
//                   Gap(10),
//                   Container(
//                     margin: const EdgeInsets.all(0),
//                     child: Text(
//                       '${widget.numberOfAyat} آيات',
//                       style: Style.audioScreenTextStyle(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Gap(60),
//             Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.all(
//                     10,
//                   ),
//                   child: Column(
//                     children: [
//                       VideoProgressIndicator(
//                         _controller,
//                         allowScrubbing: true,
//                         colors: VideoProgressColors(
//                           backgroundColor: Style.greyOpenClr,
//                           bufferedColor: Style.orangClr,
//                           playedColor: Style.whiteColor,
//                         ),
//                       ),
//                       Gap(5),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(left: 7),
//                             child: Text('11:00'),
//                           ),
//                           Container(
//                             child: Text('14:10'),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Gap(15),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset('assets/images/minus.png'),
//                     Gap(15),
//                     Stack(
//                       children: [
//                         Positioned(
//                           child: Image.asset('assets/images/circle.png'),
//                         ),
//                         Positioned(
//                           left: 25,
//                           top: 20,
//                           child: Image.asset('assets/images/pause.png'),
//                         ),
//                       ],
//                     ),
//                     Gap(15),
//                     Image.asset('assets/images/add.png'),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:audio_app/features/qoran/logic/play_state.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:gap/gap.dart';

import '../../../utils/style.dart';

class AudioScreen extends StatefulWidget {
  final String nameSora;
  final String typeSora;
  final String numberOfAyat;
  final String audioUrl;

  const AudioScreen({
    Key? key,
    required this.nameSora,
    required this.typeSora,
    required this.numberOfAyat,
    required this.audioUrl,
  }) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  AudioPlayer? _audioPlayer;
  Duration? _duration;
  Duration? _position;
  bool _isPlaying = false;
  VideoPlayerController? _controller;
  double _sliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.audioUrl),
    )..initialize().then((_) {
        setState(() {});
      });
    _initAudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer!.dispose();
    _controller!.dispose();
    super.dispose();
  }

  void _initAudioPlayer() async {
    await _audioPlayer!.setSource(UrlSource(widget.audioUrl));
    _audioPlayer!.onDurationChanged.listen((duration) {
      if (mounted) {
        // Check if the widget is mounted
        setState(() {
          _duration = duration;
        });
      }
    });
    _audioPlayer!.onPositionChanged.listen((position) {
      if (mounted) {
        // Check if the widget is mounted
        setState(() {
          _position = position;
          _sliderValue = _position!.inMilliseconds.toDouble() /
              _duration!.inMilliseconds.toDouble();
        });
      }
    });
    _audioPlayer?.onPlayerStateChanged.listen((state) {
      if (mounted) {
        // Check if the widget is mounted
        setState(() {
          _isPlaying = state == PlayerState.playing;
        });
      }
    });
    _audioPlayer!.onPlayerComplete.listen((_) {
      _handlePlaybackCompletion(); // Handle playback completion
    });
  }

  void _togglePlayback() {
    if (_isPlaying) {
      _audioPlayer!.pause();
    } else {
      _audioPlayer!.play(
        UrlSource(widget.audioUrl),
      );
    }
  }

  void _handlePlaybackCompletion() {
    setState(() {
      _position = Duration.zero; // Reset position to the beginning
    });
    _audioPlayer!.seek(Duration.zero).then((_) {
      _audioPlayer!.play(UrlSource(widget.audioUrl)); // Start playing again
    });
  }

  void _seekTo(double value) {
    final newPosition =
        Duration(milliseconds: (value * _duration!.inMilliseconds).toInt());
    _audioPlayer!.seek(newPosition);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  Widget _buildPlaybackTime() {
    String positionText =
        _position != null ? _formatDuration(_position!) : '00:00';
    String durationText =
        _duration != null ? _formatDuration(_duration!) : '00:00';
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(positionText),
          Text(durationText),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // if (_controller != null && _controller!.value.isInitialized)
            // AspectRatio(
            //   aspectRatio: _controller!.value.aspectRatio,
            //   child: VideoPlayer(_controller!),
            // ),
            Container(
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
                    child: Text(
                      ' سورة ${widget.nameSora}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
                  Gap(10),
                  Container(
                    child: Text(
                      '${widget.typeSora}',
                      style: Style.audioScreenTextStyle(),
                    ),
                  ),
                  Gap(10),
                  Container(
                    margin: const EdgeInsets.all(0),
                    child: Text(
                      '${widget.numberOfAyat} آيات',
                      style: Style.audioScreenTextStyle(),
                    ),
                  ),
                ],
              ),
            ),
            Gap(60),
            // if (_duration != null && _position != null)
            Container(
              height: 5,
              child: Slider(
                value: _sliderValue,
                onChanged: (newValue) {
                  setState(() {
                    _sliderValue = newValue;
                  });
                  _seekTo(newValue);
                },
                activeColor:
                    Style.greyOpenClr, // Set the active color of the slider
                inactiveColor:
                    Style.madania, // Set the inactive color of the slider
                secondaryActiveColor:
                    Style.makia, // Set a secondary active color for the slider
                thumbColor:
                    Style.makia, // Set the color of the thumb (slider handle)
              ),
            ),
            _buildPlaybackTime(),
            Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/minus.png'),
                Gap(15),
                Stack(
                  children: [
                    Positioned(
                      child: Image.asset('assets/images/circle.png'),
                    ),
                    _isPlaying
                        ? Positioned(
                            left: 16,
                            top: 16,
                            child: InkWell(
                              child: Image.asset(
                                'assets/images/play.png',
                                width: 35,
                                height: 35,
                              ),
                              onTap: _togglePlayback,
                            ),
                          )
                        : Positioned(
                            left: 25,
                            top: 20,
                            child: InkWell(
                              child: Image.asset('assets/images/pause.png'),
                              onTap: _togglePlayback,
                            ),
                          )
                  ],
                ),
                Gap(15),
                Image.asset('assets/images/add.png'),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     IconButton(
            //       onPressed: _togglePlayback,
            //       icon: Icon(
            //         _isPlaying ? Icons.pause : Icons.play_arrow,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
