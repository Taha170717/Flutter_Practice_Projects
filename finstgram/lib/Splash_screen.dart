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

    Timer(const Duration(seconds: 4), () {
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
        'https://sdmntprwestus2.oaiusercontent.com/files/00000000-17e0-61f8-b1cd-0c4db48e54b5/raw?se=2025-07-25T10%3A20%3A55Z&sp=r&sv=2024-08-04&sr=b&scid=68c1f0ce-a0cb-5c2f-bfb0-6292c1ab7202&skoid=04233560-0ad7-493e-8bf0-1347c317d021&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2025-07-24T22%3A18%3A47Z&ske=2025-07-25T22%3A18%3A47Z&sks=b&skv=2024-08-04&sig=dwtzUANuT0MxAY28UG1fMskH0BkCaKNgqHut1smEFYs%3D',
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
