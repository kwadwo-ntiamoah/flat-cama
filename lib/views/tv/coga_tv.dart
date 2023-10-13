part of 'tv.dart';

class CogaTV extends StatelessWidget {
  const CogaTV({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.withOpacity(.2)),
            bottom: BorderSide(color: Colors.grey.withOpacity(.2)),
            left: BorderSide(color: Colors.deepPurpleAccent.withOpacity(.5), width: 5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('COGA TV',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.deepPurpleAccent.withOpacity(.5))),
          FaIcon(FontAwesomeIcons.satelliteDish,
              size: 20, color: Colors.deepPurpleAccent.withOpacity(.5))
          // Icon(Icons.satellite_alt_rounded, size: 20, color: KColors.kPrimaryColor,)
        ],
      ),
    );
  }
}
