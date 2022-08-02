import 'dart:convert';

class POI {
  final String id;
  final String address;
  final String phone;
  final String email;
  final String url;
  final String telegram;
  final String whatsapp;
  final String city;
  final String country;
  final String name;
  final String description;
  final List<String> categories;
  final List organisations;
  final double latitude;
  final double longitude;
  final String contactPerson;
  final Set<String> languages;
  final bool approved;

  const POI({
    this.id = '',
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
    this.categories = const [],
    this.organisations = const [],
    this.latitude = 0,
    this.longitude = 0,
    this.contactPerson = '',
    this.languages = const {},
    this.approved = false,
  });

  POI copyWith({
    String? id,
    String? address,
    String? phone,
    String? email,
    String? url,
    String? telegram,
    String? whatsapp,
    String? city,
    String? country,
    String? name,
    String? description,
    List<String>? categories,
    List? organisations,
    double? latitude,
    double? longitude,
    String? contactPerson,
    Set<String>? languages,
    bool? approved,
  }) {
    return POI(
      id: id ?? this.id,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      url: url ?? this.url,
      telegram: telegram ?? this.telegram,
      whatsapp: whatsapp ?? this.whatsapp,
      city: city ?? this.city,
      country: country ?? this.country,
      name: name ?? this.name,
      description: description ?? this.description,
      categories: categories ?? this.categories,
      organisations: organisations ?? this.organisations,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      contactPerson: contactPerson ?? this.contactPerson,
      languages: languages ?? this.languages,
      approved: approved ?? this.approved,
    );
  }

  factory POI.fromMap(Map<String, dynamic> map) {
    return POI(
      id: map['_id'] ?? '',
      address: map['address'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      url: map['url'] ?? '',
      telegram: map['telegram'] ?? '',
      whatsapp: map['whatsapp'] ?? '',
      city: map['city'] ?? '',
      country: map['country'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      categories: map['categories'] == null ? [] : List.from(map['categories']),
      organisations: map['organisations'] == null ? [] : List.from(map['organisations']),
      latitude: map['geo']['coordinates'][1] ?? 0.0,
      longitude: map['geo']['coordinates'][0] ?? 0.0,
      contactPerson: map['contact_person'] ?? '',
      languages: map['languages'] == null ? {} : Set<String>.from(map['languages']),
      approved: map['approved'] ?? false,
    );
  }

  factory POI.fromJson(String source) => POI.fromMap(json.decode(source));

  bool containsCategories(List<String> categories) {
    bool contains = false;

    for (var cat in categories) {
      if (contains) {
        break;
      }

      if (this.categories.contains(cat)) {
        contains = true;
      }
    }

    return contains;
  }

  @override
  String toString() {
    return 'POI(id: $id, address: $address, phone: $phone, email: $email, url: $url, telegram: $telegram, whatsapp: $whatsapp, city: $city, country: $country, name: $name, description: $description, categories: $categories, organisations: $organisations, latitude: $latitude, longitude: $longitude, contactPerson: $contactPerson, languages: $languages)';
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'address': address});
    result.addAll({'phone': phone});
    result.addAll({'email': email});
    result.addAll({'url': url});
    result.addAll({'telegram': telegram});
    result.addAll({'whatsapp': whatsapp});
    result.addAll({'city': city});
    result.addAll({'country': country});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'categories': categories});
    result.addAll({'organisations': organisations});
    result.addAll({'latitude': latitude});
    result.addAll({'longitude': longitude});
    result.addAll({'contactPerson': contactPerson});
    result.addAll({'languages': languages.toList()});
    result.addAll({'approved': approved});

    return result;
  }

  String toJson() => json.encode(toMap());
}
