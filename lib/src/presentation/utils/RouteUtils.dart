import 'package:flutter/cupertino.dart';

Route getCupertinoPageRoute(String tag, Widget page, {int? arguments}) {
  return PageRouteBuilder(
    fullscreenDialog: true,
    settings: RouteSettings(name: tag, arguments: arguments),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return _slideBothPageTransition(context, animation, secondaryAnimation, PageMoveDirection.rtl, Axis.horizontal, child);
    },
    transitionDuration: const Duration(milliseconds: 150),
    reverseTransitionDuration: const Duration(milliseconds: 150),
  );
}

Widget _slideBothPageTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  PageMoveDirection newPageMoveDirection,
  Axis axis,
  Widget child,
) {
  final slideTween = Tween<Offset>(
    begin: axis == Axis.horizontal
        ? newPageMoveDirection == PageMoveDirection.ltr
            ? const Offset(-1, 0)
            : const Offset(1, 0)
        : newPageMoveDirection == PageMoveDirection.ltr
            ? const Offset(0, -1)
            : const Offset(0, 1),
    end: const Offset(0, 0),
  );
  final secondarySlideTween = Tween<Offset>(
    begin: const Offset(0, 0),
    end: axis == Axis.horizontal
        ? newPageMoveDirection == PageMoveDirection.ltr
            ? const Offset(0.5, 0)
            : const Offset(-0.5, 0)
        : newPageMoveDirection == PageMoveDirection.ltr
            ? const Offset(0, 0.5)
            : const Offset(0, -0.5),
  );

  return SlideTransition(
    position: slideTween.animate(animation),
    child: SlideTransition(
      position: secondarySlideTween.animate(secondaryAnimation),
      child: child,
    ),
  );
}

enum PageMoveDirection {
  /// The page move from right to left
  rtl,

  /// The page move from left to right
  ltr,
}
