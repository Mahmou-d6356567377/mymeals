import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealsapp/core/constants/font_contants.dart';
import 'package:mealsapp/data/models/on_boarding/on_boarding.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent(
      {super.key, required this.onboarding});
  final OnBoardingModel onboarding;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          textAlign: TextAlign.center,
        onboarding.headline,
          style: FontContants.kheadLineWhiteFont.copyWith(fontSize: 30.sp),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            textAlign: TextAlign.center,
            onboarding.sideLine,
            style: TextStyle(fontSize: 16.sp, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
