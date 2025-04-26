class Meal {
  final int id; // optional because it'll be auto-generated
  final String mealName;
  final String description;
  final String imageUrl;
  final double rate;
  final int time;

  Meal({
    required this.id,
    required this.mealName,
    required this.description,
    required this.imageUrl,
    required this.rate,
    required this.time,
  });

  // Convert a Meal into a Map (for inserting into the db)
  Map<String, dynamic> toMap() {
    return {
      'mealName': mealName,
      'description': description,
      'imageUrl': imageUrl,
      'rate': rate,
      'time': time,
    };
  }

  // Create a Meal from a Map (for reading from the db)
  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'],
      mealName: map['mealName'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      rate: map['rate'],
      time: map['time'],
    );
  }
}
