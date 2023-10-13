import 'package:json_annotation/json_annotation.dart';

part 'programme.g.dart';

@JsonSerializable()
class Programme {
  int id;
  String name, thumbnail, time, description;

  Programme({ required this.id, required this.name, required this.thumbnail, required this.time, required this.description });

  factory Programme.fromJson(Map<String, dynamic> json) => _$ProgrammeFromJson(json);
  Map<String, dynamic> toJson() => _$ProgrammeToJson(this);
}