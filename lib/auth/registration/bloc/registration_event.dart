part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationEmailChanged extends RegistrationEvent {
  final String email;

  const RegistrationEmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class RegistrationPasswordChanged extends RegistrationEvent {
  final String password;

  const RegistrationPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class RegistrationFullNameChanged extends RegistrationEvent {
  final String fullName;

  const RegistrationFullNameChanged(this.fullName);

  @override
  List<Object> get props => [fullName];
}

class RegistrationOrganizationNameChanged extends RegistrationEvent {
  final String organizationName;

  const RegistrationOrganizationNameChanged(this.organizationName);

  @override
  List<Object> get props => [organizationName];
}

class RegistrationOrganizationAddressChanged extends RegistrationEvent {
  final String organizationAddress;

  const RegistrationOrganizationAddressChanged(this.organizationAddress);

  @override
  List<Object> get props => [organizationAddress];
}

class RegistrationOrganizationPhoneChanged extends RegistrationEvent {
  final String organizationPhone;

  const RegistrationOrganizationPhoneChanged(this.organizationPhone);

  @override
  List<Object> get props => [organizationPhone];
}

class RegistrationServicesChanged extends RegistrationEvent {
  final List<String> services;

  const RegistrationServicesChanged(this.services);

  @override
  List<Object> get props => [services];
}

class RegistrationPositionChanged extends RegistrationEvent {
  final LatLng position;

  const RegistrationPositionChanged(this.position);

  @override
  List<Object> get props => [position];
}

class RegistrationFirstStepCompleted extends RegistrationEvent {
  final bool completed;

  const RegistrationFirstStepCompleted(this.completed);

  @override
  List<Object> get props => [completed];
}

class RegistrationCompleted extends RegistrationEvent {
  final bool completed;

  const RegistrationCompleted(this.completed);

  @override
  List<Object> get props => [completed];
}

class RegistrationLoading extends RegistrationEvent {
  final bool isLoading;

  const RegistrationLoading(this.isLoading);

  @override
  List<Object> get props => [isLoading];
}

class RegistrationWebsiteChanged extends RegistrationEvent {
  final String website;

  const RegistrationWebsiteChanged(this.website);

  @override
  List<Object> get props => [website];
}
