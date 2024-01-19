import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/color_constant/color_constant.dart';
import 'package:intl/intl.dart';

class CreateBlogController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  get formKey => _formKey;

  TextEditingController _titleController = TextEditingController();
  get titleController => _titleController;

  TextEditingController _contentController = TextEditingController();
  get contentController => _contentController;
  final databaseRef = FirebaseDatabase.instance.ref("Blog");

  String? validateTitle(String? input) {
    if (input == null || input.isEmpty) {
      return 'Blog title is required.';
    }
    input = input.trim();

    List<String> words = input.split(' ');

    if (words.length < 2) {
      return 'Please write at least 2 words.';
    } else if (words.length > 51) {
      return 'Please do not write more than 20 words.';
    }

    return null;
  }

  String? validateContent(String? input) {
    if (input == null || input.isEmpty) {
      return 'Blog content is required.';
    }
    input = input.trim();

    List<String> words = input.split(' ');

    if (words.length < 21) {
      return 'Please write at least 20 words.';
    }

    return null;
  }

  publish() {
    if (formKey.currentState!.validate()) {
      final now = DateTime.now();
      final dateFormat = DateFormat('yyyy-MM-dd');
      final formattedDate = dateFormat.format(now);
      databaseRef.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
        "title": titleController.text.toString(),
        "content": contentController.text.toString(),
        "id": DateTime.now().millisecondsSinceEpoch.toString(),
        "date": formattedDate,
      }).then((value) {
        titleController.clear();
        contentController.clear();

        Get.snackbar(
          "Successfully",
          'Blog is published',
          icon: const Icon(Icons.publish, color: Colors.black),
          backgroundColor: AppColors.appWhiteColor,
          colorText: Colors.black,
          snackPosition: SnackPosition.TOP,
        );
      }).onError((error, stackTrace) {});
    }
  }
}
