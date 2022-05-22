import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileFormHasChangedEvent>(_onProfileFormIsChanged);
    on<ProfileFormChangedEvent>(_onProfileFormChanged);
  }

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
}
