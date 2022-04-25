part of 'registrationform_bloc.dart';

abstract class RegistrationFormEvent extends Equatable {
  const RegistrationFormEvent();

  @override
  List<Object> get props => [];
}

class RegistrationEmailChanged extends RegistrationFormEvent {
  final String email;

  const RegistrationEmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class RegistrationPasswordChanged extends RegistrationFormEvent {
  final String password;

  const RegistrationPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class RegistrationFullNameChanged extends RegistrationFormEvent {
  final String fullName;

  const RegistrationFullNameChanged(this.fullName);

  @override
  List<Object> get props => [fullName];
}

class RegistrationOrganizationNameChanged extends RegistrationFormEvent {
  final String organizationName;

  const RegistrationOrganizationNameChanged(this.organizationName);

  @override
  List<Object> get props => [organizationName];
}

class RegistrationOrganizationAddressChanged extends RegistrationFormEvent {
  final String organizationAddress;

  const RegistrationOrganizationAddressChanged(this.organizationAddress);

  @override
  List<Object> get props => [organizationAddress];
}

class RegistrationOrganizationPhoneChanged extends RegistrationFormEvent {
  final String organizationPhone;

  const RegistrationOrganizationPhoneChanged(this.organizationPhone);

  @override
  List<Object> get props => [organizationPhone];
}

class RegistrationServicesChanged extends RegistrationFormEvent {
  final List<String> services;

  const RegistrationServicesChanged(this.services);

  @override
  List<Object> get props => [services];
}

class RegistrationPositionChanged extends RegistrationFormEvent {
  final LatLng position;

  const RegistrationPositionChanged(this.position);

  @override
  List<Object> get props => [position];
}

class RegistrationFirstStepCompleted extends RegistrationFormEvent {
  final bool completed;

  const RegistrationFirstStepCompleted(this.completed);

  @override
  List<Object> get props => [completed];
}

class RegistrationCompleted extends RegistrationFormEvent {
  final bool completed;

  const RegistrationCompleted(this.completed);

  @override
  List<Object> get props => [completed];
}

class RegistrationLoading extends RegistrationFormEvent {
  final bool isLoading;

  const RegistrationLoading(this.isLoading);

  @override
  List<Object> get props => [isLoading];
}
