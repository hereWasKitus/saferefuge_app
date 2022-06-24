class RegistrationResponse {
  final String username;
  final String email;
  final String fullname;

  const RegistrationResponse({
    required this.username,
    required this.email,
    required this.fullname,
  });

  factory RegistrationResponse.fromMap(Map<String, dynamic> source) => RegistrationResponse(
        username: source['username'] ?? '',
        email: source['email'] ?? '',
        fullname: source['full_name'] ?? '',
      );
}
