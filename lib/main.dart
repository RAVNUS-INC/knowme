import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'features/activity/views/activity_screen.dart';
import 'features/membership/views/profile_screen.dart';
import 'features/home/views/notification_screen.dart';
import 'routes/routes.dart';
import 'package:get/get.dart';
=======
import 'package:get/get.dart';
import '../routes/routes.dart';
>>>>>>> upstream/main

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
<<<<<<< HEAD
      title: 'Know Me',
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.routes,
      initialRoute: '/', // 아래 '/' 경로로 시작
    );
  }
}

// 테스트용 홈 페이지 (버튼 하나만 있음)
class TestHome extends StatelessWidget {
  const TestHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(AppRoutes.profile); // ✅ 여기서 이동
          },
          child: const Text('프로필로 이동'),
        ),
      ),
=======
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
>>>>>>> upstream/main
    );
  }
}
