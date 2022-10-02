// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'poi.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

POI _$POIFromJson(Map<String, dynamic> json) {
  return _POI.fromJson(json);
}

/// @nodoc
mixin _$POI {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get telegram => throw _privateConstructorUsedError;
  String get whatsapp => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  List<String> get organizations => throw _privateConstructorUsedError;
  Map<String, dynamic> get geo => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_person')
  String get contactPerson => throw _privateConstructorUsedError;
  List<String> get languages => throw _privateConstructorUsedError;
  bool get approved => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $POICopyWith<POI> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $POICopyWith<$Res> {
  factory $POICopyWith(POI value, $Res Function(POI) then) =
      _$POICopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String id,
      String address,
      String phone,
      String email,
      String url,
      String telegram,
      String whatsapp,
      String city,
      String country,
      String name,
      String description,
      List<String> categories,
      List<String> organizations,
      Map<String, dynamic> geo,
      @JsonKey(name: 'contact_person') String contactPerson,
      List<String> languages,
      bool approved,
      String author});
}

/// @nodoc
class _$POICopyWithImpl<$Res> implements $POICopyWith<$Res> {
  _$POICopyWithImpl(this._value, this._then);

  final POI _value;
  // ignore: unused_field
  final $Res Function(POI) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? url = freezed,
    Object? telegram = freezed,
    Object? whatsapp = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? categories = freezed,
    Object? organizations = freezed,
    Object? geo = freezed,
    Object? contactPerson = freezed,
    Object? languages = freezed,
    Object? approved = freezed,
    Object? author = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      telegram: telegram == freezed
          ? _value.telegram
          : telegram // ignore: cast_nullable_to_non_nullable
              as String,
      whatsapp: whatsapp == freezed
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      organizations: organizations == freezed
          ? _value.organizations
          : organizations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      geo: geo == freezed
          ? _value.geo
          : geo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      contactPerson: contactPerson == freezed
          ? _value.contactPerson
          : contactPerson // ignore: cast_nullable_to_non_nullable
              as String,
      languages: languages == freezed
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      approved: approved == freezed
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as bool,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_POICopyWith<$Res> implements $POICopyWith<$Res> {
  factory _$$_POICopyWith(_$_POI value, $Res Function(_$_POI) then) =
      __$$_POICopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String id,
      String address,
      String phone,
      String email,
      String url,
      String telegram,
      String whatsapp,
      String city,
      String country,
      String name,
      String description,
      List<String> categories,
      List<String> organizations,
      Map<String, dynamic> geo,
      @JsonKey(name: 'contact_person') String contactPerson,
      List<String> languages,
      bool approved,
      String author});
}

/// @nodoc
class __$$_POICopyWithImpl<$Res> extends _$POICopyWithImpl<$Res>
    implements _$$_POICopyWith<$Res> {
  __$$_POICopyWithImpl(_$_POI _value, $Res Function(_$_POI) _then)
      : super(_value, (v) => _then(v as _$_POI));

  @override
  _$_POI get _value => super._value as _$_POI;

  @override
  $Res call({
    Object? id = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? url = freezed,
    Object? telegram = freezed,
    Object? whatsapp = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? categories = freezed,
    Object? organizations = freezed,
    Object? geo = freezed,
    Object? contactPerson = freezed,
    Object? languages = freezed,
    Object? approved = freezed,
    Object? author = freezed,
  }) {
    return _then(_$_POI(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      telegram: telegram == freezed
          ? _value.telegram
          : telegram // ignore: cast_nullable_to_non_nullable
              as String,
      whatsapp: whatsapp == freezed
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      organizations: organizations == freezed
          ? _value._organizations
          : organizations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      geo: geo == freezed
          ? _value._geo
          : geo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      contactPerson: contactPerson == freezed
          ? _value.contactPerson
          : contactPerson // ignore: cast_nullable_to_non_nullable
              as String,
      languages: languages == freezed
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      approved: approved == freezed
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as bool,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_POI implements _POI {
  const _$_POI(
      {@JsonKey(name: '_id') required this.id,
      this.address = '',
      this.phone = '',
      this.email = '',
      this.url = '',
      this.telegram = '',
      this.whatsapp = '',
      this.city = '',
      this.country = '',
      this.name = '',
      this.description = '',
      final List<String> categories = const [],
      final List<String> organizations = const [],
      final Map<String, dynamic> geo = const {},
      @JsonKey(name: 'contact_person') this.contactPerson = '',
      final List<String> languages = const [],
      this.approved = false,
      this.author = ''})
      : _categories = categories,
        _organizations = organizations,
        _geo = geo,
        _languages = languages;

  factory _$_POI.fromJson(Map<String, dynamic> json) => _$$_POIFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final String telegram;
  @override
  @JsonKey()
  final String whatsapp;
  @override
  @JsonKey()
  final String city;
  @override
  @JsonKey()
  final String country;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<String> _organizations;
  @override
  @JsonKey()
  List<String> get organizations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_organizations);
  }

  final Map<String, dynamic> _geo;
  @override
  @JsonKey()
  Map<String, dynamic> get geo {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_geo);
  }

  @override
  @JsonKey(name: 'contact_person')
  final String contactPerson;
  final List<String> _languages;
  @override
  @JsonKey()
  List<String> get languages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  @override
  @JsonKey()
  final bool approved;
  @override
  @JsonKey()
  final String author;

  @override
  String toString() {
    return 'POI(id: $id, address: $address, phone: $phone, email: $email, url: $url, telegram: $telegram, whatsapp: $whatsapp, city: $city, country: $country, name: $name, description: $description, categories: $categories, organizations: $organizations, geo: $geo, contactPerson: $contactPerson, languages: $languages, approved: $approved, author: $author)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_POI &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.telegram, telegram) &&
            const DeepCollectionEquality().equals(other.whatsapp, whatsapp) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._organizations, _organizations) &&
            const DeepCollectionEquality().equals(other._geo, _geo) &&
            const DeepCollectionEquality()
                .equals(other.contactPerson, contactPerson) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            const DeepCollectionEquality().equals(other.approved, approved) &&
            const DeepCollectionEquality().equals(other.author, author));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(telegram),
      const DeepCollectionEquality().hash(whatsapp),
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_organizations),
      const DeepCollectionEquality().hash(_geo),
      const DeepCollectionEquality().hash(contactPerson),
      const DeepCollectionEquality().hash(_languages),
      const DeepCollectionEquality().hash(approved),
      const DeepCollectionEquality().hash(author));

  @JsonKey(ignore: true)
  @override
  _$$_POICopyWith<_$_POI> get copyWith =>
      __$$_POICopyWithImpl<_$_POI>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_POIToJson(
      this,
    );
  }
}

abstract class _POI implements POI {
  const factory _POI(
      {@JsonKey(name: '_id') required final String id,
      final String address,
      final String phone,
      final String email,
      final String url,
      final String telegram,
      final String whatsapp,
      final String city,
      final String country,
      final String name,
      final String description,
      final List<String> categories,
      final List<String> organizations,
      final Map<String, dynamic> geo,
      @JsonKey(name: 'contact_person') final String contactPerson,
      final List<String> languages,
      final bool approved,
      final String author}) = _$_POI;

  factory _POI.fromJson(Map<String, dynamic> json) = _$_POI.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get address;
  @override
  String get phone;
  @override
  String get email;
  @override
  String get url;
  @override
  String get telegram;
  @override
  String get whatsapp;
  @override
  String get city;
  @override
  String get country;
  @override
  String get name;
  @override
  String get description;
  @override
  List<String> get categories;
  @override
  List<String> get organizations;
  @override
  Map<String, dynamic> get geo;
  @override
  @JsonKey(name: 'contact_person')
  String get contactPerson;
  @override
  List<String> get languages;
  @override
  bool get approved;
  @override
  String get author;
  @override
  @JsonKey(ignore: true)
  _$$_POICopyWith<_$_POI> get copyWith => throw _privateConstructorUsedError;
}
