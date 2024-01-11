import '../../l10n/generated/l10n.dart';
import 'app_exception.dart';

class RemoteException extends AppException {
  RemoteException({super.message, super.messageCode});
}

class NoInternetException extends RemoteException {
  NoInternetException({
    String? message,
    super.messageCode,
  }) : super(message: message ?? L.current.error_no_internet_exception);
}

class ConnectionTimeoutException extends RemoteException {
  ConnectionTimeoutException({
    String? message,
    super.messageCode,
  }) : super(message: message ?? L.current.error_connection_timeout_exception);
}

class BadCertificateException extends RemoteException {
  BadCertificateException({
    String? message,
    super.messageCode,
  }) : super(message: message ?? L.current.error_bad_certificate_exception);
}

class BadResponseException extends RemoteException {
  BadResponseException({
    String? message,
    super.messageCode,
  }) : super(message: message ?? L.current.error_bad_certificate_exception);
}

class CancelledRequestException extends RemoteException {
  CancelledRequestException({
    String? message,
    super.messageCode,
  }) : super(message: message ?? L.current.error_cancelled_request_exception);
}
