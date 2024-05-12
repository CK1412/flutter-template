import 'package:flutter/foundation.dart';

import '../../../../app/bloc/base/base_bloc.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends BaseBloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState()) {
    on<SignUpEvent>((event, emit) {});
  }
}
