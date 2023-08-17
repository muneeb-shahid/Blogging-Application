import 'package:blog_app/Constants/FontConstant/FontConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants/Color Constant/ColorConstant.dart';

class BlogFullPost extends StatelessWidget {
  final dynamic blogData;
  BlogFullPost({
    required this.blogData,
  });

  @override
  Widget build(BuildContext context) {
    var heightt = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: App_Colors.app_background_color,
      appBar: AppBar(
        backgroundColor: App_Colors.app_background_color,
        elevation: 0,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [

                Text(
                  blogData["title"].toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      wordSpacing: 2,
                      color: App_Colors.app_black_color,
                      fontFamily: FontsConstants.heading_font_family,
                      fontSize: 16.sp),
                ),
                SizedBox(
                  height: heightt * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      blogData['date'].toString(),
                      style: TextStyle(
                          color: App_Colors.app_black_color,
                          fontFamily: FontsConstants.regular_font_family,
                          fontSize: FontsConstants.text_font_size.sp),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
                Text(
                  blogData["content"].toString(),
                  style: TextStyle(
                      color: App_Colors.app_black_color,
                      fontFamily: FontsConstants.regular_font_family,
                      fontSize: 13.sp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






















// import 'package:blog_app/model/blogPostModel.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../constants/Color Constant/ColorConstant.dart';

// class BlogFullPost extends StatelessWidget {
//   //  final Map<String, dynamic> blogData;
//    final dynamic blogData;

//   BlogFullPost({
//     super.key,
//     required this.blogData,
//   });
//   @override
//   Widget build(BuildContext context) {
//     final ref = FirebaseDatabase.instance.ref("Blog");

//     return Scaffold(
//         backgroundColor: App_Colors.app_background_color,
//         appBar: AppBar(
//             backgroundColor: App_Colors.app_background_color,
//             elevation: 0,
//             leading: InkWell(
//               child: const Icon(
//                 Icons.arrow_back_ios_new,
//                 color: Colors.black,
//               ),
//               onTap: () {
//                 Get.back();
//               },
//             )),
//         body: SafeArea(
//           top: true,
//           child: Padding(
//             padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
//             child: Column(children: [
//               Expanded(
//                   child: StreamBuilder(
//                       stream: ref.onValue,
//                       builder: (
//                         context,
//                         AsyncSnapshot<DatabaseEvent> snapshot,
//                       ) {
//                         try {
//                           Map<dynamic, dynamic> map =
//                               snapshot.data?.snapshot.value as dynamic;
//                           List<dynamic> list = [];
//                           list.clear();
//                           list = map.values.toList();
//                           return ListView.builder(
//                             itemCount: snapshot.data!.snapshot.children.length,
//                             itemBuilder: (context, index) {
//                               return ListTile(
//                                 title: Text(
//                                  blogData["title"],
//                                   style: TextStyle(
//                                       color: Colors.red, fontSize: 14),
//                                 ),
//                                 subtitle: Text(
//                                    blogData["content"],
//                                   style: TextStyle(
//                                       color: Colors.black, fontSize: 12),
//                                 ),
//                                 trailing: Icon(Icons.favorite_border),
//                               );
//                             },
//                           );
//                         } catch (e) {
//                           return Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Center(
//                                 child: CircularProgressIndicator(
//                                     color: App_Colors.app_green_color),
//                               ),
//                             ],
//                           );
//                         }
//                       }))
//             ]),
//           ),
//         ));
//   }
// }
