import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'registrationform_event.dart';
part 'registrationform_state.dart';

class RegistrationFormBloc extends Bloc<RegistrationFormEvent, RegistrationFormState> {
  RegistrationFormBloc() : super(const RegistrationFormState()) {
    on<RegistrationEmailChanged>(_onEmailChanged);
    on<RegistrationPasswordChanged>(_onPasswordChanged);
    on<RegistrationFullNameChanged>(_onFullNameChanged);
    on<RegistrationOrganizationNameChanged>(_onOrganizationNameChanged);
    on<RegistrationOrganizationAddressChanged>(_onOrganizationAddressChanged);
    on<RegistrationOrganizationPhoneChanged>(_onOrganizationPhoneChanged);
    on<RegistrationServicesChanged>(_onServicesChanged);
    on<RegistrationPositionChanged>(_onPositionChanged);
    on<RegistrationFirstStepCompleted>(_onFirstStepCompleted);
    on<RegistrationCompleted>(_onRegistrationCompleted);
    on<RegistrationLoading>(_onRegistrationLoading);
  }

  _onEmailChanged(RegistrationEmailChanged event, Emitter<RegistrationFormState> emit) {
    emit(state.copyWith(email: event.email));
  }

  _onPasswordChanged(RegistrationPasswordChanged event, Emitter<RegistrationFormState> emit) {
    emit(state.copyWith(password: event.password));
  }

  _onFullNameChanged(RegistrationFullNameChanged event, Emitter<RegistrationFormState> emit) {
    emit(state.copyWith(fullName: event.fullName));
  }

  _onOrganizationNameChanged(RegistrationOrganizationNameChanged event, Emitter<RegistrationFormState> emit) {
    emit(state.copyWith(organizationName: event.organizationName));
  }

  _onOrganizationAddressChanged(RegistrationOrganizationAddressChanged event, Emitter<RegistrationFormState> emit) {
    emit(state.copyWith(organizationAddress: event.organizationAddress));
  }

  _onOrganizationPhoneChanged(RegistrationOrganizationPhoneChanged event, Emitter<RegistrationFormState> emit) {
    emit(state.copyWith(organizationPhone: event.organizationPhone));
  }

  _onServicesChanged(RegistrationServicesChanged event, Emitter<RegistrationFormState> emit) {
    emit(state.copyWith(services: event.services));
  }

  _onPositionChanged(RegistrationPositionChanged event, Emitter<RegistrationFormState> emit) {
    emit(state.copyWith(position: event.position));
  }

  _onFirstStepCompleted(RegistrationFirstStepCompleted event, Emitter<RegistrationFormState> emit) {
    emit(state.copyWith(firstStepCompleted: event.completed));
  }

  _onRegistrationCompleted(RegistrationCompleted event, Emitter<RegistrationFormState> emit) {
    emit(state.copyWith(registrationCompleted: event.completed));
  }

  _onRegistrationLoading(RegistrationLoading event, Emitter<RegistrationFormState> emit) {
    emit(state.copyWith(isLoading: event.isLoading));
  }
}
