part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileFormHasChangedEvent extends ProfileEvent {
  final bool profileFormChanged;

  const ProfileFormHasChangedEvent(this.profileFormChanged);

  @override
  List<Object> get props => [profileFormChanged];
}

class ProfileFormChangedEvent extends ProfileEvent {
  final String? name;
  final String? organizationName;
  final String? organizationAddress;
  final String? organizationPhone;
  final String? registrationNumber;
  final String? organizationEmail;
  final String? organizationWhatsapp;
  final String? organizationTelegram;
  final String? organizationPosition;
  final List? services;

  const ProfileFormChangedEvent({
    this.name,
    this.organizationAddress,
    this.organizationEmail,
    this.organizationName,
    this.organizationPhone,
    this.organizationPosition,
    this.organizationTelegram,
    this.organizationWhatsapp,
    this.registrationNumber,
    this.services,
  });
}

// class ProfileNameChangedEvent extends ProfileEvent {
//   final String name;

//   const ProfileNameChangedEvent({required this.name});

//   @override
//   List<Object> get props => [name];
// }

// class ProfileOrganizationNameChangedEvent extends ProfileEvent {
//   final String organizationName;

//   const ProfileOrganizationNameChangedEvent({required this.organizationName});

//   @override
//   List<Object> get props => [organizationName];
// }

// class ProfileOrganizationAddressChangedEvent extends ProfileEvent {
//   final String organizationAddress;

//   const ProfileOrganizationAddressChangedEvent({required this.organizationAddress});

//   @override
//   List<Object> get props => [organizationAddress];
// }

// class ProfileOrganizationPhoneChangedEvent extends ProfileEvent {
//   final String organizationPhone;

//   const ProfileOrganizationPhoneChangedEvent({required this.organizationPhone});

//   @override
//   List<Object> get props => [organizationPhone];
// }

// class ProfileOrganizationServicesChangedEvent extends ProfileEvent {
//   final List services;

//   const ProfileOrganizationServicesChangedEvent({required this.services});

//   @override
//   List<Object> get props => [services];
// }

// class ProfileOrganizationEmailChangedEvent extends ProfileEvent {
//   final String organizationEmail;

//   const ProfileOrganizationEmailChangedEvent({required this.organizationEmail});

//   @override
//   List<Object> get props => [organizationEmail];
// }

// class ProfileOrganizationWhatsappChangedEvent extends ProfileEvent {
//   final String organizationWhatsapp;

//   const ProfileOrganizationWhatsappChangedEvent({required this.organizationWhatsapp});

//   @override
//   List<Object> get props => [organizationWhatsapp];
// }

// class ProfileOrganizationTelegramChangedEvent extends ProfileEvent {
//   final String organizationTelegram;

//   const ProfileOrganizationTelegramChangedEvent({required this.organizationTelegram});

//   @override
//   List<Object> get props => [organizationTelegram];
// }

// class ProfileOrganizationPositionChangedEvent extends ProfileEvent {
//   final String organizationPosition;

//   const ProfileOrganizationPositionChangedEvent({required this.organizationPosition});

//   @override
//   List<Object> get props => [organizationPosition];
// }
