// onboarding_page.dart

import 'package:authcheck/src/features/authentication/controllers/authcontroller.dart';
import 'package:authcheck/src/utils/helper/helper_widget.dart';
import 'package:authcheck/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBgColor,
        elevation: 0.0,
        title: Center(
          child: Text(
            'Notedly',
            style: AppFonts.logoFontBlack(20),
          ),
        ),
      ),
      body: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
        duration: const Duration(milliseconds: 250),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              vSpace(10),
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.pages.length,
                  onPageChanged: controller.onPageChanged,
                  itemBuilder: (context, index) {
                    final page = controller.pages[index];
                    return Column(
                      children: [
                        vSpace(10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Image.asset(
                              page.image,
                            ),
                          ),
                        ),
                        vSpace(20),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 32.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  page.title,
                                  textAlign: TextAlign.center,
                                  style: AppFonts.boldFontBlack(24),
                                ),
                                vSpace(17),
                                Text(
                                  page.description,
                                  textAlign: TextAlign.center,
                                  style: AppFonts.smallFontBlack(16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.pages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width:
                            index == controller.currentPage.value ? 20.0 : 4.0,
                        height: 4.0,
                        margin: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/welcomepage');
                      },
                      child: Text(
                        "Skip",
                        style: AppFonts.secFontPitch(14),
                      ),
                    ),
                    TextButton(
                      onPressed: controller.onNextPage,
                      child: Text(
                        controller.isLastPage ? "Finish" : "Next",
                        style: AppFonts.secFontPitch(14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
