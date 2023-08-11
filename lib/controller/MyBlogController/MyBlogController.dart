import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBlogController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  get formKey => _formKey;


  TextEditingController _titleController = TextEditingController();
  get titleController => _titleController;

  TextEditingController _contentController = TextEditingController();
  get contentController => _contentController;
}
