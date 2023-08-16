import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/Color Constant/ColorConstant.dart';

class HomeController extends GetxController {
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  get SearchTextEditingController => _searchTextEditingController;

  String search = '';
}
