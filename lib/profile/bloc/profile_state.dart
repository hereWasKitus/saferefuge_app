part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.formChanged = false,
    this.name = '',
    this.organizationAddress = '',
    this.organizationEmail = '',
    this.organizationName = '',
    this.organizationPhone = '',
    this.organizationPosition = '',
    this.organizationTelegram = '',
    this.organizationWhatsapp = '',
    this.registrationNumber = '',
    this.services = const [],
    this.branches = const [],
    this.isAuthorized = false,
    this.token = '',
  });

  final bool formChanged;
  final String name;
  final String organizationName;
  final String organizationAddress;
  final String organizationPhone;
  final String registrationNumber;
  final String organizationEmail;
  final String organizationWhatsapp;
  final String organizationTelegram;
  final String organizationPosition;
  final List services;
  final List branches;
  final bool isAuthorized;
  final String token;

  ProfileState copyWith({
    bool? formChanged,
    String? name,
    String? organizationName,
    String? organizationAddress,
    String? organizationPhone,
    String? registrationNumber,
    String? organizationEmail,
    String? organizationWhatsapp,
    String? organizationTelegram,
    String? organizationPosition,
    List? services,
    List? branches,
    bool? isAuthorized,
    String? token,
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
        isAuthorized: isAuthorized ?? this.isAuthorized,
        token: token ?? this.token,
      );

  @override
  List<Object> get props => [
        formChanged,
        name,
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
        isAuthorized,
        token,
      ];
}

class ProfileInitial extends ProfileState {}
