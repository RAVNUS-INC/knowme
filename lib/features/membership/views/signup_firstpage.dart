import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupFirstPage extends StatefulWidget {
  const SignupFirstPage({Key? key}) : super(key: key);

  @override
  State<SignupFirstPage> createState() => _SignupFirstPageState();
}

class _SignupFirstPageState extends State<SignupFirstPage> {
  // 약관 동의 상태를 저장하는 변수들
  bool _agreeToAllTerms = false;
  bool _agreeToServiceTerms = false; // 필수
  bool _agreeToPrivacyPolicy = false; // 필수
  bool _agreeToMarketingInfo = false;

  // 다음 버튼 활성화 상태 확인
  bool get _isNextButtonEnabled => _agreeToServiceTerms && _agreeToPrivacyPolicy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          '회원가입',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: TextButton(
          onPressed: () => Get.back(),
          child: const Text(
            '이전',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 17,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      body: Column(
        children: [
          // 페이지 인디케이터
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // 약관 동의 목록
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // 전체 선택 체크박스
                  CheckboxListTile(
                    value: _agreeToAllTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreeToAllTerms = value ?? false;
                        _agreeToServiceTerms = _agreeToAllTerms;
                        _agreeToPrivacyPolicy = _agreeToAllTerms;
                        _agreeToMarketingInfo = _agreeToAllTerms;
                      });
                    },
                    title: const Text(
                      '전체선택',
                      style: TextStyle(fontSize: 14),
                    ),
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    dense: true,
                  ),

                  const Divider(),

                  // 서비스 이용약관 (필수)
                  CheckboxListTile(
                    value: _agreeToServiceTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreeToServiceTerms = value ?? false;
                        _updateAllTermsStatus();
                      });
                    },
                    title: Row(
                      children: [
                        const Text('(필수) 이용약관 동의', style: TextStyle(fontSize: 14)),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            print('서비스 이용약관 보기');
                            // 약관 내용 보기 화면으로 이동
                          },
                          child: const Text(
                            '보기',
                            style: TextStyle(fontSize: 14, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    dense: true,
                  ),

                  // 개인정보 수집 및 이용 동의 (필수)
                  CheckboxListTile(
                    value: _agreeToPrivacyPolicy,
                    onChanged: (value) {
                      setState(() {
                        _agreeToPrivacyPolicy = value ?? false;
                        _updateAllTermsStatus();
                      });
                    },
                    title: Row(
                      children: [
                        const Text('(필수) 개인정보 수집 및 이용 동의', style: TextStyle(fontSize: 14)),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            print('개인정보 처리방침 보기');
                            // 개인정보 처리방침 보기 화면으로 이동
                          },
                          child: const Text(
                            '보기',
                            style: TextStyle(fontSize: 14, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    dense: true,
                  ),

                  // 마케팅 정보 수신 동의 (선택)
                  CheckboxListTile(
                    value: _agreeToMarketingInfo,
                    onChanged: (value) {
                      setState(() {
                        _agreeToMarketingInfo = value ?? false;
                        _updateAllTermsStatus();
                      });
                    },
                    title: Row(
                      children: [
                        const Text('(선택) 마케팅 정보 수신 동의', style: TextStyle(fontSize: 14)),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            print('마케팅 정보 수신 약관 보기');
                            // 마케팅 정보 수신 약관 보기 화면으로 이동
                          },
                          child: const Text(
                            '보기',
                            style: TextStyle(fontSize: 14, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    dense: true,
                  ),
                ],
              ),
            ),
          ),

          // 다음 버튼
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isNextButtonEnabled
                    ? () {
                  // 다음 화면으로 이동
                  Get.toNamed('/signup/second', arguments: {
                    'marketingConsent': _agreeToMarketingInfo
                  });
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isNextButtonEnabled ? Colors.blue : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  '다음',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 모든 약관에 동의했는지 확인하는 함수
  void _updateAllTermsStatus() {
    _agreeToAllTerms = _agreeToServiceTerms &&
        _agreeToPrivacyPolicy &&
        _agreeToMarketingInfo;
  }
}