part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
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

class RegistrationSecondStepCompleted extends RegistrationEvent {
  final bool completed;

  const RegistrationSecondStepCompleted(this.completed);

  @override
  List<Object> get props => [completed];
}

class RegistrationCompleted extends RegistrationEvent {
  final bool completed;

  const RegistrationCompleted(this.completed);

  @override
  List<Object> get props => [completed];
}

class RegistrationRequestEvent extends RegistrationEvent {
  const RegistrationRequestEvent();

  @override
  List<Object> get props => [];
}

class RegistrationFormChangedEvent extends RegistrationEvent {
  final String? email;
  final String? password;
  final String? name;
  final String? organizationName;
  final String? organizationAddress;
  final String? organizationPhone;
  final String? registrationNumber;
  final String? organizationEmail;
  final String? organizationWhatsapp;
  final String? organizationTelegram;
  final LatLng? organizationPosition;
  final String? organizationID;
  final List<String>? services;
  final String? positionInOrganization;

  const RegistrationFormChangedEvent({
    this.email,
    this.password,
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
    this.organizationID,
    this.positionInOrganization,
  });
}

class RegistrationBranchChanged extends RegistrationEvent {
  final Branch branch;

  const RegistrationBranchChanged(this.branch);

  @override
  List<Object> get props => [branch];
}

class RegistrationOrganizationCreationRequest extends RegistrationEvent {
  const RegistrationOrganizationCreationRequest();

  @override
  List<Object> get props => [];
}

class RegistrationGetOrganizationsList extends RegistrationEvent {
  const RegistrationGetOrganizationsList();

  @override
  List<Object> get props => [];
}
