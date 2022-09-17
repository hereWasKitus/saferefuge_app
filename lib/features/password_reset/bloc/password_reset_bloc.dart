import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:safeway_api/safeway_api.dart';

part 'password_reset_event.dart';
part 'password_reset_state.dart';

class PasswordResetBloc extends Bloc<PasswordResetEvent, PasswordResetState> {
  PasswordResetBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const PasswordResetState()) {
    on<PasswordResetEmailChanged>(_onEmailChanged);
    on<PasswordResetTokenChanged>(_onTokenChanged);
    on<PasswordResetPasswordChanged>(_onPasswordChanged);
    on<PasswordResetRequest>(_onPasswordResetRequest);
  }

  final AuthRepository _authRepository;

  void _onEmailChanged(PasswordResetEmailChanged event, Emitter<PasswordResetState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onTokenChanged(PasswordResetTokenChanged event, Emitter<PasswordResetState> emit) {
    emit(state.copyWith(token: event.token));
  }

  void _onPasswordChanged(PasswordResetPasswordChanged event, Emitter<PasswordResetState> emit) {
    emit(state.copyWith(password: event.password, confirmPassword: event.confirmPassword));
  }

  void _onPasswordResetRequest(PasswordResetRequest event, Emitter<PasswordResetState> emit) async {
    emit(state.copyWith(status: ResetStatus.loading, error: ''));

    try {
      await _authRepository.requestPasswordReset(
        email: state.email,
      );
    } on APIException catch (e) {
      emit(state.copyWith(status: ResetStatus.failure, error: e.message));
    } catch (e) {
      emit(state.copyWith(status: ResetStatus.failure, error: 'Server error'));
    }
  }
}
