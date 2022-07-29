import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_repository/map_repository.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:safeway_api/safeway_api.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const RegistrationState()) {
    on<RegistrationPositionChanged>(_onPositionChanged);
    on<RegistrationRequestEvent>(_onRegistrationRequest);
    on<RegistrationFormChangedEvent>(_onRegistrationFormChanged);
    on<RegistrationBranchChanged>(_onBranchChanged);
    on<RegistrationOrganizationCreationRequest>(_onOrganizationCreationRequest);
    on<RegistrationGetOrganizationsList>(_onGetOrganizationsList);
    on<RegistrationEraseProgress>(_onEraseProgress);
  }

  final AuthRepository _authRepository;

  _onPositionChanged(RegistrationPositionChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(position: event.position));
  }

  _onBranchChanged(RegistrationBranchChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(branch: event.branch));
  }

  _onRegistrationRequest(RegistrationRequestEvent event, Emitter<RegistrationState> emit) async {
    emit(state.copyWith(registrationStatus: RegistrationStatus.loading, errorMessage: ''));

    try {
      await _authRepository.register(state.fullName, state.email, state.password);
      User user = await _authRepository.login(state.email, state.password);
      emit(state.copyWith(registrationStatus: RegistrationStatus.success, userID: user.id, errorMessage: ''));
    } on RegistrationFailure catch (e) {
      emit(state.copyWith(
          registrationStatus: RegistrationStatus.failed, errorMessage: 'Registration error: ${e.message}'));
      return;
    } on LoginFailure catch (e) {
      emit(state.copyWith(registrationStatus: RegistrationStatus.failed, errorMessage: 'Login error: ${e.message}'));
    } catch (e) {
      emit(state.copyWith(
          registrationStatus: RegistrationStatus.failed, errorMessage: 'Registration error: ${e.toString()}'));
    }
  }

  _onRegistrationFormChanged(RegistrationFormChangedEvent event, Emitter<RegistrationState> emit) {
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
      position: event.organizationPosition,
      services: event.services,
      positionInOrganization: event.positionInOrganization,
      website: event.website,
      organizationCountry: event.organizationCountry,
      organizationID: event.organizationID,
    ));
  }

  _onOrganizationCreationRequest(RegistrationOrganizationCreationRequest event, Emitter<RegistrationState> emit) async {
    try {
      emit(state.copyWith(organizationRegistrationStatus: NGORegistrationStatus.loading));

      await _authRepository.registerOrAssignToOrganization(
        username: state.email,
        name: state.organizationName,
        email: state.organizationEmail,
        phone: state.organizationPhone,
        address: state.organizationAddress,
        categories: state.services,
        formalID: state.organizationID,
        whatsapp: state.organizationWhatsapp,
        telegram: state.organizationTelegram,
        positionInOrganization: state.positionInOrganization,
        country: state.organizationCountry,
        website: state.website,
      );

      emit(state.copyWith(
        organizationRegistrationStatus: NGORegistrationStatus.success,
        errorMessage: '',
      ));
    } on APIException catch (e) {
      emit(state.copyWith(
        organizationRegistrationStatus: NGORegistrationStatus.failed,
        errorMessage: e.message,
      ));
    }
  }

  _onGetOrganizationsList(RegistrationGetOrganizationsList event, Emitter<RegistrationState> emit) async {
    emit(state.copyWith(isLoading: true));
    List<Organization> organizations = await _authRepository.getOrganizations();
    emit(state.copyWith(organizations: organizations, isLoading: false, organizationsLoaded: true));
  }

  _onEraseProgress(RegistrationEraseProgress event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(
      fullName: '',
      email: '',
      password: '',
      organizationName: '',
      organizationAddress: '',
      organizationPhone: '',
      registrationNumber: '',
      organizationEmail: '',
      organizationWhatsapp: '',
      organizationTelegram: '',
      position: const LatLng(0, 0),
      services: [],
      positionInOrganization: '',
      website: '',
      organizationCountry: '',
      organizationID: '',
      organizationRegistrationStatus: NGORegistrationStatus.initial,
      errorMessage: '',
      registrationStatus: RegistrationStatus.initial,
      firstStepCompleted: false,
      secondStepCompleted: false,
      organizationsLoaded: false,
    ));
  }
}
