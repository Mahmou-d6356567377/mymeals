import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealsapp/data/models/details_screen/details_screen_model.dart';

class FoodDetailScreen extends StatelessWidget {
  final DetailsScreenModel detailsScreenModel;

  const FoodDetailScreen({
    super.key,
    required this.detailsScreenModel
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Image.asset(
                    detailsScreenModel.imagePath,
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
                    '${detailsScreenModel.title} 🍔',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Time & Rating
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.access_time, size: 20, color: Colors.orange),
                        const SizedBox(width: 5),
                        Text(detailsScreenModel.duration),
                        const Spacer(),
                        const Icon(Icons.star, size: 20, color: Colors.orange),
                        const SizedBox(width: 5),
                        Text(detailsScreenModel.rating.toString()),
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
                    detailsScreenModel.description,
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
