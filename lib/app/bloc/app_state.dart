part of 'app_bloc.dart';

@JsonSerializable()
class AppState extends BaseBlocState {
  /// Locale used in App
  @LocaleJsonConverter()
  final Locale locale;

  const AppState({
    this.locale = Locales.defaultLocale,
  });

  factory AppState.fromJson(Map<String, Object?> json) =>
      _$AppStateFromJson(json);

  Map<String, dynamic> toJson() => _$AppStateToJson(this);

  @override
  List<Object> get props => [locale];

  AppState copyWith({
    Locale? locale,
  }) {
    return AppState(
      locale: locale ?? this.locale,
    );
  }
}
