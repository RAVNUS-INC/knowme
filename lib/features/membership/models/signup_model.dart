class SignupAgreementModel {
  bool agreeToServiceTerms;
  bool agreeToPrivacyPolicy;
  bool agreeToMarketingInfo;

  SignupAgreementModel({
    this.agreeToServiceTerms = false,
    this.agreeToPrivacyPolicy = false,
    this.agreeToMarketingInfo = false,
  });

  bool get allAgreed =>
      agreeToServiceTerms && agreeToPrivacyPolicy && agreeToMarketingInfo;
}

class SignupUserModel {
  String userId;
  String password;
  String phoneNumber;

  SignupUserModel({
    this.userId = '',
    this.password = '',
    this.phoneNumber = '',
  });
}