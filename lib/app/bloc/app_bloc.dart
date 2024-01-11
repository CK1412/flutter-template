import 'package:meta/meta.dart';

import 'base/base_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends BaseBloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<AppEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
