import 'dart:convert';

import 'package:auth_repository/auth_repository.dart';

class User {
  String username;
  String fullName;
  String id;
  Organization? org;
  String? positionInOrganization;

  User({
    required this.username,
    required this.fullName,
    required this.id,
    this.org,
    this.positionInOrganization,
  });

  User copyWith({
    String? username,
    String? fullName,
    String? id,
    Organization? org,
    String? positionInOrganization,
  }) {
    return User(
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      id: id ?? this.id,
      org: org ?? this.org,
      positionInOrganization: positionInOrganization ?? this.positionInOrganization,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'username': username});
    result.addAll({'full_name': fullName});
    result.addAll({'id': id});
    result.addAll({'org': org});
    result.addAll({'positionInOrganization': positionInOrganization});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['email'] ?? '',
      fullName: map['full_name'] ?? '',
      id: map['_id'] ?? '',
      positionInOrganization: map['org_position'] ?? '',
      org: Organization(
        id: map['org_id'] ?? '',
        name: map['org_name'] ?? '',
        email: map['org_email'] ?? '',
        formalID: map['org_formal_id'] ?? '',
        phone: map['org_phone'] ?? '',
        website: map['org_url'] ?? '',
        city: map['org_city'] ?? '',
        country: map['org_country'] ?? '',
      ),
    );
  }

  factory User.empty() => User(username: '', fullName: '', id: '');

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(username: $username, fullName: $fullName, id: $id, org: $org)';

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is User && other.username == username && other.fullName == fullName && other.email == email;
  // }

  // @override
  // int get hashCode => username.hashCode ^ fullName.hashCode ^ email.hashCode;
}
