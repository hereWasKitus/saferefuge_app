// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_POI _$$_POIFromJson(Map<String, dynamic> json) => _$_POI(
      id: json['_id'] as String,
      address: json['address'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      url: json['url'] as String? ?? '',
      telegram: json['telegram'] as String? ?? '',
      whatsapp: json['whatsapp'] as String? ?? '',
      city: json['city'] as String? ?? '',
      country: json['country'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      organizations: (json['organizations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      geo: json['geo'] as Map<String, dynamic>? ?? const {},
      contactPerson: json['contact_person'] as String? ?? '',
      languages: (json['languages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      approved: json['approved'] as bool? ?? false,
      author: json['author'] as String? ?? '',
    );

Map<String, dynamic> _$$_POIToJson(_$_POI instance) => <String, dynamic>{
      '_id': instance.id,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'url': instance.url,
      'telegram': instance.telegram,
      'whatsapp': instance.whatsapp,
      'city': instance.city,
      'country': instance.country,
      'name': instance.name,
      'description': instance.description,
      'categories': instance.categories,
      'organizations': instance.organizations,
      'geo': instance.geo,
      'contact_person': instance.contactPerson,
      'languages': instance.languages,
      'approved': instance.approved,
      'author': instance.author,
    };
