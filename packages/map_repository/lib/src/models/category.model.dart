import 'dart:convert';

class Category {
  String id;
  String name;
  String? ru;
  String? ua;
  String? description;
  String? icon;
  Category({
    required this.id,
    this.name = '',
    this.ru,
    this.ua,
    this.description,
    this.icon,
  });

  Category copyWith({
    String? id,
    String? name,
    String? ru,
    String? ua,
    String? description,
    String? icon,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      ru: ru ?? this.ru,
      ua: ua ?? this.ua,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    if (ru != null) {
      result.addAll({'ru': ru});
    }
    if (ua != null) {
      result.addAll({'ua': ua});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (icon != null) {
      result.addAll({'icon': icon});
    }

    return result;
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['_id'] ?? '',
      name: map['category'],
      ru: map['ru'],
      ua: map['ua'],
      description: map['description'],
      icon: map['icon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Category(id: $id, name: $name, ru: $ru, ua: $ua, description: $description, icon: $icon)';
  }
}
