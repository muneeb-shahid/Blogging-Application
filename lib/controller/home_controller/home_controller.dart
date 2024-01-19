import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  TextEditingController _searchTextEditingController = TextEditingController();
  get SearchTextEditingController => _searchTextEditingController;

  String search = '';
}
