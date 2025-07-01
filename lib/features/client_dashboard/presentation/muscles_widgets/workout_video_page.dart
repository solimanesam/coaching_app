// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WorkoutVideoPlayer extends StatefulWidget {
  const WorkoutVideoPlayer({super.key, required this.workoutVideoUrl});

  final String workoutVideoUrl;

  @override
  State<WorkoutVideoPlayer> createState() => _WorkoutVideoPlayerState();
}

class _WorkoutVideoPlayerState extends State<WorkoutVideoPlayer> {
  YoutubePlayerController? _controller;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId(widget.workoutVideoUrl);
    if (videoID != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoID,
        flags: const YoutubePlayerFlags(autoPlay: false),
      );
    } else {
      setState(() {
        _errorMessage = "Invalid YouTube video URL";
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.orange),
        title:
            const Text('Workout Video', style: TextStyle(color: Colors.orange)),
      ),
      body: _errorMessage != null
          ? Center(
              child: Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 18),
              ),
            )
          : _controller == null
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    const SizedBox(height: 200),
                    YoutubePlayer(
                      controller: _controller!,
                      progressColors: const ProgressBarColors(
                        backgroundColor: Colors.red,
                        handleColor: Colors.red,
                      ),
                    ),
                  ],
                ),
    );
  }
}
