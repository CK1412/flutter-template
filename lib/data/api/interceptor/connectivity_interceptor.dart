import 'package:dio/dio.dart';

import '../../../shared/exceptions/remote_exception.dart';
import '../../../shared/useful/network_connectivity.dart';
import 'base_interceptor.dart';

class ConnectivityInterceptor extends BaseInterceptor {
  @override
  int get priority => BaseInterceptor.connectivityPriority;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (NetworkConnectivity().networkStatus.isOffline) {
      return handler.reject(
        DioException(
          requestOptions: options,
          error: NoInternetException(),
        ),
      );
    }

    super.onRequest(options, handler);
  }
}
