import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../shared/widgets/base_scaffold.dart';
import '../../ai_analysis/views/ai_analysis_screen.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return BaseScaffold(
      currentIndex: 0,
      onTap: (index) {
        print('탭 $index 클릭됨');
      },
      body: Container(
        width: double.infinity,
        color: const Color(0xFFFAFAFA), // 배경색
        child: Column(
          children: [
            const SizedBox(height: 16),

            // 🔹 카드 슬라이더
            SizedBox(
              height: 157,
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      width: 300,
                      height: 167,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Card ${index + 1}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // 🔸 인디케이터
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                final isActive = controller.currentPage.value == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade300,
                  ),
                );
              }),
            )),

            const SizedBox(height: 30),

            // 🔹 아이콘 + 텍스트
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _IconLabelItem(imageName: '채용.png', label: '채용'),
                  _IconLabelItem(imageName: '인턴.png', label: '인턴'),
                  _IconLabelItem(imageName: '대외활동.png', label: '대외활동'),
                  _IconLabelItem(imageName: '교육 강연.png', label: '교육/강연'),
                  _IconLabelItem(imageName: '공모전.png', label: '공모전'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 🔻 구분선
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 1,
                width: double.infinity,
                color: const Color(0xFFE5E5E5),
              ),
            ),

            const SizedBox(height: 24),

            // 🔻 안내 텍스트
            const Text(
              '내 활동 분석 리포트가 도착했어요',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF232323),
                fontSize: 18,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                letterSpacing: -0.72,
              ),
            ),

            const SizedBox(height: 24),

            // 🔲 흰색 컨테이너
            Center(
              child: Container(
                width: 341,
                height: 171,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    // 왼쪽
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              '이한양 님의 직무 적합도',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF454C53),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.48,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // 구분선
                    Container(
                      width: 1,
                      margin: const EdgeInsets.symmetric(vertical: 24),
                      color: Color(0xFFE5E5E5),
                    ),

                    // 오른쪽
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              '추천 활동',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF454C53),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.48,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 🔽 회색 바
            const SizedBox(height: 0),
            Container(
              width: 311,
              height: 15,
              decoration: const BoxDecoration(
                color: Color(0xFFE5E5E5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 30),
            //AI 분석 바로보기 버튼
            GestureDetector(
              onTap: () {
                Get.to(() => const AiAnalysisScreen());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                decoration: ShapeDecoration(
                  color: Color(0xFFF5F5F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x33184173),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/icon-ai.png',
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'AI분석 바로가기',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0068E5),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.48,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.chevron_right,
                      size: 18,
                      color: Color(0xFF0068E5),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ✅ 공통 아이콘 + 텍스트 위젯
class _IconLabelItem extends StatelessWidget {
  final String imageName;
  final String label;

  const _IconLabelItem({
    required this.imageName,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/$imageName',
          width: 40,
          height: 40,
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF454C53),
            fontSize: 10,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            letterSpacing: -0.4,
          ),
        ),
      ],
    );
  }
}
