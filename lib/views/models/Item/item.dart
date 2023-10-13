import 'package:cama_mod/views/models/category/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  final int id;
  final Category category;
  final String name, description, thumbnail;
  final double price, discount;
  final List<String> images;
  final bool inStock;

  Item({ required this.id, required this.category,
  required this.name, required this.description, required this.thumbnail,
    required this.price, required this.discount, required this.images, required this.inStock
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}