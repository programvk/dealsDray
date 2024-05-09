class OtpVerification {
  final String otp;
  final String deviceId;
  final String userId;

  OtpVerification(
      {required this.otp, required this.deviceId, required this.userId});
  Map<String, dynamic> toJson() =>
      {"otp": otp, "deviceId": deviceId, "userId": userId};
}
