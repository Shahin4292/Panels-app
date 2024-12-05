import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  final String imageSource;
  final int index;
  final double extent;

  const ImageTile(
      {super.key,
      required this.imageSource,
      required this.index,
      required this.extent});

  @override
  Widget build(BuildContext context) {
    return Image.network(imageSource);
  }
}
