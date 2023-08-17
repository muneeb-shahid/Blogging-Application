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

  // CardUi(BuildContext context, title, date, nextScreenFun, heart) {
  //   var heightt = MediaQuery.of(context).size.height * 1;
  //   var widthh = MediaQuery.of(context).size.width * 1;
  //   return Center(

  //     child: Card(
  //       color: Colors.blue,
  //       child: Container(
  //         alignment: Alignment.center,
  //         height: heightt * 0.3,
  //         width: widthh * 0.9,
  //         // width: 250,
  //         child: ListTile(
  //           title: Column(
  //             children: [
  //               Text(
  //                 list[index]["title"].toString(),
  //                 style: TextStyle(color: Colors.red, fontSize: 14),
  //               ),
  //               SizedBox(
  //                 height: heightt * 0.01,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     list[index]['date'].toString(),
  //                     style: TextStyle(color: Colors.green, fontSize: 14),
  //                   ),
  //                   IconButton(
  //                     onPressed: () {
  //                       Map<String, dynamic> selectedBlog =
  //                           Map.from(list[index]);
  //                       if (favouriteController.tempList.any(
  //                           (item) => item["title"] == selectedBlog["title"])) {
  //                         favouriteController.removeFavourite(selectedBlog);
  //                       } else {
  //                         favouriteController.addToFavourite(selectedBlog);
  //                       }
  //                     },
  //                     icon: Obx(() => Icon(
  //                           Icons.favorite,
  //                           color: favouriteController.tempList.any((item) =>
  //                                   item["title"] == list[index]["title"])
  //                               ? Colors.red
  //                               : Colors.black,
  //                         )),
  //                   ),
  //                 ],
  //               ),
  //               Divider(
  //                 thickness: 2,
  //                 color: Colors.amber,
  //               ),
  //               Text(
  //                 list[index]["content"].toString(),
  //                 overflow: TextOverflow.ellipsis,
  //                 softWrap: true,
  //                 maxLines: 3,
  //                 style: TextStyle(color: Colors.black, fontSize: 12),
  //               ),
  //               SizedBox(
  //                 height: heightt * 0.01,
  //               ),
  //               customButton(
  //                   nextScreen: nextScreenFun,
  //                   innerColor: App_Colors.app_black_color,
  //                   textColor: App_Colors.app_white_color,
  //                   text: "Read more"),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
    
  //   );
  // }
}
