import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:authcheck/src/utils/theme/theme.dart';

class HomePage extends GetView {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryBgColor,
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'Notedly',
            style: AppFonts.logoFontBlack(20),
          ),
          centerTitle: true,
          backgroundColor: AppColors.primaryBgColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Notes',
              style: AppFonts.boldFontBlack(20),
            ),
          ],
        ));
  }
}
