import 'dart:io';

import 'package:codeland/core/constants/constant_color.dart';
import 'package:codeland/core/constants/constant_size.dart';
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
          iconTheme: const IconThemeData(color: fWhite),
          title: const Text(
            "IMAGE VIEWER",
            style: TextStyle(
                color: fWhite, fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: image.length,
            itemBuilder: (context, index) {
              var images = image[index];
              return SizedBox(
                height: double.maxFinite,
                width: double.infinity,
                child: Image.file(
                  File(images.path),
                  fit: BoxFit.cover,
                ),
              );
            }));
  }
}
