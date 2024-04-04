import 'package:codeland/application/views/login/widgets/login_text1_widget.dart';
import 'package:codeland/core/constants/constant_color.dart';
import 'package:flutter/material.dart';

class UnderlinedText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color underlineColor;

  const UnderlinedText({
    super.key,
    required this.text,
    this.style = const TextStyle(),
    this.underlineColor = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: underlineColor, width: 1.0),
          ),
        ),
        child: LoginText1(
          text: text,
          textColor: appColor,
        ));
  }
}
