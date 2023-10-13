// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      programmes: (json['programmes'] as List<dynamic>)
          .map((e) => Programme.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'programmes': instance.programmes,
    };
