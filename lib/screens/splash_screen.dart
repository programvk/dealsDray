import "dart:async";
import "package:deals_dray/constants.dart";
import "package:deals_dray/services/api_request.dart";
import "package:flutter/material.dart";
import "../models/device_info.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    sendDeviceInfo().then(
      (_) => Navigator.of(context).pushReplacementNamed("/loginScreen"),
    );
    super.initState();
  }

  Future<void> sendDeviceInfo() async {
    AppInfo appInfo = AppInfo(
      version: "1.20.5",
      installTimeStamp: DateTime.parse("2022-02-10T12:33:30.696Z"),
      uninstallTimeStamp: DateTime.parse("2022-02-10T12:33:30.696Z"),
      downloadTimeStamp: DateTime.parse("2022-02-10T12:33:30.696Z"),
    );

    DeviceInfo deviceInfo = DeviceInfo(
      deviceType: "android",
      deviceId: "C6179909526098",
      deviceName: "Samsung-MT200",
      deviceOSVersion: "2.3.6",
      deviceIPAddress: "11.433.445.66",
      lat: 9.9312,
      long: 76.2673,
      app: appInfo,
    );
    await Future.delayed(const Duration(seconds: 2));
    APIRequest().postRequest(splashAPI, deviceInfo.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
            tag: "splash-logo", child: Image.asset("assets/images/logo.png")),
      ),
    );
  }
}
