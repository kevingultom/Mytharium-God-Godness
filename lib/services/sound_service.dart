import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class SoundService {
  static AudioPlayer? _player;

  static Future<void> playClick() async {
    try {
      _player ??= AudioPlayer();
      await _player!.play(AssetSource('audio/sword.mp3'));
    } catch (e) {
      debugPrint('Sound error: $e');
    }
  }

  static Future<void> playResult() async {
    try {
      _player ??= AudioPlayer();
      await _player!.play(AssetSource('audio/result.mp3'));
    } catch (e) {
      debugPrint('Sound error: $e');
    }
  }

  static Future<void> playButton() async {
    try {
      _player ??= AudioPlayer();
      await _player!.play(AssetSource('audio/button.mp3'));
    } catch (e) {
      debugPrint('Sound error: $e');
    }
  }
}
