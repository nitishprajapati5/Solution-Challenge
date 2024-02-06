import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  int progress = 0;

  Timer? timer;

  void startTime() {
    timer?.cancel();

    timer = Timer.periodic(
      const Duration(milliseconds: 50),
      (timer) {
        if (timer.tick <= 100) {
          setState(() {
            progress = timer.tick;
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff251404),
      body: SafeArea(
          child: Stack(
        alignment: Alignment.center,
        children: [
          const SplashBackground(),
          Text(
            '$progress%',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
            ),
          )
        ],
      )),
    );
  }
}

class SplashBackground extends StatelessWidget {
  const SplashBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          top: 14,
          left: (w - 280) / 2,
          child: const CircleWidget(),
        ),
        Positioned(
          top: ((h - 280) / 2) - 20,
          left: -185,
          child: const CircleWidget(),
        ),
        Positioned(
          top: ((h - 280) / 2) - 20,
          right: -185,
          child: const CircleWidget(),
        ),
        Positioned(
          bottom: 14,
          left: (w - 280) / 2,
          child: const CircleWidget(),
        ),
      ],
    );
  }
}

class CircleWidget extends StatelessWidget {
  const CircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 280,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff4F3422),
      ),
    );
  }
}
