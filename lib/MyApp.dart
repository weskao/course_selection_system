import 'package:course_selection_system/src/presentation/widgets/common/BaseApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'InitialPage.dart';
import 'generated/l10n.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final enableFullScreenBlockerProvider = StateProvider.autoDispose<bool>((ref) => false);

class MyApp extends StatelessWidget {
  final Function(BuildContext)? beforeLoadFirstPage;

  const MyApp({Key? key, this.beforeLoadFirstPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return ScreenUtilInit(
            useInheritedMediaQuery: true,
            designSize: const Size(375, 734),
            // minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return BaseApp(
                    navigatorKey: navigatorKey,
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    home: const InitialPage(),
                  );
                },
              );
            });
      },
    );
  }
}
