class Country {
  final String name;
  final String iso2;

  Country({
    required this.name,
    required this.iso2,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      Country(name: json['name'], iso2: json['iso2']);
}
