// ignore_for_file: public_member_api_docs
import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
part 'poi_category.model.g.dart';

@JsonSerializable()
class POICategory {
  const POICategory({
    required this.id,
    this.name = '',
    this.nameUA = '',
    this.nameRU = '',
    this.description = '',
    this.iconURL = '',
  });

  factory POICategory.fromJson(Map<String, dynamic> json) =>
      _$POICategoryFromJson(json);

  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'category')
  final String name;
  @JsonKey(name: 'ua')
  final String nameUA;
  @JsonKey(name: 'ru')
  final String nameRU;
  final String description;
  @JsonKey(name: 'icon')
  final String iconURL;
}
