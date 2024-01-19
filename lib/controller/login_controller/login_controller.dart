import 'package:blog_app/controller/signup_controller/signup_controller.dart';
import 'package:blog_app/view/bottom_nav/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/Color Constant/ColorConstant.dart';

class LoginController extends GetxController {
  SignUpController _signUpController = Get.put(SignUpController());
  TextEditingController _loginEmail = TextEditingController();
  get LoginEmail => _loginEmail;
  TextEditingController _loginPassowrd = TextEditingController();
  get LoginPassowrd => _loginPassowrd;

  final email_ = ''.obs;

  saveEmail(String input) {
    email_.value = input;
  }

  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  final formKey = GlobalKey<FormState>();
  var isObscured = true.obs; // Observe
  final loadingController = false.obs;

  void toggleObscure() {
    isObscured.toggle(); // Toggle the value of _isObscured
  }

  onLogin() async {
    if (formKey.currentState!.validate()) {
      try {
        // Start loading
        loadingController(true);

        final userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (userCredential.user != null &&
            _signUpController.name.value.isNotEmpty) {
          await userCredential.user!
              .updateProfile(displayName: _signUpController.name.value);
        }

        Get.offAll(() => BottomNav());
      } on FirebaseAuthException catch (e) {
        loadingController(false); // Stop loading
        if (e.code == 'user-not-found') {
          print("No User Found for that Email");
          // Show snackbar using GetX
          Get.snackbar(
            'Error',
            "No User Found for that Email",
            icon: const Icon(Icons.error_outline, color: Colors.black),
            backgroundColor: App_Colors.app_white_color,
            colorText: Colors.black,
            snackPosition: SnackPosition.TOP,
          );
        } else if (e.code == 'wrong-password') {
          print("Wrong Password Provided by User");
          // Show snackbar using GetX
          Get.snackbar(
            'Error',
            "Wrong Password Provided by User",
            icon: const Icon(Icons.cancel_outlined, color: Colors.black),
            backgroundColor: App_Colors.app_white_color,
            colorText: Colors.black,
            snackPosition: SnackPosition.TOP,
          );
        }
      }
    }
  }
}
