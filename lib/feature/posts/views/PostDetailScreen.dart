// lib/feature/posts/views/post_detail_screen.dart

import 'package:flutter/material.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('코드웨이브'),
        actions: const [
          Icon(Icons.bookmark_border),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 썸네일 이미지
            Image.asset(
              'assets/images/job_thumbnail_1.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '코드웨이브 신입 채용공고 - 프론트엔드 개발자',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  _SectionTitle('회사 소개'),
                  const SizedBox(height: 8),
                  const Text(
                    '코드웨이브는 웹/앱 개발, B2B SaaS 플랫폼, 데이터 기반 UI/UX 개선 등 다양한 프로젝트를 통해 빠르게 성장 중인 스타트업으로, 기술을 통해 더 나은 일상을 만드는 디지털 솔루션 기업입니다.\n\n우리는 “기술로 연결된 가치”를 믿습니다. 함께 성장하고 싶은 당신을 기다립니다.',
                  ),
                  const SizedBox(height: 12),
                  Image.asset(
                    'assets/images/job_thumbnail_2.jpg',
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 24),

                  _SectionTitle('모집 부문'),
                  const SizedBox(height: 8),
                  _BulletList([
                    '프론트엔드 개발자 (신입/경력)',
                  ]),

                  const SizedBox(height: 16),
                  _SectionTitle('담당 업무'),
                  const SizedBox(height: 8),
                  _BulletList([
                    '자사 웹 서비스 및 클라이언트 프로젝트의 프론트엔드 개발',
                    '디자이너 및 백엔드 개발자와의 협업을 통한 UI 구현',
                    '사용자 경험 개선 및 퍼포먼스 최적화',
                  ]),

                  const SizedBox(height: 16),
                  _SectionTitle('자격 요건'),
                  const SizedBox(height: 8),
                  _BulletList([
                    'React, Vue 등 프론트엔드 프레임워크에 대한 이해',
                    'HTML/CSS/JavaScript 기반 마크업 및 인터랙션 구현 가능자',
                    'Git을 활용한 협업 경험',
                  ]),

                  const SizedBox(height: 16),
                  _SectionTitle('우대 사항'),
                  const SizedBox(height: 8),
                  _BulletList([
                    'TypeScript 활용 경험',
                    '디자인 시스템 활용 경험',
                    '개인 포트폴리오 또는 GitHub 링크 제출 가능자',
                  ]),

                  const SizedBox(height: 16),
                  _SectionTitle('근무 조건'),
                  const SizedBox(height: 8),
                  _BulletList([
                    '고용 형태: 정규직 (수습 3개월)',
                    '근무 형태: 주 2회 재택 / 자율 출퇴근제 (10~19시 코어타임)',
                    '근무지: 서울 성수동 (뚝섬역 도보 5분)',
                  ]),

                  const SizedBox(height: 16),
                  _SectionTitle('복지'),
                  const SizedBox(height: 8),
                  _BulletList([
                    '매달 기술도서 지원비',
                    '자율과 책임 중심의 유연 근무제',
                    '업무에 필요한 교육 및 컨퍼런스 지원',
                    '맥북 프로 + 듀얼 모니터 기본 지급',
                    '생일 반차 & 기념일 상품권 지급',
                    '1년 근속 시 리프레시 휴가 5일 + 여행 지원비',
                  ]),

                  const SizedBox(height: 16),
                  _SectionTitle('전형 절차'),
                  const SizedBox(height: 8),
                  const Text('1. 서류 접수 → 2. 온라인 과제 → 3. 인터뷰(1회) → 4. 최종 합격'),

                  const SizedBox(height: 16),
                  _SectionTitle('지원 방법'),
                  const SizedBox(height: 8),
                  const Text(
                    '이력서 및 포트폴리오 제출: recruit@codewave.co.kr\n지원 마감: 2025년 5월 20일(월) 23:59까지',
                  ),

                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('자세히 보기'),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _BulletList extends StatelessWidget {
  final List<String> items;
  const _BulletList(this.items);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (e) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('• ', style: TextStyle(height: 1.5)),
            Expanded(child: Text(e, style: const TextStyle(height: 1.5))),
          ],
        ),
      )
          .toList(),
    );
  }
}
