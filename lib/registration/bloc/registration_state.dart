part of 'registration_bloc.dart';

enum RegistrationStatus {
  initial,
  failed,
  success,
  loading,
}

enum NGORegistrationStatus {
  initial,
  failed,
  success,
  loading,
}

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
    this.website = '',
    this.firstStepCompleted = false,
    this.secondStepCompleted = false,
    this.registrationCompleted = false,
    this.isLoading = false,
    this.registrationNumber = '',
    this.organizationEmail = '',
    this.organizationID = '',
    this.registrationStatus = RegistrationStatus.initial,
    this.organizationRegistrationStatus = NGORegistrationStatus.initial,
    this.errorMessage = '',
    this.branch = const POI(),
    this.organizationTelegram = '',
    this.organizationWhatsapp = '',
    this.positionInOrganization = '',
    this.userID = '',
    this.organizations = const [],
    this.organizationsLoaded = false,
    this.organizationCountry = '',
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
  final String website;
  final bool firstStepCompleted;
  final bool secondStepCompleted;
  final bool registrationCompleted;
  final bool isLoading;
  final RegistrationStatus registrationStatus;
  final NGORegistrationStatus organizationRegistrationStatus;
  final String errorMessage;
  final String organizationID;
  final POI branch;
  final String organizationWhatsapp;
  final String organizationTelegram;
  final String positionInOrganization;
  final String userID;
  final List<Organization> organizations;
  final bool organizationsLoaded;
  final String organizationCountry;

  // isFilled(String? value) => value != null || value!.isNotEmpty;

  bool get isEmailValid {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  bool get isNGOEmailValid {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(organizationEmail);
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
    bool? secondStepCompleted,
    bool? registrationCompleted,
    bool? isLoading,
    RegistrationStatus? registrationStatus,
    NGORegistrationStatus? organizationRegistrationStatus,
    String? errorMessage,
    String? organizationID,
    POI? branch,
    String? organizationTelegram,
    String? organizationWhatsapp,
    String? positionInOrganization,
    String? userID,
    List<Organization>? organizations,
    bool? organizationsLoaded,
    String? organizationCountry,
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
        secondStepCompleted: secondStepCompleted ?? this.secondStepCompleted,
        registrationCompleted: registrationCompleted ?? this.registrationCompleted,
        isLoading: isLoading ?? this.isLoading,
        registrationStatus: registrationStatus ?? this.registrationStatus,
        registrationNumber: registrationNumber ?? this.registrationNumber,
        organizationEmail: organizationEmail ?? this.organizationEmail,
        errorMessage: errorMessage ?? this.errorMessage,
        organizationID: organizationID ?? this.organizationID,
        branch: branch ?? this.branch,
        organizationTelegram: organizationTelegram ?? this.organizationTelegram,
        organizationWhatsapp: organizationWhatsapp ?? this.organizationWhatsapp,
        positionInOrganization: positionInOrganization ?? this.positionInOrganization,
        organizationRegistrationStatus: organizationRegistrationStatus ?? this.organizationRegistrationStatus,
        userID: userID ?? this.userID,
        organizations: organizations ?? this.organizations,
        organizationsLoaded: organizationsLoaded ?? this.organizationsLoaded,
        organizationCountry: organizationCountry ?? this.organizationCountry,
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
        errorMessage,
        secondStepCompleted,
        organizationID,
        branch,
        organizationWhatsapp,
        organizationTelegram,
        positionInOrganization,
        organizations,
        organizationsLoaded,
        organizationCountry,
      ];
}
