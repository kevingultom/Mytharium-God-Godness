import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'settings_service.dart';

class SoundService {
  static AudioPlayer? _musicPlayer;
  static final List<AudioPlayer> _randomGodTickPlayers = [];
  static int _randomGodTickNext = 0;
  static Future<void>? _randomGodTickInit;
  static AudioPlayer? _randomGodLandPlayer;

  static bool _soundEnabled = true;
  static bool _hapticsEnabled = true;
  static bool _musicStarted = false;
  static bool _musicPending = false;
  static bool _musicInitFailed = false;
  static int _trackIndex = 0;

  static const _playlist = [
    'audio/02. Memories of Mother.mp3',
    'audio/01. God of War.mp3',
  ];

  static bool get soundEnabled => _soundEnabled;
  static bool get hapticsEnabled => _hapticsEnabled;

  static Future<void> init() async {
    _soundEnabled = await SettingsService.getSoundEffects();
    _hapticsEnabled = await SettingsService.getHaptics();
    if (_soundEnabled) _musicPending = true;
    unawaited(_ensureRandomGodTickPool());
  }

  static Future<void> ensureMusicStarted() async {
    if (!_musicPending) return;
    _musicPending = false;
    await _startMusic();
  }

  static Future<void> setSoundEnabled(bool value) async {
    _soundEnabled = value;
    await SettingsService.setSoundEffects(value);
    if (value) {
      _musicPending = true;
      _musicInitFailed = false;
      await _startMusic();
    } else {
      await _musicPlayer?.pause();
    }
  }

  static Future<void> pauseMusic() async {
    await _musicPlayer?.pause();
  }

  static Future<void> resumeMusic() async {
    if (!_soundEnabled) return;
    try {
      await _musicPlayer?.resume();
    } catch (e) {
      debugPrint('Music resume error: $e');
    }
  }

  static Future<void> setHapticsEnabled(bool value) async {
    _hapticsEnabled = value;
    await SettingsService.setHaptics(value);
  }

  static void _haptic() {
    if (_hapticsEnabled) HapticFeedback.lightImpact();
  }

  // ─── Music ──────────────────────────────────────────────────────
  static Future<void> _startMusic() async {
    if (_musicInitFailed) return;
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
      _musicInitFailed = true;
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

  // ─── SFX: Disabled (haptic only) ───────────────────────────────
  static Future<void> playClick() async {
    _haptic();
  }

  static Future<void> playResult() async {
    _haptic();
  }

  static Future<void> playButton() async {
    _haptic();
  }

  // ─── SFX: Random God dice reel (scoped exception) ───────────────
  // General SFX stays haptic-only (above), but the Random God reel gets a
  // real tick sound synced to each card flip. Background music is paused
  // for the duration of the roll (see playRandomGodTick's caller) rather
  // than played alongside — see RandomGodDialog.
  //
  // A hand-rolled round-robin pool, not package:audioplayers's AudioPool —
  // AudioPool's start() awaits a mutex plus a setVolume() call on every
  // single play, and on a real device that per-tick overhead was still
  // enough to drift the tick sound out of sync once ticks were firing
  // every ~60ms. Each player here has its source set exactly once up
  // front; playing is just a fire-and-forget seek+resume on whichever
  // player is next in rotation, with no locking and no per-call setup.
  // Memoized so every caller — including concurrent ones — awaits the
  // SAME initialization instead of each racing their own (which previously
  // let a tick fall through and silently drop before the pool was
  // actually populated).
  static Future<void> _ensureRandomGodTickPool() {
    return _randomGodTickInit ??= _populateRandomGodTickPool();
  }

  static Future<void> _populateRandomGodTickPool() async {
    try {
      for (var i = 0; i < 5; i++) {
        final p = AudioPlayer();
        await p.setReleaseMode(ReleaseMode.stop);
        await p.setSource(AssetSource('audio/button.mp3'));
        _randomGodTickPlayers.add(p);
      }
    } catch (e) {
      debugPrint('Random God tick pool error: $e');
    }
  }

  /// One reel-tick sound, timed to a single card flip.
  static Future<void> playRandomGodTick() async {
    _haptic();
    if (!_soundEnabled) return;
    await _ensureRandomGodTickPool();
    if (_randomGodTickPlayers.isEmpty) return;
    final p = _randomGodTickPlayers[_randomGodTickNext];
    _randomGodTickNext = (_randomGodTickNext + 1) % _randomGodTickPlayers.length;
    // Fire-and-forget — don't await the platform round-trip, or this call
    // would itself become the next tick's source of lag.
    unawaited(p.seek(Duration.zero).then((_) => p.resume()));
  }

  /// Plays once when the reel settles (realm found / god revealed) — far
  /// less frequent than ticks, so a single plain player is fine here.
  static Future<void> playRandomGodLand() async {
    _haptic();
    if (!_soundEnabled) return;
    try {
      _randomGodLandPlayer ??= AudioPlayer();
      await _randomGodLandPlayer!.play(AssetSource('audio/result.mp3'));
    } catch (e) {
      debugPrint('Random God land error: $e');
    }
  }
}
