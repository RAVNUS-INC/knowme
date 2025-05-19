import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/login_model.dart';

class LoginController extends GetxController {
  final LoginModel model;
  final TextEditingController idController;
  final TextEditingController passwordController;

  // Rx 변수로 상태 관리
  final RxBool obscureText = true.obs;
  final RxBool rememberAccount = false.obs;

  LoginController({
    required this.model,
    required this.idController,
    required this.passwordController,
  });

  void updateUserId(String value) {
    model.userId = value;
  }

  void updatePassword(String value) {
    model.password = value;
  }

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  void toggleRememberAccount(bool? value) {
    rememberAccount.value = value ?? false;
    model.rememberAccount = rememberAccount.value;
  }

  Future<void> handleLogin() async {
    // 로그인 처리 로직
    try {
      // 로그인 API 호출 로직
      // 성공 시 홈 화면으로 이동
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar(
        '로그인 실패',
        '아이디 또는 비밀번호를 확인해주세요.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void handleRegister() {
    // 회원가입 화면으로 이동
    Get.toNamed('/signup/first');
  }

  void handleForgotPassword() {
    // 아이디/비밀번호 찾기 화면으로 이동
    Get.toNamed('/find-id-passwd');
  }

  void handleSocialLogin(String provider) {
    // 소셜 로그인 처리 로직
    Get.snackbar(
      '소셜 로그인',
      '$provider 로그인 시도 중...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
