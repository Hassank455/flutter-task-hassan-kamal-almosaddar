# 🏫 Flutter Task — Hassan Kamal AlMosadder

A Flutter application showcasing **Clean Architecture**, **local database management using SQLite**, **state management with Cubit**, and **dependency injection with GetIt**.  
The app is fully responsive and uses structured layers for scalability and maintainability.

---

## 🧱 Architecture Overview

This project follows a **Clean Architecture** and **feature-based** structure to maintain clear separation between the layers:

- **Core Layer:** Contains reusable utilities such as dependency injection, database, routing, helpers, and theme configuration.
- **Feature Layer:** Each feature (e.g., Home, BottomNav, Profile) has its own UI, Cubit, Repository, and data sources.
- **Data Layer:** Handles SQLite database management, migrations, and data seeding from JSON assets.

For full implementation details and folder responsibilities, see [ARCHITECTURE.md](ARCHITECTURE.md).


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

## 🎨 UI & Responsiveness

The app adapts to all screen sizes using a custom **responsive helper system**:

- `SizeProvider` defines a base layout grid.
- `SizerHelperExtension` dynamically scales fonts, paddings, and widgets.
- The app supports **RTL (Right-to-Left)** layout for Arabic users.

💡 **Fonts:**

- **Tajawal** is used for all text with multiple weights.
- Consistent typography and balanced spacing create a modern and clean interface.

---

## 🧩 Tech Stack

| Technology | Purpose |
|-------------|----------|
| **Flutter** | Cross-platform app framework |
| **GetIt** | Dependency injection |
| **Cubit / flutter_bloc** | State management |
| **Sqflite** | Local SQLite storage |
| **Path / Path Provider** | File and directory management |
| **Logger** | Debugging and structured logging |
| **Flutter SVG** | Vector image rendering |
| **Device Preview** | Multi-device testing |
| **Intl** | Localization and date formatting |

---

## 🚀 How to Run

1. **Clone the project**
   ```bash
   git clone https://github.com/<your-username>/flutter_task.git
   cd flutter_task
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```
3. **Run the app**
   ```bash
   flutter run
   ```

---

## 🧪 Folder Structure
    lib/
    ├── core/
    │   ├── db/                 # SQLite setup & migrations
    │   ├── di/                 # Dependency Injection (GetIt)
    │   ├── helpers/            # Responsive helpers, extensions, constants
    │   ├── routing/            # AppRouter & route management
    │   ├── theme/              # Colors, text styles, typography
    │   └── widgets/            # Reusable UI components
    │
    ├── features/
    │   ├── home_screen/        # Home Cubit, Repository & UI
    │   ├── bottom_nav/         # Bottom navigation & state
    │   ├── chat_screen/        # Chat UI
    │   ├── my_ads_screen/      # My Ads feature
    │   ├── profile_screen/     # Profile UI
    │   └── add_ad_screen/      # Add Ad feature
    │
    ├── flutter_task_app.dart   # Root widget
    └── main.dart               # Entry point

---

## 🔀 Branch Naming Convention

This project follows a consistent and descriptive branch naming strategy.

📄 See full details in [BRANCHING.md](BRANCHING.md)

---

## 📦 Packages Overview
| Package                              | Purpose                            |
| ------------------------------------ | ---------------------------------- |
| `flutter_bloc`                       | Cubit-based state management       |
| `get_it`                             | Dependency injection               |
| `sqflite`                            | Local SQLite database              |
| `path` / `path_provider`             | File management & database pathing |
| `logger`                             | Structured logging                 |
| `flutter_svg`                        | SVG asset rendering                |
| `cached_network_image`               | Caching remote images              |
| `loading_animation_widget`           | Animated loading indicators        |
| `intl`                               | Localization & date formatting     |
| `device_preview`                     | Simulate UI on multiple devices    |
| `json_serializable` / `build_runner` | Code generation for models         |
