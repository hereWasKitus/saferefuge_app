import 'dart:convert';

class POI {
  String id;
  String? address;
  String? phone;
  String? email;
  String? url;
  String? telegram;
  String? whatsapp;
  String? city;
  String? country;
  String name;
  String? description;
  List? categories;
  List? organisations;
  double latitude;
  double longitude;
  String? contactPerson;
  List<String>? languages;

  POI({
    required this.id,
    this.address = '',
    this.phone = '',
    this.email = '',
    this.url = '',
    this.telegram = '',
    this.whatsapp = '',
    this.city = '',
    this.country = '',
    required this.name,
    this.description = '',
    this.categories = const [],
    this.organisations = const [],
    required this.latitude,
    required this.longitude,
    this.contactPerson = '',
    this.languages = const [],
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
    List? categories,
    List? organisations,
    double? latitude,
    double? longitude,
    String? contactPerson,
    List<String>? languages,
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
    );
  }

  factory POI.fromMap(Map<String, dynamic> map) {
    return POI(
      id: map['_id'] ?? '',
      address: map['address'],
      phone: map['phone'],
      email: map['email'],
      url: map['url'],
      telegram: map['telegram'],
      whatsapp: map['whatsapp'],
      city: map['city'],
      country: map['country'],
      name: map['name'] ?? '',
      description: map['description'],
      categories: map['categories'] ?? [],
      organisations: map['organisations'] ?? [],
      latitude: map['geo']['coordinates'][1]?.toDouble() ?? 0.0,
      longitude: map['geo']['coordinates'][0]?.toDouble() ?? 0.0,
      contactPerson: map['contact_person'],
      languages: map['languages'] != null ? List<String>.from(map['languages']) : [],
    );
  }

  factory POI.fromJson(String source) => POI.fromMap(json.decode(source));

  bool containsCategories(List<String> categories) {
    bool contains = false;

    for (var cat in categories) {
      if (contains) {
        break;
      }

      if (this.categories!.contains(cat)) {
        contains = true;
      }
    }

    return contains;
  }

  @override
  String toString() {
    return 'POI(id: $id, address: $address, phone: $phone, email: $email, url: $url, telegram: $telegram, whatsapp: $whatsapp, city: $city, country: $country, name: $name, description: $description, categories: $categories, organisations: $organisations, latitude: $latitude, longitude: $longitude, contactPerson: $contactPerson, languages: $languages)';
  }
}
