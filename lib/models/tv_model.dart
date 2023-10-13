import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TvModel extends ChangeNotifier {

  bool _remind = false;
  late final String date;
  final String _url =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";

  bool get remind => _remind;
  String get url => _url;

  void setReminder(bool val) {
    _remind = val;

    notifyListeners();
  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Map<String, String> getDate() {
    var temp = DateTime.now();
    var day = DateFormat('EEEE').format(temp);
    var date = DateFormat('d').format(temp);
    var month = DateFormat('MMMM').format(temp);
    // DateFormat('EEEE, d MMM, yyyy')
    return {"day": day, "date": date, "month": month};
  }

  DateTime getNextSunday() {
    DateTime today = DateTime.now();
    DateTime firstDayOfTheWeek =
    today.subtract(Duration(days: today.weekday));
    DateTime nextWeekSunday = firstDayOfTheWeek.add(const Duration(days: 7));

    return nextWeekSunday;
  }

  Duration timeDuration() {
    DateTime today = DateTime.now();
    DateTime firstDayOfTheWeek =
    today.subtract(Duration(days: today.weekday));
    DateTime nextWeekSunday =
    firstDayOfTheWeek.add(const Duration(days: 7, hours: 8, minutes: 30));
    Duration difference = nextWeekSunday.difference(firstDayOfTheWeek);

    return difference;
  }
}