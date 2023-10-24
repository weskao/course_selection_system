import 'package:course_selection_system/src/data/common/constants/AppCommonParam.dart';
import 'package:flutter/material.dart';

import 'ArrowBackButton.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? appBarHeight;
  final String? title;
  final Color? titleTextColor;
  final FontWeight? titleFontWeight;
  final Widget? middle;
  final Widget? trailing;
  final bool hasBackButton;
  final Color? arrowBackButtonColor;
  final Future<dynamic> Function()? onBackCallbackData;
  final bool useDefaultArrowBackIcon;

  const BaseAppBar({
    Key? key,
    this.appBarHeight,
    this.title,
    this.titleTextColor,
    this.titleFontWeight,
    this.middle,
    this.trailing,
    this.hasBackButton = true,
    this.arrowBackButtonColor,
    this.onBackCallbackData,
    this.useDefaultArrowBackIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppCommonParam.appBarHorizontalPadding),
      child: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: getPreferredAppBarHeight(),
        leading: hasBackButton
            ? GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onBackCallbackData != null
                    ? () async {
                        final callbackFunction = onBackCallbackData!;
                        final result = await callbackFunction();
                        if (context.mounted) {
                          Navigator.of(context).pop(result);
                        }
                      }
                    : () {
                        Navigator.of(context).pop();
                      },
                child: const SizedBox(
                  height: double.infinity,
                  child: UnconstrainedBox(
                    child: ArrowBackButton(),
                  ),
                ),
              )
            : const SizedBox.shrink(),
        centerTitle: true,
        title: middle != null
            ? SizedBox(
                width: 300,
                child: middle,
              )
            : Text(
                title ?? "",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: titleFontWeight ?? FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
        actions: [
          UnconstrainedBox(
            child: Align(
              alignment: Alignment.centerRight,
              child: trailing ?? const SizedBox.shrink(),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide.none),
            ),
          ),
        ),
        elevation: 0, // Set elevation to 0 to remove the border
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(getPreferredAppBarHeight());

  double getPreferredAppBarHeight() {
    return appBarHeight ?? AppCommonParam.defaultAppBarHeight;
  }
}
