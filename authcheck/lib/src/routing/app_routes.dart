import 'package:authcheck/src/features/authentication/views/login/login_page.dart';
import 'package:authcheck/src/features/authentication/views/signup/signup_page.dart';
import 'package:authcheck/src/features/authentication/views/welcome_screen/welcome_view.dart';
import 'package:get/get.dart';
import 'package:authcheck/src/features/authentication/views/on_boarding/onboarding_page.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(name: '/', page: () => const OnboardingPage()),
    GetPage(name: '/welcomepage', page: () => const WelcomePage()),
    GetPage(name: '/signinpage', page: () => const SignInPage()),
    GetPage(name: '/loginpage', page: () => const LogInPage()),
  ];
}
