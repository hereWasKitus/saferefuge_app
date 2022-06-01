import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const RegistrationState()) {
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
    on<RegistrationRequestEvent>(_onRegistrationRequest);
    on<RegistrationFormChangedEvent>(_onRegistrationFormChanged);
  }

  final AuthRepository _authRepository;

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

  _onRegistrationRequest(RegistrationRequestEvent event, Emitter<RegistrationState> emit) async {
    emit(state.copyWith(registrationStatus: RegistrationStatus.loading));

    var res = await _authRepository.register(event.fullName, event.email, event.password);
    RegistrationStatus status = res.success ? RegistrationStatus.success : RegistrationStatus.failed;

    emit(state.copyWith(registrationStatus: status));
  }

  _onRegistrationFormChanged(RegistrationFormChangedEvent event, Emitter<RegistrationState> emit) async {
    emit(state.copyWith(
      fullName: event.name,
      email: event.email,
      password: event.password,
      organizationName: event.organizationName,
      organizationAddress: event.organizationAddress,
      organizationPhone: event.organizationPhone,
      registrationNumber: event.registrationNumber,
      organizationEmail: event.organizationEmail,
      organizationWhatsapp: event.organizationWhatsapp,
      organizationTelegram: event.organizationTelegram,
      organizationPosition: event.organizationPosition,
      services: event.services,
    ));
  }
}
