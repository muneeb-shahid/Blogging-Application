import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/Color Constant/ColorConstant.dart';
import '../../functions/Custom Button/customButton.dart';

class HomeController extends GetxController {
  TextEditingController _searchTextEditingController = TextEditingController();
  get SearchTextEditingController => _searchTextEditingController;

  String search = '';

  CardUi(
    BuildContext context, title, date,nextScreenFun,heart
  ) {
    var heightt = MediaQuery.of(context).size.height * 1;
    var widthh = MediaQuery.of(context).size.width * 1;
    return Center(
      child: Card(
        color: Colors.blue,
        child: Container(
          alignment: Alignment.center,
          height: heightt * 0.3,
          width: widthh * 0.9,
          // width: 250,
          child: ListTile(
            title: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 40, color: Colors.red),
                ),
                SizedBox(
                  height: heightt * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: TextStyle(fontSize: 40, color: Colors.red),
                    ),
                    // SizedBox(
                    //   width: 20,
                    // ),
                    Text(
                      heart,
                      style: TextStyle(fontSize: 40, color: Colors.red),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  color: Colors.amber,
                ),
                Text(
                  "conetnt",
                  style: TextStyle(fontSize: 40, color: Colors.red),
                ),
                SizedBox(
                  height: heightt * 0.01,
                ),
                customButton(
                    nextScreen:  nextScreenFun,
                    innerColor: App_Colors.app_black_color,
                    textColor: App_Colors.app_white_color,
                    text: "Read more"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
