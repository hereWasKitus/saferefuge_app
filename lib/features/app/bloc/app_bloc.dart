import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:app_repository/app_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:protect_ua_women/features/app/app.dart';
import 'package:safeway_api/safeway_api.dart';
import 'package:stream_transform/stream_transform.dart';
part 'app_bloc.freezed.dart';

part 'app_event.dart';
part 'app_state.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AppRepository appRepository})
      : _appRepository = appRepository,
        super(const AppState()) {
    on<LoadCategories>(_loadCategories);
    on<ChangeSelectedCategoriesIDs>(_selectedCategoriesIDsChange);
    on<LoadPOIsByCurrentLocation>(
      _loadPOIsByCurrentLocation,
      transformer: throttleDroppable(const Duration(milliseconds: 100)),
    );
  }

  final AppRepository _appRepository;

  void _loadCategories(LoadCategories event, Emitter<AppState> emit) async {
    emit(state.copyWith(categoriesStatus: CategoriesStatus.loading));

    List<POICategory> categories = await _appRepository.fetchCategories();

    emit(state.copyWith(
      categories: categories,
      categoriesStatus: CategoriesStatus.success,
    ));
  }

  void _selectedCategoriesIDsChange(
    ChangeSelectedCategoriesIDs event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(selectedCategoriesIDs: event.ids));
  }

  void _loadPOIsByCurrentLocation(
    LoadPOIsByCurrentLocation event,
    Emitter<AppState> emit,
  ) async {
    print('let\'s rock');
    if (state.locationPermissionStatus == LocationPermissionStatus.initial) {
      emit(
        state.copyWith(
          locationPermissionStatus: LocationPermissionStatus.loading,
          errorMessage: '',
        ),
      );

      try {
        await LocationService.askForAllowance();
        emit(
          state.copyWith(
            locationPermissionStatus: LocationPermissionStatus.granted,
          ),
        );
      } catch (e) {
        emit(state.copyWith(
            locationPermissionStatus: LocationPermissionStatus.denied,
            errorMessage: e.toString()));
        return;
      }
    }

    emit(state.copyWith(poisStatus: POIsStatus.loading));
    final Position position = await LocationService.getCurrentPosition();

    try {
      final List<POI> pois = await _appRepository.fetchPOIs(
        longitude: position.longitude,
        latitude: position.latitude,
        maxDistance: event.maxDistance,
        skip: event.skip,
        mode: 'full',
      );
      emit(state.copyWith(
        poisStatus: POIsStatus.success,
        pois: [...state.pois, ...pois],
      ));

      // if (pois.isEmpty && state.poisReachedMaximum == false) {
      //   emit(state.copyWith(poisReachedMaximum: true));
      // }
    } catch (e) {
      debugger(when: true);
      emit(state.copyWith(poisStatus: POIsStatus.failure));
    }
  }
}
