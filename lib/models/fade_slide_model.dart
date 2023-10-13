import 'package:flutter/cupertino.dart';

import '../generated/assets.dart';

class FadeSlideModel extends ChangeNotifier {
  int _index = 0;

  final List<String> _images = [
    Assets.images1,
    Assets.images2,
    Assets.images3,
    Assets.images4,
    Assets.images5
  ];

  get index => _index;
  get images => _images;

  void _continueToNextSlide() {
    _index+= 1;
    notifyListeners();
  }

  void _restartSlide() {
    _index = 0;
    notifyListeners();
  }

  void initSlide() {
    if (index < _images.length - 1) {
      _continueToNextSlide();
    } else {
      _restartSlide();
    }
  }
}