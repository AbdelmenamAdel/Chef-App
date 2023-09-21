import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.image,
    this.boxFit = BoxFit.fill,
    this.h,
    this.w,
  });
  final String image;
  final BoxFit? boxFit;
  final double? h;
  final double? w;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: boxFit,
      height: h,
      width: w,
    );
  }
}
