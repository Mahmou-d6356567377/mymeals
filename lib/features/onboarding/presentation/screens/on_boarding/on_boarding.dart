import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mealsapp/core/constants/app_constants.dart';
import 'package:mealsapp/core/routing/app_router.dart';
import 'package:mealsapp/data/models/on_boarding/on_boarding.dart';
import 'package:mealsapp/features/onboarding/presentation/widgets/onBoarding_content.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<OnBoardingModel> konboardingData = [
      OnBoardingModel(
          headline: AppConstants.kheadline1,
          sideLine: AppConstants.ksidedline1),
      OnBoardingModel(
          headline: AppConstants.kheadline2,
          sideLine: AppConstants.ksidedline2),
      OnBoardingModel(
          headline: AppConstants.kheadline3,
          sideLine: AppConstants.ksidedline3),
    ];
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/packpic.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 50.h),
              width: MediaQuery.sizeOf(context).width * .8,
              height: MediaQuery.sizeOf(context).height * .5,
              decoration: BoxDecoration(
                color: AppConstants.kprimary,
                borderRadius: BorderRadius.all(Radius.circular(50.r)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                        controller: _controller,
                        itemCount: konboardingData.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return OnboardingContent(
                              onboarding: konboardingData[index]);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: AnimatedSmoothIndicator(
                      activeIndex: _currentIndex,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        dotHeight: 7.h,
                        dotColor: Color(0xffc2c2c2),
                        activeDotColor: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: (_currentIndex != 2)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  _controller.jumpToPage(2);
                                },
                                child: Text(
                                  'Skip',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp),
                                ),
                              ),
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                              ),
                              onPressed: () {
                                GoRouter.of(context).go(AppRouter.home);
                              },
                              child: Icon(
                                Icons.arrow_forward,
                                color: AppConstants.kprimary,
                              ),
                            ),
                          ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
