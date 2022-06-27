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
  final List<String>? services;
  final String? organizationCountry;

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
    this.organizationCountry,
  });
}

class ProfileTryGetUser extends ProfileEvent {
  const ProfileTryGetUser();

  @override
  List<Object> get props => [];
}

class ProfileUpdateRequest extends ProfileEvent {
  const ProfileUpdateRequest();

  @override
  List<Object> get props => [];
}

class ProfileFormStatusChanged extends ProfileEvent {
  final FormStatus status;

  const ProfileFormStatusChanged(this.status);

  @override
  List<Object> get props => [status];
}
