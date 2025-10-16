# 🏫 Flutter Task — Hassan Kamal AlMosadder

A Flutter application showcasing **Clean Architecture**, **local database management using SQLite**, **state management with Cubit**, and **dependency injection with GetIt**.  
The app is fully responsive and uses structured layers for scalability and maintainability.

---

## 🧱 Architecture Overview

This project follows a **Clean Architecture** and **feature-based** structure to maintain clear separation between the layers:

- **Core Layer:** Contains reusable utilities such as dependency injection, database, routing, helpers, and theme configuration.
- **Feature Layer:** Each feature (e.g., Home, BottomNav, Profile) has its own UI, Cubit, Repository, and data sources.
- **Data Layer:** Handles SQLite database management, migrations, and data seeding from JSON assets.

🧩 Technologies:

- **GetIt** for dependency injection
- **Cubit (flutter_bloc)** for state management
- **Sqflite** for offline data storage
- **Tajawal font** for Arabic typography
- **DevicePreview** for cross-device testing
- **Logger** for organized debugging and app insights

---

## 💾 Local Database (SQLite)

The local database is implemented using **sqflite**, with schema and migrations stored under `assets/sql/`.

### Features

- Database initialization and version upgrades
- Batch SQL execution for efficiency
- Data seeding from JSON files (`assets/seed/`)
- Automatic schema migrations (v1 → v2 → v3)
- Integrated with UI through repositories and Cubits

### Example Structure

    assets/sql/
    ├── 001_init.sql
    └── 002_add_indexes.sql

    assets/seed/
    ├── categories.json
    ├── products.json
    ├── packages.json
    └── package_items.json

---

## 🧠 State Management (Cubit)

Each feature includes a dedicated **Cubit** that handles:

- UI state (loading, success, empty, error)
- Data retrieval from local database
- Reactive updates when data changes

Example:

```dart
class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repo;
  HomeCubit(this._repo) : super(HomeInitial());

  Future<void> loadHomeData() async {
    emit(HomeLoading());
    final data = await _repo.getAllProducts();
    emit(HomeLoaded(data));
  }
}

```
