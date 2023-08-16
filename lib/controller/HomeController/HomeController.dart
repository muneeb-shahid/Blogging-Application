import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/Color Constant/ColorConstant.dart';

class HomeController extends GetxController {


  
  // final databaseRef = FirebaseDatabase.instance.ref("Favourite");
  // Favourite() {

  //   databaseRef.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
  //     "Favourite": toString(),
  //     "id": DateTime.now().millisecondsSinceEpoch.toString(),
  //   }).then((value) {
  //     Get.snackbar(
  //       "Successfully",
  //       'Blog is like',
  //       icon: const Icon(Icons.favorite, color: Colors.red),
  //       backgroundColor: App_Colors.app_white_color,
  //       colorText: Colors.black,
  //       snackPosition: SnackPosition.TOP,
  //     );
  //   }).onError((error, stackTrace) {});
  // }

}
