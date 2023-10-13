part of 'radio.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            RadialVolume(),
            Positioned(
              bottom: 0,
              top: 0,
              left: 0,
              right: 0,
              child: PlayerBuffer(),
            )
          ],
        ),
        // Support()
      ],
    );
  }
}
