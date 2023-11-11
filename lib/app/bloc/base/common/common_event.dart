part of 'common_bloc.dart';

@immutable
abstract class CommonEvent extends BaseBlocEvent {}

class LoadingVisibilityEmitted extends CommonEvent {
  final bool isLoading;

  LoadingVisibilityEmitted({required this.isLoading});
}

class ExceptionEmitted extends CommonEvent {
  final AppExceptionWrapper appExceptionWrapper;

  ExceptionEmitted(this.appExceptionWrapper);
}

class BlocMessageEmitted extends CommonEvent {
  final BlocMessage blocMessage;

  BlocMessageEmitted(this.blocMessage);
}
