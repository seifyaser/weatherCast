import 'package:flutter/material.dart';

/// Background gradient widgets for creating visual effects
/// These are positioned absolutely to create the app's background aesthetic

class BackgroundGradient1 extends StatelessWidget {
  const BackgroundGradient1({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(3, -0.3),
      child: Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}

class BackgroundGradient2 extends StatelessWidget {
  const BackgroundGradient2({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-3, -0.3),
      child: Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}

class BackgroundGradient3 extends StatelessWidget {
  const BackgroundGradient3({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, -1.2),
      child: Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 14, 168, 119),
        ),
      ),
    );
  }
}

class BackgroundGradient4 extends StatelessWidget {
  const BackgroundGradient4({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, -1.2),
      child: Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 44, 140, 147),
        ),
      ),
    );
  }
}
