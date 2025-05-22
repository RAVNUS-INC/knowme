import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../features/home/views/home_screen.dart';
import '../../../features/search/views/search_screen.dart'; // ✅ 추가

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final int currentIndex;
  final Function(int)? onTap;

  const BaseScaffold({
    super.key,
    required this.body,
    this.currentIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: Column(
        children: [
          // ✅ AppBar 영역
          Container(
            width: double.infinity,
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: const BoxDecoration(
              color: Color(0xCCF5F5F5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ⬅️ 왼쪽: symbol + 로고
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/symbol.png',
                        width: 28,
                        height: 28,
                      ),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(() => const HomeScreen());
                        },
                        child: Image.asset(
                          'assets/images/knowme.png',
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),

                  // ➡️ 오른쪽: 3개 아이콘
                  Row(
                    children: [
                      _AppIconButton('assets/images/Search.png', onTap: () {
                        Get.to(() => const SearchScreen()); // ✅ 여기
                      }),
                      const SizedBox(width: 16),
                      _AppIconButton('assets/images/bell.png', onTap: () {
                        print('Bell tapped');
                      }),
                      const SizedBox(width: 16),
                      _AppIconButton('assets/images/User.png', onTap: () {
                        print('Profile tapped');
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // 🔻 본문
          Expanded(child: body),
        ],
      ),

      // 🔻 하단 네비게이션 바
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: const BoxDecoration(
          color: Color(0xFFFDFDFD),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomNavItem(
              iconPath: 'assets/images/icon-공고.png',
              label: '공고',
              onTap: () => onTap?.call(0),
            ),
            _BottomNavItem(
              iconPath: 'assets/images/내활동.png',
              label: '내 활동',
              onTap: () => onTap?.call(1),
            ),
            _BottomNavItem(
              iconPath: 'assets/images/활동추천.png',
              label: '활동 추천',
              onTap: () => onTap?.call(2),
            ),
            _BottomNavItem(
              iconPath: 'assets/images/AI분석.png',
              label: 'AI 분석',
              onTap: () => onTap?.call(3),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ 공통 아이콘 버튼
class _AppIconButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onTap;

  const _AppIconButton(this.assetPath, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        assetPath,
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      ),
    );
  }
}

// ✅ 하단 네비게이션 버튼
class _BottomNavItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  const _BottomNavItem({
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            width: 26,
            height: 26,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFB7C4D4),
              fontSize: 10,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              letterSpacing: -0.4,
            ),
          ),
        ],
      ),
    );
  }
}
