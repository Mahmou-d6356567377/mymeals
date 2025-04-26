import 'package:mealsapp/data/models/meals/meals_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteService {
  Future<Database> openMealDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'meals.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE Meals(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          mealName TEXT,
          description TEXT,
          imageUrl TEXT,
          rate REAL,
          time INTEGER
        )
      '''); 
      },
    );
  }

// Insert a Meal
  Future<void> insertMeal(Database db, Meal meal) async {
    await db.insert('Meals', meal.toMap());
  }

// Get all Meals
  Future<List<Meal>> getAllMeals(Database db) async {
    final List<Map<String, dynamic>> maps = await db.query('Meals');
    return List.generate(maps.length, (i) {
      print(maps[i]);
      return Meal.fromMap(maps[i]);
    });
  }

// Update a Meal
  Future<int> updateMeal(Database db, Meal meal) async {
    return await db.update(
      'Meals',
      meal.toMap(),
      where: 'id = ?',
      whereArgs: [meal.id],
    );
  }

// Delete a Meal
  Future<int> deleteMeal(Database db, int id) async {
    return await db.delete(
      'Meals',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
