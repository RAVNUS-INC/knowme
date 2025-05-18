import 'package:flutter/material.dart';
import 'package:knowme_frontend/feature/posts/views/PostDetailScreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Know Me',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: PostDetailScreen(), // ← 여가 시작 화면! 지민이가 home으로 바꿔야 함
    );
  }
}
