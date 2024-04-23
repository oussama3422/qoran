import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';

import 'audio_player_qoran_state.dart';

// Cubit
class AudioPlayerQoranCubit extends Cubit<AudioPlayerQoranState> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  AudioPlayerQoranCubit() : super(AudioPlayerQoranInitial());
  void playPause(String audioUrl) async {
    emit(AudioPlayerQoranLoading());
    if (_isPlaying) {
      await _audioPlayer.resume(); // Request audio focus
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(UrlSource(audioUrl));
    }
    _isPlaying = !_isPlaying;
    emit(AudioPlayerQoranLoaded(_isPlaying));
  }
}
