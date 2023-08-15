import 'package:blog_app/Constants/Color%20Constant/ColorConstant.dart';
import 'package:blog_app/View/welcome/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/ProfileController/ProfileController.dart';


class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    var heightt = MediaQuery.of(context).size.height * 1;
    var widthh = MediaQuery.of(context).size.width * 1;

    void signOutUser() async {
      try {
        await FirebaseAuth.instance.signOut();
        Get.offAll(const WelcomeScreen());
        print('User signed out.');
      } catch (e) {
        print('Error signing out: $e');
      }
    }

    return Scaffold(
      backgroundColor: App_Colors.app_background_color,
    
      body:
    
       SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            child: GetBuilder<ProfileController>(
                              builder: (_) =>
                                  _profileController.imageFile == null
                                      ? const Image(
                                          image: AssetImage(
                                          'assets/images/Profile-modified.png',
                                        ))
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(150.0),
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
                      ElevatedButton(
                          onPressed: signOutUser, child: const Text("logout"))
                    ],
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
