import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Title_BlogValidation extends GetxController {
  String? validateTitle(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) {
      return 'Blog title is required.';
    }

    // String pattern = r'\w+@\w+\.\w+';
    // RegExp regex = RegExp(pattern);
    // if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';
    if (formEmail.length > 2) {
      return "Please enter at least 2 words. ";
    } else if (formEmail.length > 51) {
      return 'Please enter no more than 50 words.';
    }

    return null;
  }
}
