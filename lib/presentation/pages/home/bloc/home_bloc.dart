import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/bloc/bloc_status.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<InitialData>(_onInitialData);
    on<CountIncreased>(_onCountIncreased, transformer: droppable());
    on<TabIndexChanged>(_onTabIndexChanged);
  }

  FutureOr<void> _onInitialData(
    InitialData event,
    Emitter<HomeState> emit,
  ) {
    // init data state
    emit(state.copyWith(tabIndex: event.tabIndex));
  }

  FutureOr<void> _onCountIncreased(
    CountIncreased event,
    Emitter<HomeState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(count: state.count + 1));
  }

  FutureOr<void> _onTabIndexChanged(
    TabIndexChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(tabIndex: event.value));
  }
}
