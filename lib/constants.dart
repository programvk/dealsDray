import 'package:flutter/material.dart';

const splashAPI = 'http://devapiv3.dealsdray.com/api/v2/user/device/add';
const loginWithOtpAPI = 'http://devapiv3.dealsdray.com/api/v2/user/otp';
const otpVerificationAPI =
    'http://devapiv3.dealsdray.com/api/v2/user/otp/verification';
const referralAPI = 'http://devapiv3.dealsdray.com/api/v2/user/email/referral';
const homeDataAPI =
    'http://devapiv3.dealsdray.com/api/v2/user/home/withoutPrice';

const List<String> imgList = [
  'https://i.pinimg.com/736x/23/34/1f/23341f65daa921a20072874cdd1dc360.jpg',
  'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/341ae0101734845.5f25c14e05cf4.png',
  'https://fecredit.com.vn/wp-content/uploads/2018/07/20180725_MS_CD_PromotionT7_Oppo_ContentBanner-1348x500.jpg',
];

const List<String> exclusiveOfferImageList = [
  'https://www.vivoglobal.ph/wp-content/uploads/2022/02/v23e-5g-sunshine-coast.png',
  'https://www.vivoglobal.ph/wp-content/uploads/2021/05/v21-5g-dusk-blue.jpg',
  'https://www.vivoglobal.ph/wp-content/uploads/2021/05/v21-5g-dusk-blue.jpg',
  'https://www.vivoglobal.ph/wp-content/uploads/2021/05/v21-5g-dusk-blue.jpg',
];

const List<String> iconNameList = ["Mobile", "Laptop", "Camera", "LED"];
const List<Icon> iconList = [
  Icon(
    Icons.phone_android_sharp,
    color: Colors.white,
  ),
  Icon(
    Icons.laptop_mac_rounded,
    color: Colors.white,
  ),
  Icon(
    Icons.camera_alt_outlined,
    color: Colors.white,
  ),
  Icon(
    Icons.lightbulb_outline_sharp,
    color: Colors.white,
  )
];
const List<Gradient> iconColor = [
  LinearGradient(
      colors: [Colors.blue, Colors.blueAccent],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight),
  LinearGradient(
      colors: [Colors.green, Colors.greenAccent],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight),
  LinearGradient(
      colors: [Colors.pink, Colors.pinkAccent],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight),
  LinearGradient(
      colors: [Colors.orange, Colors.orangeAccent],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight),
];

ButtonStyle kTextButtonStyle = TextButton.styleFrom(
  foregroundColor: Colors.white,
  backgroundColor: Colors.red,
  disabledBackgroundColor: Colors.red.shade200,
  disabledForegroundColor: Colors.grey.shade200,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ), // Text color
  padding: const EdgeInsets.symmetric(
      horizontal: 20.0, vertical: 10.0), // Padding inside the button
);

ButtonStyle kChatButtonStyle = TextButton.styleFrom(
  foregroundColor: Colors.white,
  backgroundColor: Colors.red,
  disabledBackgroundColor: Colors.red.shade200,
  disabledForegroundColor: Colors.grey.shade200,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
        bottomRight: Radius.circular(25),
        bottomLeft: Radius.circular(0)),
  ), // Text color
  padding: const EdgeInsets.symmetric(
      horizontal: 20.0, vertical: 10.0), // Padding inside the button
);
