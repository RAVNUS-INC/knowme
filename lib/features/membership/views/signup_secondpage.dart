import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupSecondPage extends StatefulWidget {
  const SignupSecondPage({Key? key}) : super(key: key);

  @override
  State<SignupSecondPage> createState() => _SignupSecondPageState();
}

class _SignupSecondPageState extends State<SignupSecondPage> {
  // 마케팅 정보 수신 동의 상태 (첫 번째 페이지에서 전달받음)
  bool _marketingConsent = false;

  // 텍스트 컨트롤러
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _phoneController = TextEditingController();

  // 비밀번호 표시/숨김 상태
  bool _obscurePassword = false;
  bool _obscurePasswordConfirm = false;

  // 입력값 유효성 검사 상태
  bool _isIdValid = false;
  bool _isPasswordValid = false;
  bool _isPasswordConfirmValid = false;
  bool _isPhoneValid = false;

  // 다음 버튼 활성화 상태 확인
  bool get _isNextButtonEnabled =>
      _isIdValid && _isPasswordValid && _isPasswordConfirmValid &&
          _isPhoneValid;

  @override
  void initState() {
    super.initState();
    // 첫 번째 페이지에서 전달된 마케팅 정보 수신 동의 상태 가져오기
    if (Get.arguments != null && Get.arguments is Map) {
      _marketingConsent = Get.arguments['marketingConsent'] ?? false;
    }

    // 텍스트 필드 리스너 등록
    _idController.addListener(_validateId);
    _passwordController.addListener(_validatePassword);
    _passwordConfirmController.addListener(_validatePasswordConfirm);
    _phoneController.addListener(_validatePhone);
  }

  @override
  void dispose() {
    // 컨트롤러 해제
    _idController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  // 아이디 유효성 검사
  void _validateId() {
    final id = _idController.text;
    final hasMinLength = id.length >= 6;  // 6자 이상
    final hasLetters = id.contains(RegExp(r'[A-Za-z]'));  // 영문자 포함
    final hasDigits = id.contains(RegExp(r'[0-9]'));  // 숫자 포함

    setState(() {
      _isIdValid = hasMinLength && hasLetters && hasDigits;
    });
  }

  // 비밀번호 유효성 검사
  void _validatePassword() {
    final password = _passwordController.text;
    // 비밀번호는 최소 8자 이상, 영문자, 숫자, 특수문자 포함
    final hasMinLength = password.length >= 8;
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasLowercase = password.contains(RegExp(r'[a-z]'));
    final hasDigits = password.contains(RegExp(r'[0-9]'));
    final hasSpecialCharacters = password.contains(
        RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    setState(() {
      _isPasswordValid =
          hasMinLength && (hasUppercase || hasLowercase) && hasDigits;
      // 비밀번호가 변경되면 비밀번호 확인도 다시 검사
      _validatePasswordConfirm();
    });
  }

  // 비밀번호 확인 유효성 검사
  void _validatePasswordConfirm() {
    setState(() {
      _isPasswordConfirmValid =
          _passwordController.text == _passwordConfirmController.text &&
              _passwordConfirmController.text.isNotEmpty;
    });
  }

  // 전화번호 유효성 검사
  void _validatePhone() {
    final phone = _phoneController.text;
    // 정규식을 사용한 전화번호 형식 검사 (예: 010-1234-5678)
    setState(() {
      _isPhoneValid = phone.length >= 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 키보드 숨기기
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                color: Colors.blue,
                fontSize: 17,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.black),
              onPressed: () => Get.offAllNamed('/login'),
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
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 5),
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
              ],
            ),
            const SizedBox(height: 30),

            // 폼 필드
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 아이디 입력 필드
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: '아이디 ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const TextSpan(
                            text: '*',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _idController,
                      decoration: InputDecoration(
                        hintText: '아이디를 입력해 주세요',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 14),
                        suffixIcon: _isIdValid
                            ? const Icon(Icons.check_circle, color: Colors.blue)
                            : null,
                      ),
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      '아이디는 6자 이상, 영문, 숫자를 각각 1자 이상 포함해야 합니다',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 비밀번호 입력 필드
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: '비밀번호 ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const TextSpan(
                            text: '*',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        hintText: '비밀번호를 입력해 주세요',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (_isPasswordValid)
                              const Icon(Icons.check_circle, color: Colors.blue),
                            IconButton(
                              icon: Icon(
                                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      '영문, 숫자를 포함한 8자 이상이어야 합니다',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 비밀번호 확인 입력 필드
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: '비밀번호 확인 ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const TextSpan(
                            text: '*',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _passwordConfirmController,
                      obscureText: _obscurePasswordConfirm,
                      decoration: InputDecoration(
                        hintText: '비밀번호를 입력해 주세요',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (_isPasswordConfirmValid)
                              const Icon(Icons.check_circle, color: Colors.blue),
                            IconButton(
                              icon: Icon(
                                _obscurePasswordConfirm ? Icons.visibility_off : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePasswordConfirm = !_obscurePasswordConfirm;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 휴대폰 번호 입력 필드
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: '휴대폰 번호 ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const TextSpan(
                            text: '*',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              hintText: '휴대폰번호를 입력해 주세요',
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.blue),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 14),
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 100,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: _isPhoneValid ? () {
                              print('인증번호 발송');
                              // 인증번호 발송 로직
                            } : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              '인증번호',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // 인증번호 입력 필드
                    TextField(
                      decoration: InputDecoration(
                        hintText: '인증번호를 입력해 주세요',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 14),
                      ),
                      keyboardType: TextInputType.number,
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
                    Get.toNamed('/signup/third', arguments: {
                      'marketingConsent': _marketingConsent,
                      'userId': _idController.text,
                      'password': _passwordController.text,
                      'phoneNumber': _phoneController.text,
                    });
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isNextButtonEnabled ? Colors.blue : Colors
                        .grey[400],
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
      ),
    );
  }
}