import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(30),
      child: const SpinKitFoldingCube(
        color: Color.fromRGBO(0, 174, 212, 1),
        size: 48,
        // controller: AnimationController(
        //     vsync: this, duration: const Duration(milliseconds: 1200)
        //     ),
      ),
    );
  }
}
