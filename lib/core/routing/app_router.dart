import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mealsapp/data/models/details_screen/details_screen_model.dart';
import 'package:mealsapp/features/home/presentation/screens/adding_meal_screen.dart';
import 'package:mealsapp/features/home/presentation/screens/details_screen.dart';
import 'package:mealsapp/features/home/presentation/screens/home.dart';
import 'package:mealsapp/features/onboarding/presentation/screens/on_boarding/on_boarding.dart';

class AppRouter {
  static const String onBoardingScreen = '/onboarding';
  static const String home = '/home';
  static const String fooddetailscreen = '/fooddetailscreen';
  static const String addmealscreen = '/addmealscreen';

  
  static final GoRouter router = GoRouter(
      initialLocation: onBoardingScreen,
    routes: <RouteBase>[
      GoRoute(
        path: onBoardingScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const OnBoarding();
        },
      ),
      GoRoute(
        path: home,
        builder: (BuildContext context, GoRouterState state) {
          return const Home();
        },
      ),
      GoRoute(
        path: fooddetailscreen,
        builder: (BuildContext context, GoRouterState state) {
          return  FoodDetailScreen(detailsScreenModel: state.extra! as DetailsScreenModel);
        },
      ),
      GoRoute(
        path: addmealscreen,
        builder: (BuildContext context, GoRouterState state) {
          return  AddMealScreen();
        },
      ),
    ],
  );
}
