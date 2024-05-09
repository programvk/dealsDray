class Registration {
  final String email;
  final String password;
  final int referralCode;
  final String userId;

  Registration(
      {required this.email,
      required this.password,
      required this.referralCode,
      required this.userId});

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "referralCode": referralCode,
        "userId": userId
      };
}
