class Branch {
  final String? author;
  final String? id;
  final String? contactPerson;
  final String? address;
  final String? phone;
  final String? telegram;
  final String? email;
  final String? city;
  final String? country;
  final String? name;
  final String? whatsapp;
  final String? organization;
  final double? latitude;
  final double? longitude;
  final List<String>? categories;
  final String? website;
  final String? description;

  const Branch({
    this.author,
    this.id,
    this.contactPerson,
    this.address,
    this.phone,
    this.telegram,
    this.email,
    this.city,
    this.country,
    this.name,
    this.whatsapp,
    this.organization,
    this.latitude,
    this.longitude,
    this.categories = const [],
    this.website,
    this.description,
  });

  factory Branch.fromJSON(Map<String, dynamic> json) => Branch(
        id: json['_id'] ?? '',
        contactPerson: json['contactPerson'] ?? '',
        address: json['address'] ?? '',
        phone: json['phone'] ?? '',
        telegram: json['telegram'] ?? '',
        email: json['email'] ?? '',
        city: json['city'] ?? '',
        country: json['country'] ?? '',
        name: json['name'] ?? '',
        whatsapp: json['whatsapp'] ?? '',
        organization: json['organizations'] ?? '',
        latitude: json['geo']['coordinates'][0],
        longitude: json['geo']['coordinates'][1],
        categories: json['categories'] ?? [],
        author: json['author'] ?? '',
        website: json['url'] ?? '',
        description: json['description'] ?? '',
      );

  Branch copyWith({
    String? author,
    String? id,
    String? contactPerson,
    String? address,
    String? phone,
    String? telegram,
    String? email,
    String? city,
    String? country,
    String? name,
    String? whatsapp,
    String? organization,
    double? latitude,
    double? longitude,
    List<String>? categories,
    String? website,
    String? description,
  }) =>
      Branch(
        author: author ?? this.author,
        id: id ?? this.id,
        contactPerson: contactPerson ?? this.contactPerson,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        telegram: telegram ?? this.telegram,
        email: email ?? this.email,
        city: city ?? this.city,
        country: country ?? this.country,
        name: name ?? this.name,
        whatsapp: whatsapp ?? this.whatsapp,
        organization: organization ?? this.organization,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        categories: categories ?? this.categories,
      );
}
