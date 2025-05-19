import 'package:get/get.dart';
import '../features/membership/views/login_page.dart';
import '../features/membership/views/signup_firstpage.dart';
import '../features/membership/views/signup_secondpage.dart';
import '../features/membership/views/signup_thirdpage.dart';
import '../features/membership/views/find_id_passwd.dart'; // 파일 이름 변경 반영

class AppRoutes {
  static const String login = '/login';
  static const String signupFirst = '/signup/first';
  static const String signupSecond = '/signup/second';
  static const String signupThird = '/signup/third';
  static const String home = '/home';
  static const String findIdPasswd = '/find-id-passwd'; // 경로명도 일관성 있게 변경

  static final routes = [
    GetPage(
      name: login,
      page: () => const LoginPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: signupFirst,
      page: () => const SignupFirstPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: signupSecond,
      page: () => const SignupSecondPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: signupThird,
      page: () => const SignupThirdPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: findIdPasswd,
      page: () => const FindIdPasswd(), // 클래스명도 파일명과 일치하도록 변경
      transition: Transition.downToUp, // Modal-like transition
    ),
    // You can add other routes here as needed
  ];
}