# WeatherCast ☀️🌧️

A professional cross-platform weather forecast application built with Flutter using **clean MVVM architecture** and **Cubit state management**.

## About
**WeatherCast** is a modern, well-architected weather app that provides real-time weather forecasts with a beautiful user interface. Built following industry best practices with complete separation of concerns, making it maintainable, testable, and scalable.

## ✨ Features
- 🌍 **Dual Platform Support**: Works seamlessly on both Android and iOS devices
- 🌤️ **Comprehensive Weather Data**: Current weather, min/max temperatures, sunrise/sunset times (powered by WeatherAPI)
- 📍 **Flexible Location Services**: Manual city search or automatic GPS location detection
-  **Real-time Updates**: Pull-to-refresh functionality for instant data refresh
-  **7-Day Forecast**: View detailed weather predictions for the upcoming week
-  **Beautiful UI**: Modern design with smooth animations and gradients
-  **Clean Architecture**: MVVM pattern with Cubit for state management
-  **Robust Error Handling**: Proper error states and user-friendly messages
-  **Professional UX**: Splash screen and interactive onboarding for first-time users

##  Architecture

This app follows **MVVM (Model-View-ViewModel)** architecture with **Cubit** for state management:

```
lib/
├── core/                    # App-wide utilities and constants
│   ├── constants/
│   └── utils/
├── models/                  # Data models
├── repositories/            # Data layer (API calls, location services)
├── viewmodels/              # Business logic (Cubits & States)
└── views/                   # UI layer (Screens & Widgets)
```

### Key Benefits
-  **Separation of Concerns**: UI, business logic, and data are completely separated
-  **Testability**: Each layer can be tested independently
-  **Maintainability**: Easy to understand and modify
-  **Scalability**: Simple to add new features

## 🛠️ Technologies Used
- **Flutter** (Dart) - Cross-platform framework
- **flutter_bloc** - State management with Cubit
- **Dio** - HTTP client for API calls
- **Geolocator** - GPS location services
- **WeatherAPI** - Real-time weather data
- **Google Fonts** - Custom typography
- **Lottie** - Smooth animations
- **Git & GitHub** - Version control

## 📸 Screenshots

### Home Screen
![Home Screen](https://i.imgur.com/QEVHuRA.png)

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed ([Get Flutter](https://flutter.dev/docs/get-started/install))
- Android Studio or Xcode (for emulator/simulator)
- WeatherAPI key ([Get free API key](https://www.weatherapi.com/))

### Installation Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/WeatherCast.git
   cd WeatherCast
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Configure API Key:**
   
   Open `lib/core/constants/app_constants.dart` and add your WeatherAPI key:
   ```dart
   static const String apiKey = 'YOUR_API_KEY_HERE';
   ```
   
   > **Note**: The `app_constants.dart` file is in `.gitignore` to protect your API key from being committed.

4. **Run the app:**
   ```bash
   flutter run
   ```

## 🔒 API Key Security

This project uses a simple approach to keep API keys secure:

- `lib/core/constants/app_constants.dart` contains your actual API key
- This file is added to `.gitignore` and won't be committed to Git
- Each developer uses their own API key locally

**For team members**: Get your own API key from [WeatherAPI](https://www.weatherapi.com/) and add it to `app_constants.dart`.

## 📱 Supported Platforms
- ✅ Android
- ✅ iOS

## 🧪 Testing

Run tests with:
```bash
flutter test
```

Run code analysis:
```bash
flutter analyze
```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.


## 🙏 Acknowledgments

- [WeatherAPI](https://www.weatherapi.com/) for providing weather data
- Flutter team for the amazing framework
- All contributors and supporters

---

**Built with ❤️ using Flutter**
