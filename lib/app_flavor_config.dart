import 'data/api/api_config.dart';

class AppFlavorConfig {
  final AppFlavorType appFlavorType;
  final ApiConfig apiConfig;

  AppFlavorConfig({
    required this.appFlavorType,
    required this.apiConfig,
  });

  factory AppFlavorConfig.development() {
    return AppFlavorConfig(
      appFlavorType: AppFlavorType.development,
      apiConfig: ApiConfig('https://reqres.in/'),
    );
  }

  factory AppFlavorConfig.staging() {
    return AppFlavorConfig(
      appFlavorType: AppFlavorType.staging,
      apiConfig: ApiConfig('https://reqres.in/'),
    );
  }

  factory AppFlavorConfig.production() {
    return AppFlavorConfig(
      appFlavorType: AppFlavorType.production,
      apiConfig: ApiConfig('https://reqres.in/'),
    );
  }
}

enum AppFlavorType {
  development,
  staging,
  production,
}
