import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../shared/constants/locales.dart';
import '../../shared/converters/locale_json_converter.dart';
import 'base/base_bloc.dart';

part 'app_event.dart';

part 'app_state.dart';

part 'app_bloc.g.dart';

@singleton
class AppBloc extends BaseBloc<AppEvent, AppState>
    with HydratedMixin<AppState> {
  AppBloc() : super(const AppState()) {
    hydrate();
    on<LocaleUpdated>(_onLocaleUpdated);
  }

  @override
  AppState? fromJson(Map<String, dynamic> json) => AppState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(AppState state) => state.toJson();

  FutureOr<void> _onLocaleUpdated(
    LocaleUpdated event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(locale: event.value));
  }
}
