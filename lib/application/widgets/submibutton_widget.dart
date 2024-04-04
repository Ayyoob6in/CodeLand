import 'package:codeland/core/constants/constant_color.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.buttonName,
    required this.buttonPress,
  });
  final String buttonName;
  final Function() buttonPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonPress,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: fBlack,
            blurStyle: BlurStyle.outer,
            blurRadius: 3,
            offset: Offset(0, 0.9),
          )
        ], borderRadius: BorderRadius.circular(10), color: appColor),
        child: Center(
            child: Text(
          buttonName,
          style: const TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
