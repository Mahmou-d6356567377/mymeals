import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mealsapp/data/models/meals/meals_model.dart';
import 'package:mealsapp/data/remote/sqflite_service.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController imageUrlController = TextEditingController();
    final TextEditingController rateController = TextEditingController();
    final TextEditingController timeController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final SqfliteService sqfliteService = SqfliteService();
    final db = sqfliteService.openMealDatabase();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Add Meal'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Meal Name'),
              const SizedBox(height: 8),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Breakfast',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Image URL'),
              const SizedBox(height: 8),
              TextField(
                controller: imageUrlController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Enter image URL',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Rate'),
              const SizedBox(height: 8),
              TextField(
                controller: rateController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '4.5',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Time'),
              const SizedBox(height: 8),
              TextField(
                controller: timeController,
                decoration: InputDecoration(
                  hintText: '20 - 30',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Description'),
              const SizedBox(height: 8),
              TextField(
                controller: descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: '• first\n• second',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () async {
                      final db = await sqfliteService.openMealDatabase();

                      // Create a Meal object
                      final meal = Meal(
                        id: DateTime.now().millisecondsSinceEpoch,
                        mealName: nameController.text,
                        description: descriptionController.text,
                        imageUrl: imageUrlController.text,
                        rate: double.tryParse(rateController.text) ?? 0.0,
                        time: int.tryParse(timeController.text) ?? 0,
                      );

                      sqfliteService.insertMeal(db, meal);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Meal saved successfully!')),
                      );
                        sqfliteService.getAllMeals(db);

                      GoRouter.of(context).pop();
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
