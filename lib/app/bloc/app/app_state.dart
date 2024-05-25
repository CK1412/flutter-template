part of 'app_bloc.dart';

@JsonSerializable()
class AppState extends BaseBlocState {
  /// Locale used in App
  @LocaleJsonConverter()
  final Locale locale;

  final ThemeMode themeMode;

  const AppState({
    this.locale = Locales.defaultLocale,
    this.themeMode = ThemeMode.light,
  });

  factory AppState.fromJson(Map<String, Object?> json) =>
      _$AppStateFromJson(json);

  Map<String, dynamic> toJson() => _$AppStateToJson(this);

  @override
  List<Object> get props => [locale, themeMode];

  AppState copyWith({
    Locale? locale,
    ThemeMode? themeMode,
  }) {
    return AppState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
