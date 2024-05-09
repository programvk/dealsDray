import "dart:async";
import "package:deals_dray/constants.dart";
import "package:deals_dray/models/otp_verification.dart";
import "package:deals_dray/services/api_request.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

class OTPScreen extends StatefulWidget {
  final String phoneNumber;
  const OTPScreen({super.key, required this.phoneNumber});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());
  int _start = 120;
  bool _enableResend = false;
  bool _isVerifying = false;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    startTimer();
    for (var controller in controllers) {
      controller.addListener(checkAndVerifyOTP);
    }
  }

  Future<void> verifyOTP() async {}

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          _enableResend = true;
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void resendOTP() {
    setState(() {
      _start = 120;
      _enableResend = false;
    });

    startTimer();
  }

  void checkAndVerifyOTP() async {
    String otp = controllers.map((e) => e.text).join();
    var navigator = Navigator.of(context);
    if (otp.length == controllers.length) {
      setState(() {
        _isVerifying = true;
      });
      // Simulate OTP verification
      OtpVerification otpVerify = OtpVerification(
          otp: otp,
          deviceId: "62b43472c84bb6dac82e0504",
          userId: "62b43547c84bb6dac82e0525");
      APIRequest().postRequest(otpVerificationAPI, otpVerify.toJson());
      await Future.delayed(const Duration(seconds: 2));
      bool isValid = true; // Assume OTP is always correct for this demo
      if (isValid) {
        navigator.pushNamed("/registrationScreen");
      } else {
        //implement the login if invalid otp
      }
    }
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: SizedBox(
                  height: 100,
                  child: Image.asset("assets/images/phone-otp.png")),
            ),
            const SizedBox(
              height: 10,
            ),
            const Flexible(
              child: Text(
                "OTP Verification",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              child: Text(
                "We have sent a unique OTP number to your mobile +91${widget.phoneNumber}",
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(controllers.length, (index) {
                  return SizedBox(
                    width: 50,
                    child: TextField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: "",
                        border: const OutlineInputBorder().copyWith(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                      ),
                      onChanged: (value) {
                        if (value.length == 1 &&
                            index < controllers.length - 1) {
                          focusNodes[index + 1].requestFocus();
                        }
                        if (value.isEmpty && index > 0) {
                          focusNodes[index - 1].requestFocus();
                        }
                      },
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Time remaining: ${_start}s"),
                  TextButton(
                    onPressed: _enableResend ? resendOTP : null,
                    style: kTextButtonStyle,
                    child: const Text("Send Again"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _isVerifying
                ? const CircularProgressIndicator()
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
