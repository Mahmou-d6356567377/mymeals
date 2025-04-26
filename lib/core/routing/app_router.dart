import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mealsapp/data/models/meals/meals_model.dart';
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
          return  Home();
        },
      ),
      GoRoute(
        path: fooddetailscreen,
        builder: (BuildContext context, GoRouterState state) {
          return  FoodDetailScreen(meal: state.extra as Meal);
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
