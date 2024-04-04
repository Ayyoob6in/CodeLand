import 'package:codeland/core/constants/constant_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginText1 extends StatelessWidget {
  const LoginText1({super.key, required this.text, this.textColor = fBlack});

  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 12, color: textColor)));
  }
}
