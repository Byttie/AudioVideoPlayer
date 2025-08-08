import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'drawer.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  double? _sliderValue;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('video/video.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.addListener(() {
      setState(() {
        _isPlaying = _controller.value.isPlaying;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    // Pause the video when navigating away
    if (_controller.value.isPlaying) {
      _controller.pause();
    }
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final isInitialized = _controller.value.isInitialized;
    final duration = isInitialized ? _controller.value.duration : Duration.zero;
    final position = isInitialized ? _controller.value.position : Duration.zero;
    final sliderMax = duration.inMilliseconds.toDouble();
    final sliderCurrent = _sliderValue ?? position.inMilliseconds.toDouble();
    return Scaffold(
      appBar: AppBar(title: const Text('Video Player')),
      drawer: const AppDrawer(),
      body: Center(
        child: isInitialized
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  Slider(
                    min: 0.0,
                    max: sliderMax > 0 ? sliderMax : 1.0,
                    value: sliderCurrent.clamp(0.0, sliderMax > 0 ? sliderMax : 1.0),
                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                    onChangeEnd: (value) {
                      _controller.seekTo(Duration(milliseconds: value.toInt()));
                      setState(() {
                        _sliderValue = null;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                        onPressed: () {
                          setState(() {
                            _isPlaying ? _controller.pause() : _controller.play();
                          });
                        },
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () async {
                          await _controller.pause();
                          await _controller.seekTo(Duration.zero);
                          setState(() {
                            _sliderValue = null;
                          });
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
} 