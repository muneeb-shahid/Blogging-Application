import 'package:blog_app/controller/SignUpController/SignUpController.dart';
import 'package:blog_app/functions/ListTile/ListTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/Color Constant/ColorConstant.dart';
import '../../Constants/FontConstant/FontConstant.dart';
import '../../controller/FavouriteController/FavouriteController.dart';
import '../../controller/HomeController/HomeController.dart';
import '../../controller/ProfileController/ProfileController.dart';
import '../CreateBlog/CreateBlog.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  

  @override
  Widget build(BuildContext context) {
      final ref = FirebaseDatabase.instance.ref("Blog");
    final User _user = FirebaseAuth.instance.currentUser!;

    final FavouriteController favouriteController =
        Get.put(FavouriteController());

    HomeController homeController = Get.put(HomeController());
    final ProfileController _profileController = Get.put(ProfileController());
    final SignUpController _signUpController = Get.put(SignUpController());

    TextEditingController _searchTextEditingController =
        TextEditingController();
    var heightt = MediaQuery.of(context).size.height * 1;
    var widthh = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      backgroundColor: App_Colors.app_background_color,
      body: 
          SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          child: GetBuilder<ProfileController>(
                            builder: (_) => _profileController.imageFile == null
                                ? Image(
                                    color: App_Colors.app_black_color,
                                    image: AssetImage(
                                      'assets/images/Profile-modified.png',
                                    ))
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(150.0),
                                    child: Image.file(
                                      _profileController.imageFile!,
                                      height: heightt * 0.2,
                                      width: widthh * 0.4,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                          ),
                        ),
                        Positioned(
                            child: IconButton(
                                onPressed: () =>
                                    _profileController.selectAndCropImage(),
                                icon: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.black,
                                  size: 50,
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: heightt * 0.05,
                    ),
            
                    ListTile(
                      leading: Icon(
                        Icons.email_outlined,
                        color: App_Colors.app_black_color,
                      ),
                      title: Text(
                        _user.email ??
                            _signUpController.email.value.toLowerCase(),
                        style: TextStyle(
                            color: App_Colors.app_black_color,
                            fontSize: FontsConstants.text_font_size.sp,
                            fontFamily: FontsConstants.regular_font_family,
                            wordSpacing: 1,
                            letterSpacing: 1),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: App_Colors.app_black_color,
                    ),
                    Drawer_Function.drawer_list_function(
                      func: () => Get.to(CreateBlog()),
                      iconn: Icons.add_box_outlined,
                      text: "Add new article",
                    ),
                  
                    Drawer_Function.drawer_list_function(
                      func: _profileController.signOutUser,
                      iconn: Icons.logout_outlined,
                      text: "Log out",
                    ),
                    SizedBox(
                      height: heightt * 0.1,
                    ),
            
                  ],
                ),
              ),
            ),
          ),
        
    );
  }
}
