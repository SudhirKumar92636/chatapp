import 'package:flutter/material.dart';

class OtpScreens extends StatefulWidget {
  const OtpScreens({super.key});

  @override
  State<OtpScreens> createState() => _OtpScreensState();
}

class _OtpScreensState extends State<OtpScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Otp Screens"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
    );
  }
}
