import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../onboarding/onboarding_screen.dart';

/// Splash screen displayed on app launch
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Colors.black),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Lottie.asset('assets/splash.json'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 220),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'WeatherCast',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'V 1.0',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    }
  }
}
