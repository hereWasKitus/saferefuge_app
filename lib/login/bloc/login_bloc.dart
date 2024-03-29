import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginInitial()) {
    on<LoginEmailChangedEvent>(_onEmailChange);
    on<LoginPasswordChangedEvent>(_onPasswordChange);
    on<LoginRequestEvent>(_onLoginRequest);
  }

  final AuthRepository _authRepository;

  _onEmailChange(LoginEmailChangedEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(emailField: event.value));
  }

  _onPasswordChange(LoginPasswordChangedEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(passwordField: event.value));
  }

  _onLoginRequest(LoginRequestEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));

    try {
      User user = await _authRepository.login(event.email, event.password);
      emit(state.copyWith(loginStatus: LoginStatus.success, user: user, errorMessage: ''));
    } on LoginFailure catch (e) {
      emit(state.copyWith(loginStatus: LoginStatus.failed, errorMessage: e.message));
    }
  }
}
