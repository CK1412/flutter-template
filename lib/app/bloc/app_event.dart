part of 'app_bloc.dart';

@immutable
sealed class AppEvent extends BaseBlocEvent {}

final class LocaleUpdated extends AppEvent {
  final Locale value;

  LocaleUpdated(this.value);
}
