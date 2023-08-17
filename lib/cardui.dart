import 'package:blog_app/functions/Custom%20Button/Login&signupButton.dart';
import 'package:blog_app/functions/Custom%20Button/customButton.dart';
import 'package:blog_app/view/BlogFullPost/BlogFullPost.dart';
import 'package:flutter/material.dart';

import 'constants/Color Constant/ColorConstant.dart';

class CardUi extends StatelessWidget {
  CardUi({super.key});

  @override
  Widget build(BuildContext context) {
    var heightt = MediaQuery.of(context).size.height * 1;
    var widthh = MediaQuery.of(context).size.width * 1;
   
    CardUi() {
      return Center(
        child: Card(
          color: Colors.blue,
          child: Container(
            alignment: Alignment.center,
            height: heightt * 0.3,
            width: widthh*0.9,
            // width: 250,
            child: ListTile(
              title: Column(
                children: [
                  Text(
                    "title",
                    style: TextStyle(fontSize: 40, color: Colors.red),
                  ),
                  SizedBox(
                    height: heightt * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "date",
                        style: TextStyle(fontSize: 40, color: Colors.red),
                      ),
                      // SizedBox(
                      //   width: 20,
                      // ),
                      Text(
                        "heart",
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
                      // nextScreen:  SignUpPage(),
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

    return Scaffold(drawerScrimColor: Colors.red, body: CardUi());
  }
}
