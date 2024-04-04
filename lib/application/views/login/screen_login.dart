import 'package:codeland/application/views/home/screen_home.dart';
import 'package:codeland/application/views/login/widgets/login_text1_widget.dart';
import 'package:codeland/application/views/login/widgets/textfield_widget.dart';
import 'package:codeland/application/views/login/widgets/underlined_text.dart';
import 'package:codeland/application/widgets/submibutton_widget.dart';
import 'package:codeland/core/constants/constant_color.dart';
import 'package:codeland/core/constants/constant_size.dart';
import 'package:flutter/material.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fWhite,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
        child: Form(
          key: _key,
          child: ListView(
            children: [
              Container(
                height: 329,
                width: 219,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/57BF58A9-6DC4-48F8-BCCB-7E96B484D527_1_201_a.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
              fHeight10,
              LoginScreenTextfield(
                controller: _userNameController,
                hintText: "Username",
                errorValidator: (value) {
                  if (value!.isEmpty || value.contains(' ')) {
                    return "Please Enter Username";
                  }
                  return null;
                },
              ),
              fHeight10,
              LoginScreenTextfield(
                controller: _passwordController,
                hintText: "Password",
                errorValidator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  } else if (value.contains(' ')) {
                    return 'Enter valid password';
                  } else {
                    return null;
                  }
                },
              ),
              fHeight20,
              SubmitButton(
                buttonName: "Login",
                buttonPress: () {
                  if (_key.currentState!.validate()) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ScreenHome(),
                    ));
                  }
                },
              ),
              fHeight40,
              const LoginText1(
                text: "For Assistance & Login Details Contact: ",
              ),
              fHeight10,
              const Row(
                children: [
                  LoginText1(text: "English, Kannada & Telugu : "),
                  UnderlinedText(
                    text: "7406333800",
                  ),
                ],
              ),
              const Row(
                children: [
                  LoginText1(text: "English, Kannada & Hindi    : "),
                  UnderlinedText(
                    text: "9071386515",
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: const LoginText1(
                  text: "v1.7 © 2023,Codeland Infosolutions Pvt Ltd.",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
