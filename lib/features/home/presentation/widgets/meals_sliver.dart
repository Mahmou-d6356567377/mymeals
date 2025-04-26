import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mealsapp/core/routing/app_router.dart';
import 'package:mealsapp/data/models/meals/meals_model.dart';
import 'package:mealsapp/features/home/presentation/widgets/food_card.dart';

class MealsSliver extends StatelessWidget {
  const MealsSliver({
    super.key,
    required this.meals,
  });
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) => FoodCard(
          ontap: () => GoRouter.of(context).push(AppRouter.fooddetailscreen,
              extra: Meal(
                  id: meals[index].id,
                  mealName: meals[index].mealName,
                  description: meals[index].description,
                  imageUrl: meals[index].imageUrl,
                  rate: meals[index].rate,
                  time: meals[index].time)),
          imagePath: meals[index].imageUrl,
          title: meals[index].mealName,
          rating: meals[index].rate,
          cookTime: meals[index].time.toString()),
      itemCount: meals.length,
    );
  }
}
