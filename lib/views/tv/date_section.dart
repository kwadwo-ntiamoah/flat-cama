part of 'tv.dart';

class DateSection extends StatelessWidget {
  const DateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TvModel>(builder: (ctx, state, _) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: MediaQuery.of(context).size.height * .15,
        color: KColors.kDarkColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * .3,
                child: Image.asset(
                  'assets/images/logo.png',
                  color: Colors.white,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("${state.getDate()["day"]!},",
                        style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 20,
                            fontWeight: FontWeight.w400)),
                    Text(state.getDate()["month"]!,
                        style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 20,
                            fontWeight: FontWeight.w400))
                  ],
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  state.getDate()["date"]!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w900),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
