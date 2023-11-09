part of 'common_bloc.dart';

@immutable
abstract class CommonEvent extends BaseBlocEvent {}

class LoadingVisibilityEmitted extends CommonEvent {
  final bool isLoading;

  LoadingVisibilityEmitted({required this.isLoading});
}

class ExceptionEmitted extends CommonEvent {
  final AppException exception;

  ExceptionEmitted(this.exception);
}
