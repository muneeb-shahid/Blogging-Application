import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/Color Constant/ColorConstant.dart';

class BlogFullPost extends StatelessWidget {
  final dynamic blogData;

  BlogFullPost({
    required this.blogData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App_Colors.app_background_color,
      appBar: AppBar(
        backgroundColor: App_Colors.app_background_color,
        elevation: 0,
        leading: InkWell(
          child: const Icon(
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
            padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: Column(
              children: [
                Text(
                  blogData["title"],
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  blogData["content"],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
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
