
# 💸 Money Transfer App

A modern, secure, and user-friendly money transfer application built with Flutter. Send money instantly to friends, family, and businesses with just a few taps.

## 🚀 Features

### Core Features
- **Instant Money Transfers** - Send money instantly to registered users
- **Transaction History** - Comprehensive history with detailed transaction records
- **Contact Integration** - Send money to contacts from your phonebook

### User Experience
- **Clean Material Design** - Modern and intuitive user interface
- **Dark/Light Theme** - Support for both dark and light themes
- **Offline Support** - View transaction history offline
- **Multi-Language Support** - Available in multiple languages

## 📱 Screenshots



## 🛠 Tech Stack

- **Framework:** Flutter 3.x
- **Language:** Dart
- **State Management:** Provider 
- **Custom extansion:** SizedBox 
- **Resposive UI:** used resposive package 
- **Local Storage:** SharedPreferences / Hive
- **UI Components:** Material Design 3

## 🏗 Architecture

This app follows the **Clean Architecture** pattern with the following layers:

```
lib/
├── core/
│   ├── constants/
│   ├── errors/
│   ├── network/
│   └── utils/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/
│   ├── pages/
│   ├── widgets/
│   └── providers/
└── main.dart
```

## 🚦 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (2.17.0 or higher)
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/TaufeeqAhmad123/money_transfer_app.git
   cd money_transfer_app/money_transfer
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```



5. **Run the app**
   ```bash
   flutter run
   ```

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run integration tests
flutter drive --target=test_driver/app.dart
```

### Test Structure

```
test/
├── unit/
│   ├── models/
│   ├── repositories/
│   └── usecases/
├── widget/
│   └── pages/
└── integration/
    └── app_test.dart
```

## 📱 Build & Deployment

### Android

1. **Generate signed APK**
   ```bash
   flutter build apk --release
   ```

2. **Generate App Bundle**
   ```bash
   flutter build appbundle --release
   ```

### iOS

1. **Build for iOS**
   ```bash
   flutter build ios --release
   ```

2. **Archive for App Store**
   - Open `ios/Runner.xcworkspace` in Xcode
   - Select "Product" > "Archive"
   - Upload to App Store Connect

## 🔧 Dependencies

### Core Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  provider: ^6.0.5
  
  
  # Database
  sqflite: ^2.3.0
  shared_preferences: ^2.2.0

  
  # UI & Utilities
  cached_network_image: ^3.2.3
  responsive_sizer: 
  provider: 
  intl:
  google_fonts: ^6.2.0
  flutter_svg: 
  flutter_animate: 
```

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Commit your changes**
   ```bash
   git commit -m 'Add some amazing feature'
   ```
4. **Push to the branch**
   ```bash
   git push origin feature/amazing-feature
   ```
5. **Open a Pull Request**

### Contribution Guidelines

- Follow the existing code style
- Write tests for new features
- Update documentation as needed
- Ensure all tests pass before submitting

## 📝 Code Style

We follow the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style). Key points:

- Use `lowerCamelCase` for variables and functions
- Use `UpperCamelCase` for classes
- Use `snake_case` for file names
- Maximum line length: 80 characters


### Reporting Security Issues

If you discover a security vulnerability, please email [taufeeqahmad.cs.com] instead of opening a public issue.



Copyright (c) 2024 Taufeeq Ahmad

```

## ⭐ Show Your Support

If this project helped you, please give it a ⭐ star and share it with others!

---

**Made with ❤️ by [Taufeeq Ahmad](https://github.com/TaufeeqAhmad123)**

For more Flutter projects and tutorials, follow me on:
- 💼 [LinkedIn](https://www.linkedin.com/in/taufeeq-ahmad-67b751264/)
- 📧 Email: taufeeqahmad.cs.com