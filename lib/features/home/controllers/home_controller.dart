import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // 현재 페이지 인덱스 (반응형)
  final RxInt currentPage = 0.obs;

  // 카드 슬라이더 제어용 PageController
  final PageController pageController = PageController(viewportFraction: 0.85);

  @override
  void onInit() {
    super.onInit();

    // PageView가 움직이면 currentPage 업데이트
    pageController.addListener(() {
      final page = pageController.page?.round() ?? 0;
      if (currentPage.value != page) {
        currentPage.value = page;
      }
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
