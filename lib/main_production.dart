import 'app_flavor_config.dart';
import 'main_common.dart';

void main() {
  final AppFlavorConfig appConfig = AppFlavorConfig.production();
  mainCommon(appConfig);
}
