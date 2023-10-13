import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class TvFullScreenView extends StatelessWidget {
  final String url;

  const TvFullScreenView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      backgroundColor: Colors.black,
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: BetterPlayer.network(
            url,
            betterPlayerConfiguration:
            const BetterPlayerConfiguration(
                autoDetectFullscreenAspectRatio: true,
                aspectRatio: 16 / 9,
                autoPlay: true,
                fullScreenByDefault: true,
                controlsConfiguration:
                BetterPlayerControlsConfiguration(
                    enableSubtitles: false,
                    enableQualities: false,
                    enableAudioTracks: false,
                    showControls: true)),
          ),
        ),
      ),
    );
  }
}
