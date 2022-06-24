import 'dart:convert';

class Organization {
  final String id;
  final String address;
  final String city;
  final String country;
  final double? lat;
  final double? lng;
  final String phone;
  final String name;
  final String email;
  final bool approved;
  final String website;
  final String telegram;
  final String whatsapp;
  final List<String> categories;
  final String contactPerson;
  final String author;
  final String formalID;
  final List<String> members;

  Organization({
    required this.id,
    this.address = '',
    this.city = '',
    this.country = '',
    this.lat,
    this.lng,
    this.phone = '',
    this.name = '',
    this.email = '',
    this.approved = false,
    this.categories = const [],
    this.telegram = '',
    this.whatsapp = '',
    this.website = '',
    this.contactPerson = '',
    this.author = '',
    this.formalID = '',
    this.members = const [],
  });

  Organization copyWith({
    String? id,
    String? address,
    String? city,
    String? country,
    double? lat,
    double? lng,
    String? phone,
    String? name,
    String? email,
    bool? approved,
    List<String>? categories,
    String? telegram,
    String? whatsapp,
    String? website,
    String? contactPerson,
    String? author,
    String? formalID,
    List<String>? members,
  }) {
    return Organization(
      id: id ?? this.id,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      email: email ?? this.email,
      approved: approved ?? this.approved,
      categories: categories ?? this.categories,
      telegram: telegram ?? this.telegram,
      whatsapp: whatsapp ?? this.whatsapp,
      website: website ?? this.website,
      contactPerson: contactPerson ?? this.contactPerson,
      author: author ?? this.author,
      formalID: formalID ?? this.formalID,
      members: members ?? this.members,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'address': address});
    result.addAll({'city': city});
    result.addAll({'country': country});
    if (lat != null) {
      result.addAll({'lat': lat});
    }
    if (lng != null) {
      result.addAll({'lng': lng});
    }
    result.addAll({'phone': phone});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'approved': approved});
    result.addAll({'categories': categories});
    result.addAll({'telegram': telegram});
    result.addAll({'whatsapp': whatsapp});
    result.addAll({'website': website});
    result.addAll({'contactPerson': contactPerson});
    result.addAll({'author': author});
    result.addAll({'formalID': formalID});
    result.addAll({'members': members});

    return result;
  }

  factory Organization.fromMap(Map<String, dynamic> map) {
    return Organization(
      id: map['_id'] ?? '',
      address: map['address'] ?? '',
      city: map['city'] ?? '',
      country: map['country'] ?? '',
      lat: map['geo']?['coordinates'][0]?.toDouble(),
      lng: map['geo']?['coordinates'][1]?.toDouble(),
      phone: map['phone'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      approved: map['approved'] ?? false,
      categories: map['categories'] != null && map['categories'].length > 0 ? List<String>.from(map['categories']) : [],
      telegram: map['telegram'] ?? '',
      whatsapp: map['whatsapp'] ?? '',
      website: map['url'] ?? '',
      contactPerson: map['contact_person'] ?? '',
      author: map['author'] ?? '',
      formalID: map['formal_id'] ?? '',
      members: map['members'] != null && map['members'].length > 0 ? List<String>.from(map['members']) : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Organization.fromJson(String source) => Organization.fromMap(json.decode(source));

  factory Organization.empty() => Organization(
        id: '',
      );

  @override
  String toString() {
    return 'Organization(id: $id, address: $address, city: $city, country: $country, lat: $lat, lng: $lng, phone: $phone, name: $name, email: $email, approved: $approved, categories: $categories)';
  }
}
