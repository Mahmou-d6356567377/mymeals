import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mealsapp/core/routing/app_router.dart';
import 'package:mealsapp/data/models/meals/meals_model.dart';
import 'package:mealsapp/data/remote/sqflite_service.dart';
import 'package:mealsapp/features/home/presentation/widgets/custom_FAB.dart';
import 'package:mealsapp/features/home/presentation/widgets/custom_sliver_AppBar.dart';
import 'package:mealsapp/features/home/presentation/widgets/meals_sliver.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final SqfliteService sqfliteService = SqfliteService();
  Future<List<Meal>> _fetchMeals() async {
    final db = await sqfliteService.openMealDatabase();
    return sqfliteService.getAllMeals(db);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFAB(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.addmealscreen);
        },
      ),
      body: CustomScrollView(slivers: [
        CustomSliverAppBar(),
        FutureBuilder(
            future:_fetchMeals(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
               final meals = snapshot.data!;
                return MealsSliver(meals: meals);
              } else {
                return const SliverToBoxAdapter();
              }
            })
      ]),
    );
  }
}
