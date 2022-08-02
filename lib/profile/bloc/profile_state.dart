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

enum AddBranchStatus {
  initial,
  loading,
  success,
  fail,
}

enum OnboardingUpdateStatus {
  initial,
  loading,
  success,
  fail,
}

// enum OnboardingStatus {
//   INITIAL,
//   ORGANIZATION_ASSIGNMENT,
//   BRANCH_REGISTRATION,
//   FINISHED,
// }

class ProfileState extends Equatable {
  const ProfileState({
    this.formChanged = false,
    this.id = '',
    this.name = '',
    this.email = '',
    this.username = '',
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
    this.branches = const <POI>[],
    this.authStatus = AuthStatus.unknown,
    this.isLoading = false,
    this.formStatus = FormStatus.initial,
    this.errorMessage = '',
    this.addBranchStatus = AddBranchStatus.initial,
    this.onboardingStatus = const {'INITIAL'},
    this.onboardingUpdateStatus = OnboardingUpdateStatus.initial,
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
  final List<POI> branches;
  final AuthStatus authStatus;
  final bool isLoading;
  final FormStatus formStatus;
  final String errorMessage;
  final String organizationCountry;
  final AddBranchStatus addBranchStatus;
  final Set<String> onboardingStatus;
  final OnboardingUpdateStatus onboardingUpdateStatus;
  final String username;

  bool get isOnboardingFinished => onboardingStatus.contains('FINISHED');

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
    List<POI>? branches,
    AuthStatus? authStatus,
    bool? isLoading,
    String? email,
    FormStatus? formStatus,
    String? errorMessage,
    String? organizationCountry,
    AddBranchStatus? addBranchStatus,
    Set<String>? onboardingStatus,
    OnboardingUpdateStatus? onboardingUpdateStatus,
    String? username,
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
        addBranchStatus: addBranchStatus ?? this.addBranchStatus,
        onboardingStatus: onboardingStatus ?? this.onboardingStatus,
        onboardingUpdateStatus: onboardingUpdateStatus ?? this.onboardingUpdateStatus,
        username: username ?? this.username,
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
        addBranchStatus,
        onboardingStatus,
        onboardingUpdateStatus,
        username,
      ];
}

class ProfileInitial extends ProfileState {}
