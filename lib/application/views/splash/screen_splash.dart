import 'package:codeland/application/views/login/screen_login.dart';
import 'package:codeland/core/constants/constant_color.dart';
import 'package:flutter/material.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    gotoLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: Center(
        child: Container(
            height: 320,
            width: 224,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 4,
                      blurStyle: BlurStyle.outer,
                      color: Colors.black,
                      offset: Offset(0.1, 03))
                ],
                border: Border.all(color: appColor),
                color: Colors.white),
            child: Image.asset("assets/screensplash.png")),
      ),
    );
  }

  gotoLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ScreenLogin()));
  }
}
