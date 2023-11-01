import 'package:flutter/material.dart';

extension ListWidgetSpaceBetweenExtension on List<Widget> {
  List<Widget> withSpaceBetween({double? width, double? height, bool addSpaceForLast = false}) => [
        for (int i = 0; i < length; i++) ...[
          this[i],
          if (i < length - 1 || (i == length - 1 && addSpaceForLast)) SizedBox(width: width, height: height),
        ]
      ];
}
