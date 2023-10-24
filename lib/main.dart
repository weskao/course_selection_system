import 'package:course_selection_system/src/core/theme/brightness/AppBrightness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'MyApp.dart';

void main() {
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  binding.renderView.automaticSystemUiAdjustment = false;
  setLightThemeStyle();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
