import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:map_repository/map_repository.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:safeway_api/safeway_api.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required authRepository,
    required profileRepository,
    required mapRepository,
  })  : _authRepository = authRepository,
        _profileRepository = profileRepository,
        _mapRepository = mapRepository,
        super(ProfileInitial()) {
    on<ProfileFormHasChangedEvent>(_onProfileFormIsChanged);
    on<ProfileFormChangedEvent>(_onProfileFormChanged);
    on<ProfileTryGetUser>(_onTryGetUser);
    on<ProfileUpdateRequest>(_onProfileUpdate);
    on<ProfileFormStatusChanged>(_onFormStatusChanged);
    on<ProfileAddBranchRequest>(_onAddBranchRequest);
    on<ProfileFetchBranchesRequest>(_onFetchBranchesRequest);
    on<ProfileUpdateBranchRequest>(_onUpdateBranchRequest);
    on<ProfileLogoutRequest>(_onLogoutRequest);
    on<ProfileUpdateOnboardingStatus>(_onOnboardingStatusUpdate);
  }

  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;
  final MapRepository _mapRepository;

  _onProfileFormIsChanged(ProfileFormHasChangedEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(formChanged: event.profileFormChanged));
  }

  _onProfileFormChanged(ProfileFormChangedEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(
      name: event.name,
      organizationName: event.organizationName,
      organizationAddress: event.organizationAddress,
      organizationPhone: event.organizationPhone,
      registrationNumber: event.registrationNumber,
      organizationEmail: event.organizationEmail,
      organizationWhatsapp: event.organizationWhatsapp,
      organizationTelegram: event.organizationTelegram,
      organizationPosition: event.organizationPosition,
      services: event.services,
      organizationCountry: event.organizationCountry,
    ));
  }

  _onTryGetUser(ProfileTryGetUser event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(isLoading: true));

    User user = await _authRepository.getCurrentUser();

    if (user.fullName.isEmpty) {
      emit(state.copyWith(
        authStatus: AuthStatus.unauthorized,
        isLoading: false,
      ));
    } else {
      emit(state.copyWith(
        authStatus: AuthStatus.authorized,
        name: user.fullName,
        email: user.username,
        id: user.id,
        organizationName: user.org?.name,
        organizationAddress: user.org?.address,
        organizationEmail: user.org?.email,
        organizationPhone: user.org?.phone,
        organizationCountry: user.org?.country,
        organizationPosition: user.positionInOrganization,
        onboardingStatus: user.onboardingStatus,
        services: user.org?.categories,
        isLoading: false,
      ));
    }
  }

  _onProfileUpdate(ProfileUpdateRequest event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading, errorMessage: ''));

    try {
      await _profileRepository.updateProfile(
        userEmail: state.email,
        userFullName: state.name,
        organizationPosition: state.organizationPosition,
      );
      emit(state.copyWith(formStatus: FormStatus.updateSucceed));
    } on APIException catch (e) {
      emit(state.copyWith(formStatus: FormStatus.updateFail, errorMessage: e.message));
    }
  }

  _onFormStatusChanged(ProfileFormStatusChanged event, Emitter<ProfileState> emit) {
    emit(state.copyWith(formStatus: event.status));
  }

  _onAddBranchRequest(ProfileAddBranchRequest event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(addBranchStatus: AddBranchStatus.loading, errorMessage: ''));

    try {
      await _mapRepository.createPOI(event.branch.toMap());
      emit(state.copyWith(addBranchStatus: AddBranchStatus.success, errorMessage: ''));
    } on APIException catch (e) {
      emit(state.copyWith(addBranchStatus: AddBranchStatus.fail, errorMessage: e.message));
    }
  }

  _onFetchBranchesRequest(ProfileFetchBranchesRequest event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(addBranchStatus: AddBranchStatus.loading, errorMessage: ''));

    try {
      List<POI> branches = await _mapRepository.getPOIsByUsername(state.email);
      emit(state.copyWith(
        branches: branches,
        addBranchStatus: AddBranchStatus.success,
      ));
    } on APIException catch (e) {
      emit(state.copyWith(addBranchStatus: AddBranchStatus.fail, errorMessage: e.message));
    }
  }

  _onUpdateBranchRequest(ProfileUpdateBranchRequest event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(addBranchStatus: AddBranchStatus.loading, errorMessage: ''));

    try {
      await _mapRepository.updatePOI(event.branch.toMap());
      emit(state.copyWith(
        addBranchStatus: AddBranchStatus.success,
      ));
    } on APIException catch (e) {
      emit(state.copyWith(addBranchStatus: AddBranchStatus.fail, errorMessage: e.message));
    }
  }

  _onLogoutRequest(ProfileLogoutRequest event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading, errorMessage: ''));

    await _authRepository.logout();

    emit(state.copyWith(
      name: '',
      id: '',
      organizationName: '',
      organizationAddress: '',
      organizationEmail: '',
      organizationPhone: '',
      organizationCountry: '',
      services: [],
      branches: [],
      addBranchStatus: AddBranchStatus.initial,
      formStatus: FormStatus.initial,
      organizationPosition: '',
      organizationWhatsapp: '',
      organizationTelegram: '',
      authStatus: AuthStatus.unauthorized,
      isLoading: false,
      onboardingStatus: {'INITIAL'},
    ));
  }

  _onOnboardingStatusUpdate(ProfileUpdateOnboardingStatus event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(onboardingUpdateStatus: OnboardingUpdateStatus.loading, errorMessage: ''));

    try {
      Set<String> newStatus = {...state.onboardingStatus, event.status};
      await _profileRepository.updateProfile(onboardingStatus: newStatus.toList());
      emit(state.copyWith(
        onboardingUpdateStatus: OnboardingUpdateStatus.success,
        onboardingStatus: newStatus,
      ));
    } on APIException catch (e) {
      emit(state.copyWith(
        onboardingUpdateStatus: OnboardingUpdateStatus.fail,
        errorMessage: e.message,
      ));
    }
  }
}
