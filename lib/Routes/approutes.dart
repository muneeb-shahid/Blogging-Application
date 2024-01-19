import 'package:blog_app/routes/routes_name.dart';
import 'package:blog_app/view/bottom_nav/bottom_nav.dart';
import 'package:blog_app/view/create_blog/create_blog.dart';
import 'package:get/get.dart';

import '../View/SignUp/SignUp.dart';
import '../View/Welcome/Welcome.dart';
import '../view/Home/home.dart';
import '../view/Login/login.dart';
import '../view/Profile/Profile.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.welcomeScreen,
          page: () => WelcomeScreen(),
        ),
        GetPage(
          name: RoutesName.loginPage,
          page: () => LoginPage(),
        ),
        GetPage(
          name: RoutesName.signUpPage,
          page: () => SignUpPage(),
        ),
        GetPage(
          name: RoutesName.bottomNav,
          page: () => BottomNav(),
        ),
        GetPage(
          name: RoutesName.createBlog,
          page: () => CreateBlog(),
        ),
        GetPage(
          name: RoutesName.homePage,
          page: () => HomePage(),
        ),
        GetPage(name: RoutesName.profile, page: () => Profile()),
      ];
}
