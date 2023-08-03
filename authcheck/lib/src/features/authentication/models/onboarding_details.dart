import 'package:authcheck/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';

class OnboardingPageModel {
  final String title;
  final String description;
  final String image;
  final Color bgColor;

  OnboardingPageModel({
    required this.title,
    required this.description,
    required this.image,
    this.bgColor = AppColors.primaryBgColor,
  });
}
