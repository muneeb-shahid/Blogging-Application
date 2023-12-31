import 'package:blog_app/Routes/routes_name.dart';
import 'package:blog_app/view/CreateBlog/CreateBlog.dart';
import 'package:get/get.dart';

import '../View/SignUp/SignUp.dart';
import '../View/Welcome/Welcome.dart';
import '../view/Home/home.dart';
import '../view/Login/login.dart';
import '../view/Bottom Nav/BottomNav.dart';
import '../view/Profile/Profile.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.WelcomeScreen,
          page: () => WelcomeScreen(),
        ),
        GetPage(
          name: RoutesName.LoginPage,
          page: () => LoginPage(),
        ),
        GetPage(
          name: RoutesName.SignUpPage,
          page: () => SignUpPage(),
        ),
        GetPage(
          name: RoutesName.BottomNav,
          page: () => BottomNav(),
        ),
      
        GetPage(
          name: RoutesName.CreateBlog,
          page: () => CreateBlog(),
        ),
        GetPage(
          name: RoutesName.HomePage,
          page: () => HomePage(),
        ),
        GetPage(name: RoutesName.Profile, page: () => Profile()),

        
      ];
}
