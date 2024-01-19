import 'package:blog_app/view/bottom_nav/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants/Color Constant/ColorConstant.dart';
import '../../view/Login/login.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  get formKey => _formKey;
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  get NameTextEditingController => _nameTextEditingController;

  final TextEditingController _emailTextEditingController =
      TextEditingController();
  get EmailTextEditingController => _emailTextEditingController;

  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  get PasswordTextEditingController => _passwordTextEditingController;
  FirebaseAuth auth = FirebaseAuth.instance;

  final email = ''.obs;
  final password = ''.obs;
  final name = ''.obs;

  String? validateName(String? input) {
    if (input == null || input.isEmpty) {
      return 'User name is required.';
    }

    return null;
  }

  void saveName(String input) {
    name.value = input;
  }

  void saveEmail(String input) {
    email.value = input;
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email.value, password: password.value);
        User user = userCredential.user!;
        user.sendEmailVerification();
        Get.offAll(() => BottomNav());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          print("Account Already Exists. \nPlease Login!");
          Get.snackbar(
            'Account Already Exists. ', //Snackbar title
            'Please Login!', // Snackbar message
            icon: const Icon(Icons.error_outline, color: Colors.black),
            backgroundColor: App_Colors.app_white_color,
            colorText: Colors.black,
            snackPosition: SnackPosition.TOP,
            duration: const Duration(
                seconds: 3), // Duration for which the Snackbar is shown
          );
          Get.offAll(LoginPage()); // Move this line here
        }
      }
    }
  }
}
