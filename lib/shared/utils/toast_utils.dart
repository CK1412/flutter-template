import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  ToastUtils._();

  static void showMessage(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      webPosition: "center",
    );
  }

  static void showComingSoon() {
    showMessage('Coming soon');
  }
}
