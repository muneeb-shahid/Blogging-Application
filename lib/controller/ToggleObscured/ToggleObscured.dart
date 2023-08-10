import 'package:get/get.dart';

class ToggleObscured extends GetxController {
  final _isObscured = true.obs;
  bool get isObscured => _isObscured.value;
  void toggleObscure() {
    _isObscured.toggle();
  }
}


                           