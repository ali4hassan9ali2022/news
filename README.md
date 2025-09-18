# 📰 News App

A simple **Flutter** news application with **Dark & Light mode support**,  
fetching the latest news from an API with category filtering and search functionality.

---

## 🚀 Features
- Browse the latest news from API.
- Filter news by categories (Business, Sports, Technology...).
- Search for articles.
- Dark & Light themes with persistent user preference using `SharedPreferences`.
- Clean and responsive UI.

---

## 📸 Screenshots
| Light Mode | Dark Mode |
|------------|-----------|
| ![light](screenshots/light.png) | ![dark](screenshots/dark.png) |

---

## 🛠️ Tech Stack
- [Flutter](https://flutter.dev/)  
- [Dart](https://dart.dev/)  
- [Bloc / Cubit](https://bloclibrary.dev/#/) for state management  
- [SharedPreferences](https://pub.dev/packages/shared_preferences) for theme persistence  

---

## ⚙️ Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/username/news_app.git
   cd news_app
## Install dependencies
    flutter pub get
## Run the app
    flutter run
## Folder Structure
    lib/
 ├─ main.dart
 ├─ Core/
 │   └─ Api/
 │   └─ Cache/
 │   └─ errors/
 │   └─ Helper/
 │   └─ Utils/
 │   └─ Widgets/
 ├─ Cubit/
 │   ├─ App_cubit/
 │   ├─ healths_cubit/
 │   └─ News_cubit/
 │   └─ sciences_cubit/
 │   └─ Search_cubit/
 │   └─ Sports_cubit/
 ├─ Layout/
 ├─ Models/
 └─ Repo/
 └─ Theme/
 └─ Views/

