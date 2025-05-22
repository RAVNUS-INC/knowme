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

  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _isSearching = _searchController.text.trim().isNotEmpty;
      });
    });
  }

  // 검색 실행 함수
  void _handleSearch() {
    final query = _searchController.text.trim();
    if (query.isEmpty) return;

    setState(() {
      _recentSearches.remove(query); // 중복 제거
      _recentSearches.insert(0, query); // 맨 앞에 추가
      _searchController.clear();
    });
  }

  // 검색어 전체 삭제
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
            SearchBarWithAction(
              controller: _searchController,
              isSearching: _isSearching,
              onSearch: _handleSearch,
              onCancel: () => Navigator.pop(context),
            ),
            const SizedBox(height: 20),
            _SearchHeader(onClearAll: _clearRecentSearches),
            const SizedBox(height: 6),
            Container(height: 1, color: const Color(0xFFE5E5E5)),
            const SizedBox(height: 8),
            Expanded(child: _buildRecentSearchList()),
          ],
        ),
      ),
    );
  }

  // 최근 검색어 리스트 렌더링
  Widget _buildRecentSearchList() {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 4),
      itemCount: _recentSearches.length,
      separatorBuilder: (_, __) => Container(height: 1, color: const Color(0xFFE5E5E5)),
      itemBuilder: (context, index) {
        final item = _recentSearches[index];
        return RecentSearchItem(
          text: item,
          onRemove: () {
            setState(() {
              _recentSearches.removeAt(index);
            });
          },
        );
      },
    );
  }
}

// ✅ 검색창과 오른쪽 '검색/취소' 버튼
class SearchBarWithAction extends StatelessWidget {
  final TextEditingController controller;
  final bool isSearching;
  final VoidCallback onSearch;
  final VoidCallback onCancel;

  const SearchBarWithAction({
    super.key,
    required this.controller,
    required this.isSearching,
    required this.onSearch,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFB7C4D4), width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset('assets/images/icon-search.png', width: 16, height: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '검색어를 입력해 주세요',
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
          onTap: isSearching ? onSearch : onCancel,
          child: Text(
            isSearching ? '검색' : '취소',
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
    );
  }
}

// ✅ 최근 검색어 헤더 (제목 + 전체삭제)
class _SearchHeader extends StatelessWidget {
  final VoidCallback onClearAll;

  const _SearchHeader({required this.onClearAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '최근 검색어',
          style: TextStyle(
            color: Color(0xFF0068E5),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
            letterSpacing: -0.56,
          ),
        ),
        GestureDetector(
          onTap: onClearAll,
          child: const Text(
            '전체삭제',
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
    );
  }
}

// ✅ 최근 검색어 아이템 위젯
class RecentSearchItem extends StatelessWidget {
  final String text;
  final VoidCallback onRemove;

  const RecentSearchItem({
    super.key,
    required this.text,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF232323),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              letterSpacing: -0.56,
            ),
          ),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(Icons.close, size: 16, color: Color(0xFF72787F)),
          ),
        ],
      ),
    );
  }
}