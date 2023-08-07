import 'package:authcheck/src/features/authentication/controllers/authcontroller.dart';
import 'package:authcheck/src/utils/helper/helper_widget.dart';
import 'package:authcheck/src/utils/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<AuthController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool pwd1isHidden = true.obs;
    final _formKey = GlobalKey<FormState>();
    final controller = Get.put(AuthController());
    return Scaffold(
      backgroundColor: AppColors.primaryBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.secondaryColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Notedly',
          style: AppFonts.logoFontBlack(20),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  vSpace(67),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Create a free account',
                      textAlign: TextAlign.center,
                      style: AppFonts.boldFontBlack(24),
                    ),
                  ),
                  vSpace(5),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Join Notely for free. Create and share \nunlimited notes with your friends.',
                      style: AppFonts.smallFontBlack(16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  vSpace(52),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Full Name',
                          style: AppFonts.boldFontBlack(16),
                        ),
                        vSpace(8),

                        // Input field
                        TextFormField(
                          controller: controller.fullName,
                          style: AppFonts.smallFontBlack(15),
                          validator: (value) {
                            if (GetUtils.isNum(value!)) {
                              return "Full name can only contain alphabets";
                            } else if (GetUtils.isLengthLessThan(value, 3)) {
                              return "Enter Full Name";
                            } else if (GetUtils.isOneAKind(value)) {
                              return "Not a valid Full Name";
                            } else if (!GetUtils.hasMatch(value, r" \w{3,}")) {
                              return "Not a valid Full Name";
                            } else {
                              return null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Enter Name',
                          ),
                        ),
                      ],
                    ),
                  ),
                  vSpace(21),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email Address',
                          style: AppFonts.boldFontBlack(16),
                        ),
                        vSpace(10),
                        TextFormField(
                          controller: controller.email,
                          validator: (value) {
                            if (value == '') {
                              return 'Enter Email';
                            } else if (!GetUtils.isEmail(value!)) {
                              return 'Invalid Email Address';
                            } else {
                              return null;
                            }
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          style: AppFonts.smallFontBlack(15),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Enter Email Address',
                          ),
                        ),
                      ],
                    ),
                  ),
                  vSpace(21),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: AppFonts.boldFontBlack(16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => TextFormField(
                            controller: controller.password,
                            validator: (value) {
                              if (value == '') {
                                return "Enter Password";
                              } else if (GetUtils.isLengthLessThan(value, 8)) {
                                return "Password must be 8 characters or more";
                              } else if (GetUtils.isAlphabetOnly(value!)) {
                                return "Password Must Contain at least 1 Number";
                              } else if (GetUtils.isNumericOnly(value)) {
                                return "Password Must Contain at least 1 Alphabet";
                              } else if (GetUtils.isOneAKind(value)) {
                                return "Password Must Contain at least 1 Alphabet and 1 Number";
                              } else {
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: pwd1isHidden.value,
                            keyboardType: TextInputType.visiblePassword,
                            style: AppFonts.smallFontBlack(14),
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: pwd1isHidden.value
                                  ? InkWell(
                                      onTap: () => {pwd1isHidden.value = false},
                                      child: const Icon(
                                        CupertinoIcons.eye_slash,
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () => {pwd1isHidden.value = true},
                                      child: const Icon(
                                        CupertinoIcons.eye,
                                      ),
                                    ),
                              hintText:
                                  'Password must be 8 characters or more!',
                              suffixIconColor: AppColors.secondaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  vSpace(65),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          AuthController.instance.registerUser(
                            'j@mb.com',
                            '12345678',
                          );
                        } else {
                          null;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 17),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: Text(
                        'Create Account',
                        style: AppFonts.whiteFontBlack(20),
                      ),
                    ),
                  ),
                  vSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: AppFonts.boldFontBlack(15),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/loginpage');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Login',
                              style: AppFonts.secFontPitch(15),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
