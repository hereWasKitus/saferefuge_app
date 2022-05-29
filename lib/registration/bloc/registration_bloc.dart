import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(const RegistrationState()) {
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
    on<RegistrationWebsiteChanged>(_onRegistrationWebsiteChanged);
  }

  _onEmailChanged(RegistrationEmailChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(email: event.email));
  }

  _onPasswordChanged(RegistrationPasswordChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(password: event.password));
  }

  _onFullNameChanged(RegistrationFullNameChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(fullName: event.fullName));
  }

  _onOrganizationNameChanged(RegistrationOrganizationNameChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(organizationName: event.organizationName));
  }

  _onOrganizationAddressChanged(RegistrationOrganizationAddressChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(organizationAddress: event.organizationAddress));
  }

  _onOrganizationPhoneChanged(RegistrationOrganizationPhoneChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(organizationPhone: event.organizationPhone));
  }

  _onServicesChanged(RegistrationServicesChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(services: event.services));
  }

  _onPositionChanged(RegistrationPositionChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(position: event.position));
  }

  _onFirstStepCompleted(RegistrationFirstStepCompleted event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(firstStepCompleted: event.completed));
  }

  _onRegistrationCompleted(RegistrationCompleted event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(registrationCompleted: event.completed));
  }

  _onRegistrationLoading(RegistrationLoading event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  _onRegistrationWebsiteChanged(RegistrationWebsiteChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(website: event.website));
  }
}
