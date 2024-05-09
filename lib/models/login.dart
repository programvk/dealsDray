class Login {
  final String mobileNumber;
  final String deviceId;

  Login({required this.mobileNumber, required this.deviceId});
  Map<String, dynamic> toJson() =>
      {"mobileNumber": mobileNumber, "deviceId": deviceId};
}
