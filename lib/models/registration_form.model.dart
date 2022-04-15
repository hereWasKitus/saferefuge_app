import 'package:google_maps_flutter/google_maps_flutter.dart';

class RegistrationForm {
  final String? email;
  final String? password;
  final String? name;
  final String? username;
  final String? organizationName;
  final String? phone;
  final String? address;
  final List<String> categories;
  final LatLng? latLng;

  const RegistrationForm({
    this.email = '',
    this.password = '',
    this.name = '',
    this.username = '',
    this.address = '',
    this.categories = const [],
    this.organizationName = '',
    this.latLng = null,
    this.phone = '',
  });

  RegistrationForm copyWith(
      {email,
      password,
      name,
      username,
      organizationName,
      phone,
      address,
      categories,
      latLng}) {
    return RegistrationForm(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      username: username ?? this.username,
      organizationName: organizationName ?? this.organizationName,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      categories: categories ?? this.categories,
      latLng: latLng ?? this.latLng,
    );
  }
}
