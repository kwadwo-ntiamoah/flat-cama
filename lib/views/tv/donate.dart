part of 'tv.dart';

class Donate extends StatelessWidget {
  const Donate({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(5),
        width: 64,
        height: 64,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(45),
            boxShadow: [
              BoxShadow(
                color: KColors.kDarkColor.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.iconsGive2,
              height: 30,
              width: 30,
            ),
            Text(
              'Donate',
              style: TextStyle(fontSize: 13, color: KColors.kPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
