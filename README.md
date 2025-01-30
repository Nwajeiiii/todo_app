# 📝 To-Do App (Flutter + Riverpod + DDD)

A simple To-Do app built with **Flutter**, using **Riverpod** for state management and following **Domain-Driven Design (DDD)** principles. This app allows users to **add, edit, delete, and mark tasks as complete**, with tasks categorized into **Personal** and **Work** groups. The app also uses **Hive** for local data storage.

---

## 📌 Features
**Add Tasks** – Create new tasks with a title and description.  
**Edit Tasks** – Modify existing tasks.  
**Delete Tasks** – Remove tasks from the list.  
**Mark as Complete** – Use a checkbox to toggle task completion.  
**Task Categorization** – Tasks are grouped as **Personal** or **Work**.  
**Local Storage** – All tasks persist using **Hive database**.  
**Simple & Clean UI** – Styled with a blue theme for better readability.

---

## 🏗️ **Project Structure (DDD)**
This project follows **Domain-Driven Design (DDD)** and is structured into three main layers:

```
lib/
├── domain/           # Core business logic
│   ├── entities/     # Defines the Task entity
│   ├── repositories/ # Abstract repository interface
│
├── application/      # Use cases (business rules)
│   ├── use_cases/    # Handles task operations (add, update, delete)
│
├── infrastructure/   # Data storage & repository implementation
│   ├── data_sources/ # Manages Hive database
│   ├── repositories/ # Implements repository interface
│
├── presentation/     # UI & State Management
│   ├── providers/    # Riverpod state management
│   ├── pages/        # Screens (Home, Add Task, Edit Task)
│   ├── widgets/      # Reusable UI components
│
└── main.dart         # App entry point
```

---

## **Installation & Setup**
Follow these steps to install and run the app:

### **Clone the repository**
```sh
git clone https://github.com/Nwajeiiii/todo_app.git
cd todo_app
```

### **Install dependencies**
```sh
flutter pub get
```

### **Generate Hive Adapter**
```sh
dart run build_runner build
```

### **Run the app**
```sh
flutter run
```

---

## **Technologies Used**
- **Flutter** – UI framework for cross-platform development.
- **Riverpod** – State management for managing app state.
- **Hive** – Lightweight NoSQL database for local storage.
- **Domain-Driven Design (DDD)** – Clean architecture for separating concerns.

---

**Enjoy using the To-Do app!** Happy coding!