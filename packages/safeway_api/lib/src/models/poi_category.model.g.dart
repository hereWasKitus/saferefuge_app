// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi_category.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

POICategory _$POICategoryFromJson(Map<String, dynamic> json) => POICategory(
      id: json['_id'] as String,
      name: json['category'] as String? ?? '',
      nameUA: json['ua'] as String? ?? '',
      nameRU: json['ru'] as String? ?? '',
      description: json['description'] as String? ?? '',
      iconURL: json['icon'] as String? ?? '',
    );

Map<String, dynamic> _$POICategoryToJson(POICategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'category': instance.name,
      'ua': instance.nameUA,
      'ru': instance.nameRU,
      'description': instance.description,
      'icon': instance.iconURL,
    };
