import 'package:course_selection_system/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 22),
      child: Assets.images.iconLeftArrow.image(
        width: 18,
        height: 18,
        color: Colors.black,
      ),
    );
  }
}
