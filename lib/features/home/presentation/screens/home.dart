import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mealsapp/core/routing/app_router.dart';
import 'package:mealsapp/data/models/details_screen/details_screen_model.dart';
import 'package:mealsapp/features/home/presentation/widgets/custom_FAB.dart';
import 'package:mealsapp/features/home/presentation/widgets/food_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFAB(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.addmealscreen);
        },
      ),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          expandedHeight: 200.h,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'assets/images/packpic.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) => FoodCard(
              ontap: () => GoRouter.of(context).push(AppRouter.fooddetailscreen,
                  extra: DetailsScreenModel(
                      title: 'Cheese Burger',
                      imagePath: 'assets/images/packpic.png',
                      duration: '20-30 min',
                      rating: 4.5,
                      description:
                          'Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.')),
              imagePath: 'assets/images/packpic.png',
              title: 'Cheese Burger',
              rating: 4.5,
              cookTime: '20-30 min'),
          itemCount: 20,
        ),
      ]),
    );
  }
}
