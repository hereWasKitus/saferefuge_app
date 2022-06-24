import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required authRepository})
      : _authRepository = authRepository,
        super(ProfileInitial()) {
    on<ProfileFormHasChangedEvent>(_onProfileFormIsChanged);
    on<ProfileFormChangedEvent>(_onProfileFormChanged);
    on<ProfileTryGetUser>(_onTryGetUser);
    on<ProfileUpdateRequest>(_onSaveForm);
    on<ProfileFormStatusChanged>(_onFormStatusChanged);
  }

  final AuthRepository _authRepository;

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
        services: user.org?.categories,
        isLoading: false,
      ));
    }
  }

  _onSaveForm(ProfileUpdateRequest event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading, errorMessage: ''));

    try {
      await _authRepository.updateProfile(
        userID: state.id,
        userEmail: state.email,
        userFullName: state.name,
        organizationName: state.organizationName,
        organizationEmail: state.organizationEmail,
        organizationPhone: state.organizationPhone,
      );
      emit(state.copyWith(formStatus: FormStatus.updateSucceed));
    } on APIException catch (e) {
      emit(state.copyWith(formStatus: FormStatus.updateFail, errorMessage: e.message));
    }
  }

  _onFormStatusChanged(ProfileFormStatusChanged event, Emitter<ProfileState> emit) {
    emit(state.copyWith(formStatus: event.status));
  }
}
