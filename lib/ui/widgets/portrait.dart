import 'package:flutter/material.dart';
import 'package:tinder_new/util/constants.dart';

class Portrait extends StatelessWidget {
  final String imageUrl;
  final double height;

  const Portrait({super.key, required this.imageUrl, this.height = 225.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height * 0.65,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: kAccentColor),
          borderRadius: const BorderRadius.all(Radius.circular(25.0))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22.0),
        child: imageUrl.isNotEmpty
            ? Image.network(imageUrl, fit: BoxFit.fitHeight)
            : null,
      ),
    );
  }
}
