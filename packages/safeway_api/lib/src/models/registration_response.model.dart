class RegistrationResponse {
  RegistrationResponse({
    this.success = false,
    this.err = '',
    this.data,
  });

  String err;
  bool success;
  dynamic data;
}
