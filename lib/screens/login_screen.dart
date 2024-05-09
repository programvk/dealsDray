import "package:deals_dray/constants.dart";
import "package:deals_dray/screens/otp_screen.dart";
import "package:deals_dray/services/api_request.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "../models/login.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final List<Widget> phoneOrEmail = const <Widget>[
    Text("Phone"),
    Text("Email")
  ];
  final List<bool> _isSelected = <bool>[true, false];
  bool _isEnabled = false;

  Future<void> sendOtp() async {
    Login loginData = Login(
      mobileNumber: _phoneController.text,
      deviceId: "62b341aeb0ab5ebe28a758a3",
    );

    APIRequest().postRequest(loginWithOtpAPI, loginData.toJson());
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            SystemNavigator.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: ToggleButtons(
                    onPressed: (int index) {
                      if (mounted) {
                        setState(() {
                          for (int i = 0; i < phoneOrEmail.length; i++) {
                            _isSelected[i] = i == index;
                          }
                        });
                      }
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    selectedBorderColor: Colors.red,
                    selectedColor: Colors.white,
                    fillColor: Colors.red,
                    color: Colors.black,
                    constraints: const BoxConstraints(
                      minHeight: 50.0,
                      minWidth: 100.0,
                    ),
                    isSelected: _isSelected,
                    children: phoneOrEmail),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Glad to see you!",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Please provide your phone number",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: const InputDecoration(
                  labelText: "Phone",
                  labelStyle: TextStyle(color: Colors.grey),
                  counterText: "",
                ),
                onChanged: (String value) {
                  if (value.length == 10) {
                    setState(() {
                      _isEnabled = true;
                    });
                  } else {
                    setState(() {
                      _isEnabled = false;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: _isEnabled
                      ? () async {
                          sendOtp();
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OTPScreen(
                                phoneNumber: _phoneController.text,
                              ),
                            ),
                          );
                          _phoneController.clear();
                        }
                      : null,
                  style: kTextButtonStyle,
                  child: const Text("SEND CODE"))
            ],
          ),
        ),
      ),
    );
  }
}
