import 'package:authcheck/src/utils/helper/helper_widget.dart';
import 'package:authcheck/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends GetView {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryBgColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
                image: const AssetImage('assets/images/image4.png'),
                height: height * 0.5),
            Column(
              children: [
                Text(
                  'WELCOME TO \nNOTEDLY',
                  style: AppFonts.boldFontBlack(30),
                  textAlign: TextAlign.center,
                ),
                vSpace(30),
                Text(
                  'Your personnal AI assistant right inside your phone. Let\'s get more productive with the power of AI!',
                  textAlign: TextAlign.center,
                  style: AppFonts.smallFontBlack(16),
                ),
              ],
            ),
            vSpace(20),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          Get.toNamed('/loginpage');
                        },
                        style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.secondaryColor,
                            side: const BorderSide(
                                color: AppColors.secondaryColor),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            padding: const EdgeInsets.symmetric(vertical: 20)),
                        child: Text("Login".toUpperCase()))),
                hSpace(10),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/signinpage');
                        },
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.secondaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            padding: const EdgeInsets.symmetric(vertical: 20)),
                        child: Text("Sign Up".toUpperCase()))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
