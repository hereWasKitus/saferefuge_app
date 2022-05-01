class Category {
  String id;
  String? en;
  String? ru;
  String? ua;
  String? description;
  String? icon;

  Category({
    required this.id,
    this.en = '',
    this.ru = '',
    this.ua = '',
    this.description = '',
    this.icon = '',
  });

  factory Category.fromJSON(Map<String, dynamic> json) => Category(
        id: json['_id'],
        en: json['en'],
        ru: json['ru'],
        ua: json['ua'],
        description: json['description'],
        icon: json['icon'],
      );

  @override
  String toString() {
    return 'Category: {id: $id, en: $en, ru: $ru, ua: $ua, description: $description, icon: $icon, }';
  }
}
