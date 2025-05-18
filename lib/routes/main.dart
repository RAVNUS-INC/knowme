import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../features/membership/views/login_page.dart';
import '../features/membership/views/signup_firstpage.dart';
import '../features/membership/views/signup_secondpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/signup/first',
      page: () => const SignupFirstPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/signup/second',
      page: () => const SignupSecondPage(),
      transition: Transition.rightToLeft,
    ),
    // 다른 라우트들도 여기에 추가
  ];
}