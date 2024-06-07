import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/constants/app_string.dart';
import 'core/constants/app_theme.dart';
import 'core/router/router_imports.dart';
import 'core/router/router_paths.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(480, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppString.appName,
            theme: AppThemes.lightTheme,
            themeMode: ThemeMode.light,
            initialRoute: RouterPaths.initializer,
            getPages: GeneratedPages.pages,
          );
        });
  }
}
