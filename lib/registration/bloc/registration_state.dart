part of 'registration_bloc.dart';

enum RegistrationStatus { initial, failed, success, loading }

class RegistrationState extends Equatable {
  const RegistrationState({
    this.email = '',
    this.password = '',
    this.fullName = '',
    this.organizationName = '',
    this.organizationAddress = '',
    this.organizationPhone = '',
    this.services = const <String>[],
    this.position,
    this.website,
    this.firstStepCompleted = false,
    this.registrationCompleted = false,
    this.isLoading = false,
    this.registrationNumber = '',
    this.organizationEmail = '',
    this.registrationStatus = RegistrationStatus.initial,
  });

  final String email;
  final String password;
  final String fullName;
  final String organizationName;
  final String organizationAddress;
  final String organizationPhone;
  final String registrationNumber;
  final String organizationEmail;
  final List<String> services;
  final LatLng? position;
  final String? website;
  final bool firstStepCompleted;
  final bool registrationCompleted;
  final bool isLoading;
  final RegistrationStatus registrationStatus;

  // isFilled(String? value) => value != null || value!.isNotEmpty;

  bool get isEmailValid {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  bool get isPasswordValid {
    return password.length >= 6;
  }

  bool get isNameValid {
    return fullName.length >= 3;
  }

  bool get isOrganizationNameValid {
    return organizationName.length >= 3;
  }

  bool get isOrganizationAddressValid {
    return organizationAddress.length >= 3;
  }

  bool get isOrganizationPhoneValid {
    return RegExp(r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$").hasMatch(organizationPhone);
  }

  RegistrationState copyWith({
    String? email,
    String? password,
    String? fullName,
    String? registrationNumber,
    String? organizationName,
    String? organizationAddress,
    String? organizationPhone,
    String? organizationEmail,
    List<String>? services,
    LatLng? position,
    String? website,
    bool? firstStepCompleted,
    bool? registrationCompleted,
    bool? isLoading,
    RegistrationStatus? registrationStatus,
  }) =>
      RegistrationState(
        email: email ?? this.email,
        password: password ?? this.password,
        fullName: fullName ?? this.fullName,
        organizationName: organizationName ?? this.organizationName,
        organizationAddress: organizationAddress ?? this.organizationAddress,
        organizationPhone: organizationPhone ?? this.organizationPhone,
        services: services ?? this.services,
        position: position ?? this.position,
        website: website ?? this.website,
        firstStepCompleted: firstStepCompleted ?? this.firstStepCompleted,
        registrationCompleted: registrationCompleted ?? this.registrationCompleted,
        isLoading: isLoading ?? this.isLoading,
        registrationStatus: registrationStatus ?? this.registrationStatus,
        registrationNumber: registrationNumber ?? this.registrationNumber,
        organizationEmail: organizationEmail ?? this.organizationEmail,
      );

  @override
  List<Object?> get props => [
        email,
        password,
        fullName,
        organizationName,
        organizationAddress,
        organizationPhone,
        services,
        position,
        firstStepCompleted,
        registrationCompleted,
        isLoading,
        registrationStatus,
        registrationNumber,
        organizationEmail,
      ];
}
