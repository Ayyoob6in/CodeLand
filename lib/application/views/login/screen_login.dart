import 'package:codeland/application/views/home/screen_home.dart';
import 'package:codeland/application/views/login/widgets/login_text1_widget.dart';
import 'package:codeland/application/views/login/widgets/textfield_widget.dart';
import 'package:codeland/application/views/login/widgets/underlined_text.dart';
import 'package:codeland/application/widgets/submibutton_widget.dart';
import 'package:codeland/core/constants/constant_color.dart';
import 'package:codeland/core/constants/constant_size.dart';
import 'package:codeland/data/model/login/login_model.dart';
import 'package:codeland/data/service/loginservice.dart';
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
                    verifyLogin(context);
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

  void verifyLogin(BuildContext context) async {
    String userName = _userNameController.text;
    String password = _passwordController.text;

    try {
      // Call the login service
      LoginResponse response = await LoginService.login(userName, password);

      // Check if login was successful
      if (response.statusCode == 200 || response.statusCode == 202) {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => ScreenHome(),
          ),
        );

        // Show success message
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text("Login Successful!"),
          ),
        );
      } else {
        // Show error message if login fails
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Invalid username or password! Please try again."),
          ),
        );
      }
    } catch (e) {
      // ignore: avoid_print
      print("Error during login: $e");
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Invalid username or password! Please try again")));
      // Handle error, show error message, etc.
    }
  }
}
