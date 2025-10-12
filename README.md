# Mostawak 📚

A modern Flutter application designed for learning and knowledge competition. Mostawak provides an engaging platform
where users can learn, develop skills, and challenge their friends in a gamified learning environment.

## Features ✨

- **Interactive Onboarding**: Welcome users with a smooth onboarding experience
- **User Authentication**: Complete auth flow including login, signup, and password recovery
- **Multi-language Support**: Built-in internationalization with English and Arabic support
- **Custom UI Components**: Beautiful, custom-designed interface with consistent theming
- **Challenge System**: Compete with friends and make learning more exciting
- **Cross-Platform**: Supports Android, iOS, Web, Windows, macOS, and Linux

## Screenshots 📱

The app features a modern design with:

- Welcoming onboarding screens with custom illustrations
- Clean authentication interface
- Responsive design that works across all platforms

## Getting Started 🚀

### Prerequisites

- Flutter SDK (^3.7.2)
- Dart
- Android Studio / Xcode (for mobile development)
- VS Code or your preferred IDE

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd mostawak
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate localization files**
   ```bash
   flutter gen-l10n
   ```

4. **Run the application**
   ```bash
   flutter run
   ```

### Platform-specific Setup

#### Android

- Minimum SDK: Check `android/app/build.gradle`
- Target SDK: Latest stable version

#### iOS

- iOS 12.0+
- Xcode 12.0+

#### Web

```bash
flutter run -d chrome
```

#### Desktop (Windows/macOS/Linux)

```bash
flutter run -d windows  # or macos, linux
```

## Project Structure 📁

```
lib/
├── core/                    # Core functionality
│   ├── constants/          # App constants and assets
│   ├── error/             # Error handling
│   ├── network/           # Network services
│   ├── services/          # Core services
│   ├── theme/             # App theming
│   ├── utils/             # Utility functions
│   └── widgets/           # Reusable widgets
├── data/                   # Data layer
│   ├── models/            # Data models
│   ├── providers/         # Data providers
│   └── repositories/      # Repository pattern implementation
├── features/              # Feature modules
│   └── auth/              # Authentication feature
│       ├── controllers/   # Business logic
│       ├── login/         # Login screens and widgets
│       ├── onboarding/    # Onboarding screens
│       └── forgot_password/ # Password recovery
├── generated/             # Generated files (localization)
├── l10n/                  # Localization files
│   ├── intl_en.arb       # English translations
│   └── intl_ar.arb       # Arabic translations
└── routes/                # App routing
```

## Key Dependencies 📦

- **flutter_localizations**: Internationalization support
- **google_fonts**: Custom font integration
- **pinput**: PIN/OTP input widgets
- **flutter_svg**: SVG image support
- **flutter_screenutil**: Responsive screen adaptation
- **cupertino_icons**: iOS-style icons

## Internationalization 🌍

The app supports multiple languages:

- **English** (en)
- **Arabic** (ar)

To add new languages:

1. Create new `.arb` files in `lib/l10n/`
2. Add translations
3. Run `flutter gen-l10n`
4. Update supported locales in `main.dart`

## Theming 🎨

The app uses a custom light theme with:

- **Primary Color**: Teal (#16697B)
- **Secondary Color**: Orange (#FFA62B)
- **Background**: Light cream (#ECE7E3)
- **Accent**: Light teal (#82C0CB)

Custom fonts:

- **Bebas Neue**: For headlines and titles
- **Almarai**: For body text and Arabic support

## Authentication Flow 🔐

The authentication system includes:

1. **Onboarding**: Introduction to the app
2. **Signup**: User registration with validation
3. **Login**: User authentication
4. **Forgot Password**: Password recovery with email verification
5. **Password Reset**: Secure password reset flow

## Contributing 🤝

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Code Style 📝

This project follows:

- Flutter's official style guide
- Clean Architecture principles
- Feature-based folder structure
- Consistent naming conventions

## Building for Production 🏗️

### Android

```bash
flutter build apk --release
# or
flutter build appbundle --release
```

### iOS

```bash
flutter build ios --release
```

### Web

```bash
flutter build web --release
```

### Desktop

```bash
flutter build windows --release
flutter build macos --release
flutter build linux --release
```

## Testing 🧪

Run tests with:

```bash
flutter test
```

## License 📄

This project is private and not published to pub.dev as specified in `pubspec.yaml`.

## Support 💬

For support and questions, please contact the development team.

---

**Made with ❤️ using Flutter**