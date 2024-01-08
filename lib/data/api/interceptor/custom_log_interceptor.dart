import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'base_interceptor.dart';

class CustomLogInterceptor extends PrettyDioLogger implements BaseInterceptor {
  CustomLogInterceptor()
      : super(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        );

  @override
  int get priority => BaseInterceptor.customLogPriority;
}
