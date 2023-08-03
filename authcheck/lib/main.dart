import 'package:authcheck/src/data/services/firebase.dart';
import 'package:authcheck/src/features/repository/authentication_repository/authentication_repository.dart';
import 'package:authcheck/src/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await FirebaseService.Init();
  Get.put(AuthenticationRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: AppRoutes.routes,
    );
  }
}
