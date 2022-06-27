part of 'profile_bloc.dart';

enum AuthStatus {
  unknown,
  authorized,
  unauthorized,
}

enum FormStatus {
  initial,
  changed,
  loading,
  updateFail,
  updateSucceed,
}

class ProfileState extends Equatable {
  const ProfileState({
    this.formChanged = false,
    this.id = '',
    this.name = '',
    this.email = '',
    this.organizationAddress = '',
    this.organizationEmail = '',
    this.organizationName = '',
    this.organizationPhone = '',
    this.organizationPosition = '',
    this.organizationTelegram = '',
    this.organizationWhatsapp = '',
    this.registrationNumber = '',
    this.organizationCountry = '',
    this.services = const <String>[],
    this.branches = const [],
    this.authStatus = AuthStatus.unknown,
    this.isLoading = false,
    this.formStatus = FormStatus.initial,
    this.errorMessage = '',
  });

  final bool formChanged;
  final String name;
  final String id;
  final String email;
  final String organizationName;
  final String organizationAddress;
  final String organizationPhone;
  final String registrationNumber;
  final String organizationEmail;
  final String organizationWhatsapp;
  final String organizationTelegram;
  final String organizationPosition;
  final List<String> services;
  final List branches;
  final AuthStatus authStatus;
  final bool isLoading;
  final FormStatus formStatus;
  final String errorMessage;
  final String organizationCountry;

  ProfileState copyWith({
    bool? formChanged,
    String? name,
    String? id,
    String? organizationName,
    String? organizationAddress,
    String? organizationPhone,
    String? registrationNumber,
    String? organizationEmail,
    String? organizationWhatsapp,
    String? organizationTelegram,
    String? organizationPosition,
    List<String>? services,
    List? branches,
    AuthStatus? authStatus,
    bool? isLoading,
    String? email,
    FormStatus? formStatus,
    String? errorMessage,
    String? organizationCountry,
  }) =>
      ProfileState(
        formChanged: formChanged ?? this.formChanged,
        name: name ?? this.name,
        organizationName: organizationName ?? this.organizationName,
        organizationAddress: organizationAddress ?? this.organizationAddress,
        organizationPhone: organizationPhone ?? this.organizationPhone,
        registrationNumber: registrationNumber ?? this.registrationNumber,
        organizationEmail: organizationEmail ?? this.organizationEmail,
        organizationWhatsapp: organizationWhatsapp ?? this.organizationWhatsapp,
        organizationTelegram: organizationTelegram ?? this.organizationTelegram,
        organizationPosition: organizationPosition ?? this.organizationPosition,
        services: services ?? this.services,
        branches: branches ?? this.branches,
        authStatus: authStatus ?? this.authStatus,
        id: id ?? this.id,
        isLoading: isLoading ?? this.isLoading,
        email: email ?? this.email,
        formStatus: formStatus ?? this.formStatus,
        errorMessage: errorMessage ?? this.errorMessage,
        organizationCountry: organizationCountry ?? this.organizationCountry,
      );

  @override
  List<Object> get props => [
        formChanged,
        name,
        email,
        organizationName,
        organizationAddress,
        organizationPhone,
        registrationNumber,
        organizationEmail,
        organizationWhatsapp,
        organizationTelegram,
        organizationPosition,
        services,
        branches,
        authStatus,
        id,
        isLoading,
        formStatus,
        errorMessage,
        organizationCountry,
      ];
}

class ProfileInitial extends ProfileState {}
