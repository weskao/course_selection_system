import 'package:course_selection_system/src/presentation/widgets/PrimaryPage.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryPage(
      title: "講師清單",
      topWidget: Container(),
    );
  }
}
