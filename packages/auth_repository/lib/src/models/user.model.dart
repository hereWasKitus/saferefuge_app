import 'dart:convert';

import 'package:auth_repository/auth_repository.dart';

class User {
  String username;
  String email;
  String fullName;
  String id;
  Organization? org;
  String? positionInOrganization;
  Set<String>? onboardingStatus;

  User({
    required this.username,
    required this.email,
    required this.fullName,
    required this.id,
    this.org,
    this.positionInOrganization,
    this.onboardingStatus,
  });

  User copyWith({
    String? username,
    String? email,
    String? fullName,
    String? id,
    Organization? org,
    String? positionInOrganization,
    Set<String>? onboardingStatus,
  }) {
    return User(
      username: username ?? this.username,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      id: id ?? this.id,
      org: org ?? this.org,
      positionInOrganization: positionInOrganization ?? this.positionInOrganization,
      onboardingStatus: onboardingStatus ?? this.onboardingStatus,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'username': username});
    result.addAll({'email': email});
    result.addAll({'full_name': fullName});
    result.addAll({'id': id});
    result.addAll({'org': org});
    result.addAll({'positionInOrganization': positionInOrganization});
    result.addAll({'onboardingStatus': onboardingStatus});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['email'] ?? '',
      email: map['email'] ?? '',
      fullName: map['full_name'] ?? '',
      id: map['_id'] ?? '',
      positionInOrganization: map['org_position'] ?? '',
      onboardingStatus: Set<String>.from(map['on_boarding'] ?? ['INITIAL', 'ORGANIZATION_ASSIGNMENT']),
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

  factory User.empty() => User(username: '', fullName: '', id: '', email: '');

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(username: $username, email: $email, fullName: $fullName, id: $id, org: $org)';

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is User && other.username == username && other.fullName == fullName && other.email == email;
  // }

  // @override
  // int get hashCode => username.hashCode ^ fullName.hashCode ^ email.hashCode;
}
