import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mealsapp/data/models/meals/meals_model.dart';
import 'package:mealsapp/data/remote/sqflite_service.dart';
import 'package:sqflite/sqflite.dart';

class FoodDetailScreen extends StatelessWidget {
  final Meal meal;

  FoodDetailScreen({super.key, required this.meal});

  final SqfliteService _sqfliteService = SqfliteService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () async {
          Database database = await _sqfliteService.openMealDatabase();
          await _sqfliteService.deleteMeal(database, meal.id);
          GoRouter.of(context).pop();
        },
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Image with Back Button
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.r),
                    bottomRight: Radius.circular(25.r),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 300.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.8),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Title & Details
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    '${meal.mealName} 🍔',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Time & Rating
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.access_time,
                            size: 20, color: Colors.orange),
                        const SizedBox(width: 5),
                        Text(meal.time.toString()),
                        const Spacer(),
                        const Icon(Icons.star, size: 20, color: Colors.orange),
                        const SizedBox(width: 5),
                        Text(meal.rate.toString()),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  Divider(height: 1.h, color: Colors.grey[400]),
                  // Descriptio,n
                  const SizedBox(height: 8),
                  const Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    meal.description,
                    style: TextStyle(color: Colors.grey[700], fontSize: 15.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
