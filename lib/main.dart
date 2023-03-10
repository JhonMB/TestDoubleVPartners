import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/utils/app_theme.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

import 'injection_container.dart' as di;
import 'package:flutter_test_project/navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      title: 'Test Project',
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.generateRoute,
      supportedLocales: const [Locale('es', ''), Locale('en', '')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    );
  }
}
