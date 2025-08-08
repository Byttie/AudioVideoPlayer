import 'package:flutter/material.dart';
import 'drawer.dart';
import 'package:just_audio/just_audio.dart' as ja;

class AudioPlayer extends StatefulWidget {
  const AudioPlayer({super.key});

  @override
  State<AudioPlayer> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  late final ja.AudioPlayer _player; // late is used to declare a variable that will be initialized later and ja.AudioPlayer is the built in audio player class from the just_audio package for managing audio playback and not the Class that we created for our UI
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _player = ja.AudioPlayer();
    _player.setAsset('audio/audio.mp3');
    _player.playerStateStream.listen((state) {
      setState(() {
        _isPlaying = state.playing;
      });
    });
  }

  @override // dispose is used to free up resources when the widget is removed from the tree
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
              iconSize: 64,
              onPressed: () {
                if (_isPlaying) {
                  _player.pause();
                } else {
                  _player.play();
                }
              },
            ),
            SizedBox(width: 24),
            IconButton(
              icon: Icon(Icons.cancel),
              iconSize: 64,
              onPressed: () async {
                await _player.stop();
                await _player.seek(Duration.zero);
              },
            ),
          ],
        ),
      ),
    );
  }
}