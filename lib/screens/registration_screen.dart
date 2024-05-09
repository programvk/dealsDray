import "package:deals_dray/constants.dart";
import "package:deals_dray/services/api_request.dart";
import "package:flutter/material.dart";

import "../models/registration.dart";

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();
  bool securePassword = true;

  Future<void> registerNewUser() async {
    Registration reg = Registration(
        email: _emailController.text,
        password: _passwordController.text,
        referralCode: int.parse(_referralCodeController.text),
        userId: '62a833766ec5dafd6780fc85');
    APIRequest().postRequest(referralAPI, reg.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("/loginScreen");
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const Text(
                "Let's Begin!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Please enter your credentials to proceed",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: "Your Email",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordController,
                obscureText: securePassword,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.remove_red_eye),
                      onPressed: () {
                        if (securePassword == true) {
                          setState(() {
                            securePassword = false;
                          });
                        } else {
                          setState(() {
                            securePassword = true;
                          });
                        }
                      },
                    ),
                    suffixIconColor:
                        securePassword ? Colors.grey : Colors.blueAccent,
                    hintText: "Create Password",
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _referralCodeController,
                decoration: const InputDecoration(
                    hintText: "Referral Code(optional)",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    registerNewUser();
                    Navigator.of(context).pushNamed("/bottomAppBarScreen");
                  },
                  style: kTextButtonStyle,
                  child: const Icon(Icons.arrow_right_alt),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
