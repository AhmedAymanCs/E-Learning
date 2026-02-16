import 'package:e_learning/core/contant/string_manager.dart';
import 'package:e_learning/core/di/service_locator.dart';
import 'package:e_learning/core/routing/app_router.dart';
import 'package:e_learning/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDioLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: StringManager.appName,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.homeRoute,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
