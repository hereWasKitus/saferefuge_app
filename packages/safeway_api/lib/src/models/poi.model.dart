// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'poi.model.freezed.dart';
part 'poi.model.g.dart';

@freezed
class POI with _$POI {
  const factory POI({
    @JsonKey(name: '_id') required String id,
    @Default('') String address,
    @Default('') String phone,
    @Default('') String email,
    @Default('') String url,
    @Default('') String telegram,
    @Default('') String whatsapp,
    @Default('') String city,
    @Default('') String country,
    @Default('') String name,
    @Default('') String description,
    @Default([]) List<String> categories,
    @Default([]) List<String> organizations,
    @Default({}) Map<String, dynamic> geo,
    @Default('') @JsonKey(name: 'contact_person') String contactPerson,
    @Default([]) List<String> languages,
    @Default(false) bool approved,
    @Default('') String author,
    @Default(0) @JsonKey(name: 'distance_km') double distanceKm,
    @Default('') @JsonKey(name: 'socialmedia') String socialMedia,
    @Default('') @JsonKey(name: 'open_hours') String openHours,
  }) = _POI;

  factory POI.fromJson(Map<String, dynamic> json) => _$POIFromJson(json);

  // bool containsCategories(List<String> categories) {
  //   bool contains = false;

  //   for (var cat in categories) {
  //     if (contains) {
  //       break;
  //     }

  //     if (this.categories.contains(cat)) {
  //       contains = true;
  //     }
  //   }

  //   return contains;
  // }
}
