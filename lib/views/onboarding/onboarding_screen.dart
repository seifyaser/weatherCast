import 'package:flutter/material.dart';
import 'package:lottie_screen_onboarding_flutter/introduction.dart';
import 'package:lottie_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/home_screen.dart';

/// Onboarding screen shown on first app launch
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isFirstTime = true;

  @override
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  void _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('isFirstTime') ?? true;

    if (firstTime) {
      setState(() {
        isFirstTime = true;
      });
      await prefs.setBool('isFirstTime', false);
    } else {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    }
  }

  final List<Introduction> _introductionList = [
    Introduction(
      lottieUrl: 'assets/Welcome.json',
      title: 'WeatherCast',
      subTitle:
          'Enjoy effortless daily weather updates and stay ahead of the weather.',
    ),
    Introduction(
      lottieUrl: 'assets/location.json',
      title: 'At Your Location',
      subTitle: 'Know the weather anytime with one click at your location.',
    ),
    Introduction(
      lottieUrl: 'assets/Searchcity.json',
      title: 'Explore world\'s weather!',
      subTitle:
          'You can search and discover weather forecasts for cities around the globe.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (isFirstTime) {
      return Scaffold(
        body: SafeArea(
          child: IntroScreenOnboarding(
            introductionList: _introductionList,
            onTapSkipButton: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            ),
            backgroudColor: const Color.fromARGB(255, 255, 255, 255),
            foregroundColor: const Color.fromARGB(255, 112, 86, 208),
            skipTextStyle: const TextStyle(
              color: Color.fromARGB(255, 112, 86, 208),
              fontSize: 15,
            ),
          ),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
  }
}
