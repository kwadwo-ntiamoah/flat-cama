import 'package:json_annotation/json_annotation.dart';

import '../programme/programme.dart';

part 'day.g.dart';

@JsonSerializable()
class Day {
  int id;
  String name, description;
  List<Programme> programmes;

  Day({ required this.id, required this.name, required this.description, required this.programmes});

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
  Map<String, dynamic> toJson() => _$DayToJson(this);
}