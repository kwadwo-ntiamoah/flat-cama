import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cama_mod/repositories/radio.repo.dart';
import 'package:cama_mod/views/models/day/day.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class RadioModel extends ChangeNotifier {
  final RadioRepo radioRepo;

  RadioModel({required this.radioRepo});

  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
  bool _isVolumeChanging = false;
  double _volumeValue = 80;
  bool _isLoading = true;
  List<Day> _days = [];

  bool get isVolumeChanging => _isVolumeChanging;
  double get volumeValue => _volumeValue;
  AssetsAudioPlayer get assetsAudioPlayer => _assetsAudioPlayer;
  bool get isLoading => _isLoading;
  List<Day> get days => _days;

  void onPlay() async {
    await _assetsAudioPlayer.play();
    notifyListeners();
  }

  void onVolumeChange(double newValue) {
    _volumeValue = newValue;
    _isVolumeChanging = true;
    _assetsAudioPlayer.setVolume(newValue.ceil() / 100);

    notifyListeners();
  }

  void onVolumeEnd(double newValue) {
    _isVolumeChanging = false;
    notifyListeners();
  }

  Future openPlayer() async {
    try {
      _assetsAudioPlayer.setVolume(0.8);
      await _assetsAudioPlayer.open(
          Audio.liveStream('http://stream.zeno.fm/v4yadutfvnhvv'),
          autoStart: true);
    } catch (e) {
      print(e);
      print('error playing radio');
    }
  }

  void disposePlayer() {
    _assetsAudioPlayer.stop();
    _assetsAudioPlayer.dispose();

    notifyListeners();
  }

  Future getProgrammeDays() async {
    _isLoading = true;

    try {
      _days = await radioRepo.getDays();
      developer.log("here you want");
      developer.log(_days.length.toString());
      _isLoading = false;

      notifyListeners();
    } on Exception catch (e) {
      _isLoading = false;
      notifyListeners();

      developer.log(e.toString());
    }
  }
}