import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'MyApp.dart';

void main() {
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  binding.renderView.automaticSystemUiAdjustment = false;

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
