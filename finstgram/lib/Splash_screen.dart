import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 20.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Timer(const Duration(seconds: 10), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _splashImage(),
              _progressindicator()
            ],
          ),
        ),
      ),
    );
  }

  Widget _splashImage() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -_animation.value), // Move up and down
          child: child,
        );
      },
      child: Image.network(
        'https://sdmntprwestus2.oaiusercontent.com/files/00000000-17e0-61f8-b1cd-0c4db48e54b5/raw?se=2025-07-24T11%3A17%3A02Z&sp=r&sv=2024-08-04&sr=b&scid=65983fd1-62e6-5e1e-9661-c97c37fcf732&skoid=c156db82-7a33-468f-9cdd-06af263ceec8&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2025-07-23T20%3A08%3A48Z&ske=2025-07-24T20%3A08%3A48Z&sks=b&skv=2024-08-04&sig=BSaI4qlYe0XFaQQY8qd4%2B6Soul4RdZOQx9%2BE8q%2B5ch0%3D',
        height: 150,
        width: 150,
      ),
    );
  }
  Widget _progressindicator(){
    return const CircularProgressIndicator(
      color: Colors.red,
      strokeWidth: 2.0,
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose animation controller to avoid leaks
    super.dispose();
  }
}
