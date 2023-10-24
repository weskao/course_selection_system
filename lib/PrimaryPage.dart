import 'package:course_selection_system/src/presentation/widgets/common/BaseAppBar.dart';
import 'package:flutter/material.dart';

class PrimaryPage extends StatelessWidget {
  final Widget topWidget;
  final String title;
  final Widget? trailing;
  final Color? backgroundColor;
  final bool hasBackButton;
  final List<Color>? backgroundGradientColor;
  final bool fillRemainingSpace;
  final bool hasAppBar;
  final EdgeInsetsGeometry? padding;
  final bool useDefaultArrowBackIcon;
  final FontWeight? titleFontWeight;
  final bool useTopWidgetFillRemainingSpace;
  final double? appBarHeight;

  const PrimaryPage({
    super.key,
    required this.topWidget,
    required this.title,
    this.trailing,
    this.backgroundColor,
    this.hasBackButton = true,
    this.backgroundGradientColor,
    this.fillRemainingSpace = true,
    this.hasAppBar = true,
    this.padding,
    this.useDefaultArrowBackIcon = true,
    this.titleFontWeight,
    this.useTopWidgetFillRemainingSpace = false,
    this.appBarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: hasAppBar
          ? BaseAppBar(
              title: title,
              trailing: trailing,
              hasBackButton: hasBackButton,
              useDefaultArrowBackIcon: useDefaultArrowBackIcon,
              titleFontWeight: titleFontWeight,
              appBarHeight: appBarHeight,
            )
          : null,
      body: SafeArea(
        child: Container(
          padding: padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              useTopWidgetFillRemainingSpace ? Expanded(child: topWidget) : topWidget,
              if (fillRemainingSpace && !useTopWidgetFillRemainingSpace) const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
