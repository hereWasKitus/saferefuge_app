part of 'app_bloc.dart';

class AppState extends Equatable {
  final bool isInitialized;
  final bool isLoading;

  const AppState({
    this.isInitialized = false,
    this.isLoading = false,
  });

  AppState copyWith({
    bool? isInitialized,
    bool? isLoading,
  }) =>
      AppState(
        isInitialized: isInitialized ?? this.isInitialized,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object> get props => [isInitialized, isLoading];
}
