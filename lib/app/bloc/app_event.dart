part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class SetAppInitializedEvent extends AppEvent {
  final bool isInitialized;

  const SetAppInitializedEvent(this.isInitialized);

  @override
  List<Object> get props => [isInitialized];
}
