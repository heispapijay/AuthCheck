import 'package:authcheck/src/features/authentication/models/onboarding_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  RxInt index = 0.obs;
  RxString phoneNumber = ''.obs;
  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();

  void registerUser(String email, String password) {}

  void signIp() {
    fullName.value;
  }

  void signUp() {
    fullName.value;
  }
}

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final List<OnboardingPageModel> pages = [
    OnboardingPageModel(
      title: 'World’s Safest And\nLargest Digital Notebook',
      description:
          'Notedly is the world’s safest, largest and intelligent digital notebook. Join over 10M+ users already using Notedly.',
      image: 'assets/images/image0.png',
    ),
    OnboardingPageModel(
      title: 'Easy Access.',
      description:
          'Make list of things you want to get and access them anytime from anywhere without stress.',
      image: 'assets/images/image1.png',
      // bgColor: const Color(0xff1eb090),
    ),
    OnboardingPageModel(
      title: 'Bookmark your favorites notes',
      description: 'Bookmark your favourite quotes to read at a leisure time.',
      image: 'assets/images/image2.png',
      // bgColor: const Color(0xfffeae4f),
    ),
    OnboardingPageModel(
      title: 'Follow creators',
      description: 'Follow your favorite creators to stay in the loop.',
      image: 'assets/images/image3.png',
      // bgColor: Colors.purple,
    ),
  ];

  final RxInt currentPage = 0.obs;

  bool get isLastPage => currentPage.value == pages.length - 1;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void onNextPage() {
    if (isLastPage) {
      Get.offNamed('/welcomepage'); // 'welcome screen.
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
