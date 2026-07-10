import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicButton extends StatefulWidget {
  const MusicButton({super.key});

  @override
  State<MusicButton> createState() => _MusicButtonState();
}

class _MusicButtonState extends State<MusicButton> {
  late final AudioPlayer _player;
  bool _isPlaying = false;
  bool _isLoading = true;
  int _currentIndex = 0;
  final double _volume = 0.6;

  static const _playlist = [
    'audio/02. Memories of Mother.mp3',
    'audio/01. God of War.mp3',
  ];

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player.onPlayerComplete.listen((_) {
      _nextTrack();
    });
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    try {
      await _player.setSource(AssetSource(_playlist[_currentIndex]));
      await _player.setVolume(_volume);
    } catch (e) {
      debugPrint('Music load error: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _nextTrack() async {
    _currentIndex = (_currentIndex + 1) % _playlist.length;
    await _player.stop();
    await _player.setSource(AssetSource(_playlist[_currentIndex]));
    if (_isPlaying) {
      await _player.resume();
    }
  }

  Future<void> _toggle() async {
    if (_isLoading) return;

    if (_isPlaying) {
      await _player.pause();
      setState(() => _isPlaying = false);
    } else {
      if (_player.source == null) {
        await _player.setSource(AssetSource(_playlist[_currentIndex]));
      }
      await _player.resume();
      setState(() => _isPlaying = true);
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF333333), width: 1),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: _isLoading
            ? const Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  color: Color(0xFF555555),
                ),
              )
            : Icon(
                _isPlaying
                    ? Icons.music_note_rounded
                    : Icons.music_off_rounded,
                color: const Color(0xFF777777),
                size: 18,
              ),
      ),
    );
  }
}
