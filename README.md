# Meals App

A Flutter app that helps you manage and view your meals. The app allows users to explore meal details, and manage their meal data by adding, viewing, and deleting meals. It utilizes a local SQLite database to store and retrieve meal data.

## Features

- View a detailed list of meals.
- Add new meals to your database.
- Delete meals from the database.
- View detailed information for each meal (including image, description, time, and rating).
- Simple and intuitive user interface designed with Flutter.

## Tech Stack

- **Flutter** - Framework for building cross-platform apps.
- **SQLite** - Local database to persist meal data.
- **Provider/Sqflite** - Database management and state management.

## Screenshots

![Meal List](assets/images/meal_list.png)
![Meal Detail](assets/images/meal_detail.png)

## Installation

To run this project locally, follow these steps:

1. **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/mealsapp.git
    cd mealsapp
    ```

2. **Install dependencies**:
    ```bash
    flutter pub get
    ```

3. **Run the app**:
    ```bash
    flutter run
    ```

## Usage

After launching the app, you will see a list of meals. You can:

- Tap on a meal to view its details.
- Delete a meal using the floating action button on the detail page.
- Add new meals (this feature could be added later or is currently in progress).

## Database Setup

The app uses an SQLite database to store the meal information. The database operations are handled by the `SqfliteService` class, which includes methods for opening the database, adding, and deleting meals.

## Contributing

Feel free to fork this repo and contribute! Open an issue or create a pull request if you have any suggestions or improvements.


