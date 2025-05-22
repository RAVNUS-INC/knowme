import 'package:flutter/material.dart';
import '../../../shared/widgets/base_scaffold.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _recentSearches = [
    '프론트엔드 개발자',
    '프론트엔드',
    '개발자 공고',
    'HTML 강의',
    '대학생 공모전',
  ];

  void _handleSearch() {
    final query = _searchController.text.trim();
    if (query.isEmpty) return;

    setState(() {
      _recentSearches.remove(query); // 중복 제거
      _recentSearches.insert(0, query); // 맨 앞에 추가
      _searchController.clear();
    });
  }

  void _clearRecentSearches() {
    setState(() {
      _recentSearches.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentIndex: 0,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 검색창 + 버튼
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFB7C4D4), width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/images/icon-search.png', width: 16, height: 16),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            onChanged: (_) => setState(() {}),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '검색어를 입력해 주세요',
                              hintStyle: TextStyle(
                                color: Color(0xFFB7C4D4),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.56,
                              ),
                              isCollapsed: true,
                              contentPadding: EdgeInsets.only(top: 2),
                            ),
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              letterSpacing: -0.56,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 11),
                GestureDetector(
                  onTap: () {
                    if (_searchController.text.isEmpty) {
                      Navigator.pop(context);
                    } else {
                      _handleSearch();
                    }
                  },
                  child: Text(
                    _searchController.text.isEmpty ? '취소' : '검색',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF72787F),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.56,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 최근 검색어 제목
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '최근 검색어',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF0068E5),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.56,
                  ),
                ),
                GestureDetector(
                  onTap: _clearRecentSearches,
                  child: const Text(
                    '전체삭제',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFB7C4D4),
                      fontSize: 10,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      letterSpacing: -0.40,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            // 구분선
            Container(height: 1, color: const Color(0xFFE5E5E5)),

            const SizedBox(height: 8),

            // 최근 검색어 리스트
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 4),
                itemCount: _recentSearches.length,
                separatorBuilder: (_, __) =>
                    Container(height: 1, color: const Color(0xFFE5E5E5)),
                itemBuilder: (context, index) {
                  final item = _recentSearches[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item,
                          style: const TextStyle(
                            color: Color(0xFF232323),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.56,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _recentSearches.removeAt(index);
                            });
                          },
                          child: const Icon(Icons.close, size: 16, color: Color(0xFF72787F)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
