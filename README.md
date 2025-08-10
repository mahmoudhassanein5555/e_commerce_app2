# 🛍 Flutter Shopping App

A complete **Flutter shopping application** built as part of a training project.  
This app simulates a real-world shopping experience with **authentication, product listings, and cart management**.

---

## 📱 Features

### 1. Welcome Screen
- Beautifully designed intro screen with:
  - AppBar title
  - One local image + one online image
  - Custom font: `Suwannaphum-Regular` (bold, colored, resized)
  - **Sign Up** and **Sign In** buttons

### 2. Authentication
- **Sign-Up**
  - Full Name (First letter uppercase)
  - Email validation (must contain "@")
  - Password (min. 6 characters)
  - Confirm Password (must match password)
  - Success dialog: `"Account created successfully"`
- **Sign-In**
  - Email validation
  - Password validation
  - Success dialog: `"Account sign-in successfully"`
- After successful authentication → Navigate to **Home Page** with smooth transition

### 3. Smooth Page Transitions
- Fade-out effect for sign-up/sign-in screen
- Fade-in effect for the main shopping screen

### 4. Home Page
- AppBar: `"Our Products"`
- Horizontal **PageView** with featured products
- **GridView** (2 per row) for product listing:
  - Product image
  - Product title
  - Add-to-Cart icon → Snackbar `"Item added to the cart"`
- **Hot Offers** section:
  - Built with `ListView.builder`
  - Each offer includes an image + description

### 5. Cart Page
- Displays items added to the cart
- Styled using Flutter **Card** widgets

---

## 🛠 Technologies Used
- **Dart** (logic, OOP, functions)
- **Flutter SDK** (UI and navigation)
- **Material Design Widgets**
- **GitHub** (version control and hosting)

---

## 📸 Screenshots
| Welcome Screen | Sign-Up | Home Page |
|----------------|---------|-----------|
| ![Welcome](screenshots/welcome.png) | ![Sign Up](screenshots/signup.png) | ![Home](screenshots/home.png) |

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed
- Dart SDK installed
- VS Code / Android Studio

### Run the App
```bash
flutter pub get
flutter run
