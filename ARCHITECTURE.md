# 🧱 Project Architecture

This Flutter project is built using a **clean, modular, and feature-based architecture** inspired by the Flutter team's official [Flutter Architecture Guide](https://docs.flutter.dev/app-architecture/guide).

It separates the application into clear layers to ensure **scalability**, **testability**, and **maintainability** while keeping the code **organized and reusable**.

---

## 🧩 Layered Architecture Overview

The project is divided into **four main layers**:

- **Core Layer** – Contains shared logic, dependency injection, database setup, routing, helpers, and UI utilities.  
- **Feature Layer** – Each feature (e.g., Home, Profile, Bottom Navigation) is isolated with its own Cubit, Repository, and UI.  
- **Data Layer** – Responsible for local persistence and seeding using SQLite and JSON assets.  
- **Presentation Layer (UI)** – Manages the app interface, responsive layouts, and user interactions.

---

## 📁 Folder Structure

    lib/
    ├── core/
    │ ├── db/ # SQLite setup, migrations, and AppDatabase
    │ ├── di/ # Dependency Injection (GetIt) setup
    │ ├── helpers/ # Extensions, constants, responsive helper, spacing
    │ │ ├── responsive_helper/ # SizeProvider, SizerHelperExtension
    │ ├── routing/ # AppRouter & route definitions
    │ ├── theme/ # Colors, styles, fonts, text sizes
    │ └── widgets/ # Shared and reusable UI components
    │
    ├── features/
    │ ├── home_screen/ # Home feature (Cubit + Repo + UI)
    │ │ ├── cubit/ # State management
    │ │ ├── data/ # Local DAO, models, repository
    │ │ └── ui/ # Widgets and layouts
    │ ├── bottom_nav/ # Bottom navigation feature
    │ ├── chat_screen/ # Chat feature
    │ ├── my_ads_screen/ # My ads feature
    │ ├── profile_screen/ # Profile feature
    │ └── add_ad_screen/ # Add ad feature
    │
    ├── flutter_task_app.dart # Root application widget
    └── main.dart # Application entry point


---

## ✨ Layer Responsibilities

### 🧱 Core Layer
- Provides **foundational utilities** shared across the app:
  - Dependency Injection via **GetIt**
  - Database initialization (AppDatabase)
  - Global routing and navigation
  - Theme, colors, and text styles
  - Reusable widgets and UI helpers
  - Logging via **Logger**

### 💾 Data Layer
- Responsible for **data persistence** and **local seeding**:
  - Uses **SQLite (sqflite)** for structured local storage.
  - Migration files stored under `assets/sql/`.
  - Seeding data from JSON assets under `assets/seed/`.
  - Provides Data Access Objects (DAO) and repository implementations.

### 🧠 Logic Layer (Cubit / Repositories)
- Each feature defines:
  - **Cubit:** Handles state management (loading, success, error, empty).
  - **Repository:** Abstracts data retrieval (from local database or API in future).
  - **Models:** Represent the entities used in the UI and database.

### 🎨 UI / Presentation Layer
- Contains all widgets, screens, and layouts.
- Uses the **responsive helper system**:
  - `SizeProvider` defines the base screen layout.
  - `SizerHelperExtension` scales fonts, paddings, and margins dynamically.
- Supports **RTL (Right-to-Left)** for Arabic localization.
- Adopts **Tajawal** font family for consistent Arabic typography.

---

## 🔄 Example Data Flow

1. The user opens the Home screen.  
2. The **HomeCubit** calls the **HomeRepository** to fetch products.  
3. The **Repository** reads data from the **SQLite** database (seeded via JSON).  
4. The retrieved data is mapped to models and emitted through Cubit states.  
5. The **UI** rebuilds automatically, displaying the latest data.

