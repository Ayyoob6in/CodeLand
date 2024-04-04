import 'dart:io';

import 'package:codeland/application/views/bloc/bloc/image_bloc.dart';
import 'package:codeland/application/views/image/screen_image.dart';
import 'package:codeland/core/constants/constant_color.dart';
import 'package:codeland/core/constants/constant_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  List<XFile> images = [];
  @override
  Widget build(BuildContext context) {
    final imageBloc = BlocProvider.of<ImageBloc>(context);
    return Scaffold(
        backgroundColor: fWhite,
        body: SafeArea(
          child: Column(
            children: [
              fHeight40,
              Container(
                alignment: Alignment.topCenter,
                child: const Text(
                  "Upload a Image",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 16, color: fBlack),
                ),
              ),
              fHeight40,
              Column(children: [
                Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () async {
                          final ImagePicker _picker = ImagePicker();
                          images = await _picker.pickMultiImage();
                          imageBloc.add(OnSelectedImageEvent(images));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 509,
                          width: 296,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 0.5,
                                    spreadRadius: 0.5)
                              ],
                              borderRadius: BorderRadius.circular(20)),
                          child: BlocBuilder<ImageBloc, ImageState>(
                              builder: (context, state) => state.images != null
                                  ? ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      itemCount: state.images!.length,
                                      itemBuilder: (ctx, index) => Container(
                                          margin: const EdgeInsets.only(
                                              left: 5, right: 5),
                                          height: 509,
                                          width: 296,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: Image.file(
                                              File(
                                                state.images![index].path,
                                              ),
                                              fit: BoxFit.fitWidth,
                                            ),
                                          )))
                                  : Image.asset("assets/container.jpeg")),
                        ),
                      )),
                ]),
              ]),
              Padding(
                padding: const EdgeInsets.only(left: 65, top: 40, right: 65),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        images = await picker.pickMultiImage();
                        imageBloc.add(OnSelectedImageEvent(images));
                      },
                      child: Container(
                        height: 35,
                        width: 119,
                        decoration: BoxDecoration(
                            color: appColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                          child: Text(
                            "Upload",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ScreenImage(image: images)));
                      },
                      child: Container(
                        height: 35,
                        width: 119,
                        decoration: BoxDecoration(
                            color: Color(0xFFD3D3D6),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                          child: Text(
                            "View",
                            style: TextStyle(
                                color: fBlack,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
