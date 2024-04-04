import 'dart:io';

import 'package:codeland/core/constants/constant_color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScreenImage extends StatelessWidget {
  const ScreenImage({super.key, required this.image});

  final List<XFile> image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: Text("IMAGE VIEWER"),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.infinity,
        child: Image.file(
          File(image.first.path),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
