import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CustomLogInterceptor extends PrettyDioLogger {
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
}
