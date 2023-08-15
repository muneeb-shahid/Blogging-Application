import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../Constants/FontConstant/FontConstant.dart';
import '../../View/welcome/welcome.dart';
import '../../constants/Color Constant/ColorConstant.dart';

var mediaQueryData = Get.mediaQuery;
double screenHeight = mediaQueryData.size.height * 1;
double screenWidth = mediaQueryData.size.width * 1;

class ProfileController extends GetxController {
   void signOutUser() async {
      try {
        await FirebaseAuth.instance.signOut();
        Get.offAll(const WelcomeScreen());
        print('User signed out.');
      } catch (e) {
        print('Error signing out: $e');
      }
    }
  File? imageFile;

  final picker = ImagePicker();

  Future<void> selectAndCropImage() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.camera,
    ].request();

    if (statuses[Permission.storage]!.isGranted &&
        statuses[Permission.camera]!.isGranted) {
      await showImagePicker();
    } else {
      print('no permission provided');
    }
  }

  Future<void> showImagePicker() async {
    Get.bottomSheet(Container(
      color: Colors.white,
      width: double.infinity,
      height: screenHeight * 0.15,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
          Icons.    camera,
              size: 30.0,
            ),
            title: Text(
              'Take a photo',
              style: TextStyle(
                color: App_Colors.app_black_color,
                fontSize: 16.sp,
                fontFamily: FontsConstants.heading_font_family,
              ),
            ),
            onTap: () {
              _imgFromCamera();
              Get.back();
            },
          ),
          ListTile(
              leading: const Icon(
              Icons.    photo_library,
                size: 30,
              ),
              title: Text(
                'Choose from gallery',
                style: TextStyle(
                    color: App_Colors.app_black_color,
                    fontSize: 16.sp,
                    fontFamily: FontsConstants.heading_font_family,
                    letterSpacing: 1,
                    wordSpacing: 1),
              ),
              onTap: () {
                _imgFromGallery();
                Get.back();
              }),
        ],
      ),
    ));
  }

  Future<void> _imgFromGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) {
      _cropImage(File(pickedFile.path));
    }
  }

  Future<void> _imgFromCamera() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedFile != null) {
      _cropImage(File(pickedFile.path));
    }
  }

  Future<void> _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imgFile.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9,
            ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: "",
          toolbarColor: App_Colors.app_white_color,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: "",
        ),
      ],
    );
    if (croppedFile != null) {
      imageFile = File(croppedFile.path);
      update();
    }
  }
}
