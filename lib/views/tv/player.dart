part of 'tv.dart';

class TvPlayer extends StatelessWidget {
  const TvPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TvModel>(builder: (ctx, state, _) {
      return SizedBox(
        height: 230,
        child: Stack(
          children: [
            Container(
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: GestureDetector(
                onTap: () => context.pushNamed("tvFullScreen", extra: state.url),
                child: BetterPlayer.network(
                  state.url,
                  betterPlayerConfiguration:
                  const BetterPlayerConfiguration(
                      autoDetectFullscreenAspectRatio: true,
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      controlsConfiguration:
                      BetterPlayerControlsConfiguration(
                          enableSubtitles: false,
                          enableQualities: false,
                          enableAudioTracks: false,
                          showControls: false)),
                ),
              ),
            ),
            const Positioned(
              bottom: 0,
              right: 25,
              child: Donate(),
            )
          ],
        ),
      );
    });
  }
}
