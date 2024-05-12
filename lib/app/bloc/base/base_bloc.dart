import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/exceptions/app_exception.dart';
import '../../../shared/exceptions/app_exception_wrapper.dart';
import '../../../shared/extensions/number_extension.dart';
import '../../../shared/logger/logger.dart';
import '../../../shared/useful/helpers.dart';
import 'bloc_message.dart';
import 'common/common_bloc.dart';

part 'base_bloc_event.dart';

part 'base_bloc_state.dart';

abstract class BaseBloc<E extends BaseBlocEvent, S extends BaseBlocState>
    extends BaseBlocDelegate<E, S> {
  BaseBloc(super.initialState);
}

abstract class BaseBlocDelegate<E extends BaseBlocEvent,
    S extends BaseBlocState> extends Bloc<E, S> {
  BaseBlocDelegate(super.initialState);

  late final CommonBloc _commonBloc;

  set commonBloc(CommonBloc commonBloc) {
    _commonBloc = commonBloc;
  }

  CommonBloc get commonBloc =>
      this is CommonBloc ? this as CommonBloc : _commonBloc;

  @override
  void add(E event) {
    if (!isClosed) {
      super.add(event);
    } else {
      logger.w('Cannot add new event $event because $runtimeType was closed');
    }
  }

  void showLoading() {
    commonBloc.add(LoadingVisibilityEmitted(isLoading: true));
  }

  void hideLoading() {
    commonBloc.add(LoadingVisibilityEmitted(isLoading: false));
  }

  void catchException(AppExceptionWrapper appExceptionWrapper) {
    commonBloc.add(ExceptionEmitted(appExceptionWrapper));
  }

  void showMessage(String message) {
    commonBloc.add(BlocMessageEmitted(BlocMessage(message)));
  }

  Future<void> handleBlocTask<T>({
    required FutureOr<T?> Function() action,
    required Function(T data) onSuccess,
    bool automaticallyHandleLoading = true,
    bool automaticallyHandleError = true,
    bool automaticallyHandleRetry = true,
    int? maxRetries,
    String? overrideErrorMessage,
    ExceptionDisplayStyle errorDisplayStyle = ExceptionDisplayStyle.toast,
    FutureOr<void> Function()? whenComplete,
    Function(AppException appException)? onError,
    FutureOr<void> Function()? onRetry,
    FutureOr<void> Function()? whenDataNull,
  }) async {
    assert(maxRetries == null || maxRetries > 0, 'maxRetries must be positive');

    if (automaticallyHandleLoading) {
      showLoading();
    }

    await handleRequest<T>(
      request: action,
      onSuccess: (data) {
        if (automaticallyHandleLoading) {
          hideLoading();
        }
        onSuccess.call(data);
      },
      whenDataNull: () {
        if (automaticallyHandleLoading) {
          hideLoading();
        }
        whenDataNull?.call();
      },
      onError: (appException) {
        if (automaticallyHandleLoading) {
          hideLoading();
        }

        if (onError != null) {
          onError.call(appException);
        } else {
          if (automaticallyHandleError) {
            catchException(
              AppExceptionWrapper(
                appException,
                overrideMessage: overrideErrorMessage,
                displayStyle: errorDisplayStyle,
                onRetry: onRetry ??
                    ((automaticallyHandleRetry && maxRetries != 1)
                        ? () async {
                            await handleBlocTask<T>(
                              action: action,
                              automaticallyHandleLoading:
                                  automaticallyHandleLoading,
                              automaticallyHandleError:
                                  automaticallyHandleError,
                              automaticallyHandleRetry:
                                  automaticallyHandleRetry,
                              onError: onError,
                              whenComplete: whenComplete,
                              maxRetries: maxRetries?.minus(1),
                              onSuccess: onSuccess,
                              onRetry: onRetry,
                              errorDisplayStyle: errorDisplayStyle,
                              overrideErrorMessage: overrideErrorMessage,
                              whenDataNull: whenDataNull,
                            );
                          }
                        : null),
              ),
            );
          }
        }
      },
      whenComplete: whenComplete,
    );
  }
}
