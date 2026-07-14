import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'settings_service.dart';

class SoundService {
  static AudioPlayer? _sfxPlayer;
  static AudioPlayer? _musicPlayer;
  static bool _soundEnabled = true;
  static bool _hapticsEnabled = true;
  static bool _musicStarted = false;
  static int _trackIndex = 0;

  static const _playlist = [
    'audio/02. Memories of Mother.mp3',
    'audio/01. God of War.mp3',
  ];

  static bool get soundEnabled => _soundEnabled;
  static bool get hapticsEnabled => _hapticsEnabled;

  /// Loads persisted preferences and starts background music if enabled.
  /// Call once at app startup, before the first frame if possible.
  static Future<void> init() async {
    _soundEnabled = await SettingsService.getSoundEffects();
    _hapticsEnabled = await SettingsService.getHaptics();
    if (_soundEnabled) _startMusic();
  }

  static Future<void> setSoundEnabled(bool value) async {
    _soundEnabled = value;
    await SettingsService.setSoundEffects(value);
    if (value) {
      _startMusic();
    } else {
      await _musicPlayer?.pause();
    }
  }

  static Future<void> setHapticsEnabled(bool value) async {
    _hapticsEnabled = value;
    await SettingsService.setHaptics(value);
  }

  static void _haptic() {
    if (_hapticsEnabled) HapticFeedback.lightImpact();
  }

  static Future<void> _startMusic() async {
    try {
      _musicPlayer ??= AudioPlayer();
      if (_musicStarted) {
        await _musicPlayer!.resume();
        return;
      }
      _musicPlayer!.onPlayerComplete.listen((_) => _nextTrack());
      await _musicPlayer!.setVolume(0.6);
      await _musicPlayer!.play(AssetSource(_playlist[_trackIndex]));
      _musicStarted = true;
    } catch (e) {
      debugPrint('Music error: $e');
    }
  }

  static Future<void> _nextTrack() async {
    _trackIndex = (_trackIndex + 1) % _playlist.length;
    if (!_soundEnabled) return;
    try {
      await _musicPlayer?.play(AssetSource(_playlist[_trackIndex]));
    } catch (e) {
      debugPrint('Music error: $e');
    }
  }

  static Future<void> playClick() async {
    _haptic();
    if (!_soundEnabled) return;
    try {
      _sfxPlayer ??= AudioPlayer();
      await _sfxPlayer!.play(AssetSource('audio/sword.mp3'));
    } catch (e) {
      debugPrint('Sound error: $e');
    }
  }

  static Future<void> playResult() async {
    _haptic();
    if (!_soundEnabled) return;
    try {
      _sfxPlayer ??= AudioPlayer();
      await _sfxPlayer!.play(AssetSource('audio/result.mp3'));
    } catch (e) {
      debugPrint('Sound error: $e');
    }
  }

  static Future<void> playButton() async {
    _haptic();
    if (!_soundEnabled) return;
    try {
      _sfxPlayer ??= AudioPlayer();
      await _sfxPlayer!.play(AssetSource('audio/button.mp3'));
    } catch (e) {
      debugPrint('Sound error: $e');
    }
  }
}
