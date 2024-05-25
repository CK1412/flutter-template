part of 'app_bloc.dart';

@immutable
sealed class AppEvent extends BaseBlocEvent {}

final class LocaleUpdated extends AppEvent {
  final Locale value;

  LocaleUpdated(this.value);
}

final class ThemeModeUpdated extends AppEvent {
  final ThemeMode value;

  ThemeModeUpdated(this.value);
}
