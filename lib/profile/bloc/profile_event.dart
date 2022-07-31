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

class ProfileAddBranchRequest extends ProfileEvent {
  final POI branch;

  const ProfileAddBranchRequest(this.branch);

  @override
  List<Object> get props => [branch];
}

class ProfileFetchBranchesRequest extends ProfileEvent {
  const ProfileFetchBranchesRequest();

  @override
  List<Object> get props => [];
}

class ProfileUpdateBranchRequest extends ProfileEvent {
  final POI branch;

  const ProfileUpdateBranchRequest(this.branch);

  @override
  List<Object> get props => [branch];
}

class ProfileLogoutRequest extends ProfileEvent {
  const ProfileLogoutRequest();

  @override
  List<Object> get props => [];
}

class ProfileUpdateOnboardingStatus extends ProfileEvent {
  final String status;

  const ProfileUpdateOnboardingStatus(this.status);

  @override
  List<Object> get props => [status];
}

class ProfileEmailChanged extends ProfileEvent {
  final String email;

  const ProfileEmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class ProfilePasswordChanged extends ProfileEvent {
  final String password;

  const ProfilePasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}
