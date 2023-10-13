import 'package:cama_mod/models/radio_model.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';

class PlayerBuffer extends StatefulWidget {
  const PlayerBuffer({super.key});

  @override
  State<PlayerBuffer> createState() => _PlayerBufferState();
}

class _PlayerBufferState extends State<PlayerBuffer> {

  @override
  void initState() {
    startPlayer();
    super.initState();
  }

  void startPlayer() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var radio = context.read<RadioModel>();
      await radio.openPlayer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RadioModel>(builder: (ctx, data, _) {
      return PlayerBuilder.isBuffering(
          player: data.assetsAudioPlayer,
          builder: (BuildContext context, bool buffering) {
            if (buffering) {
              return _bufferingIcon();
            } else {
              return PlayerBuilder.isPlaying(
                  player: data.assetsAudioPlayer,
                  builder: (BuildContext context, bool isPlaying) {
                    return isPlaying ? _pauseButton() : _playButton();
                  });
            }
          });
    });
  }

  Widget _pauseButton() {
    return Consumer<RadioModel>(builder: (ctx, data, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () => data.assetsAudioPlayer.playOrPause(),
              child: Icon(Icons.pause_rounded,
                  size: 50, color: KColors.kPrimaryColor)),
          Text('PAUSE',
              style: TextStyle(color: KColors.kPrimaryColor, fontSize: 12))
        ],
      );
    });
  }

  Widget _bufferingIcon() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(color: KColors.kPrimaryColor, strokeWidth: 2),
        const SizedBox(height: 15),
        Text('BUFFERING',
            style: TextStyle(color: KColors.kPrimaryColor, fontSize: 12))
      ],
    );
  }

  Widget _playButton() {
    return Consumer<RadioModel>(builder: (ctx, data, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () => data.assetsAudioPlayer.playOrPause(),
              child: Icon(Icons.play_arrow_rounded,
                  size: 50, color: KColors.kPrimaryColor)),
          Text(
            'PLAY',
            style: TextStyle(color: KColors.kPrimaryColor, fontSize: 12),
          )
        ],
      );
    });
  }
}
