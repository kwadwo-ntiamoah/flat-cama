import 'dart:async';
import 'package:cama_mod/models/fade_slide_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FadeSlideShow extends StatefulWidget {
  const FadeSlideShow({super.key});

  @override
  State<FadeSlideShow> createState() => _FadeSlideShowState();
}

class _FadeSlideShowState extends State<FadeSlideShow> {
  Timer? timer;

  @override
  void initState() {
    initTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void initTimer() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        var data = context.read<FadeSlideModel>();
        data.initSlide();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Consumer<FadeSlideModel>(builder: (ctx, data, _) {
        return Image.asset( data.images[data.index], fit: BoxFit.cover);
      })
    );
  }
}
