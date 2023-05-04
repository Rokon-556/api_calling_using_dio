import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedLoader extends StatefulWidget {
  const AnimatedLoader({Key? key}) : super(key: key);

  @override
  State<AnimatedLoader> createState() => _AnimatedLoaderState();
}

class _AnimatedLoaderState extends State<AnimatedLoader> with TickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(duration: const Duration(seconds: 10), vsync: this)
    ..repeat();

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: Align(
        alignment: Alignment.center,
        child: Image.asset(
          'assets/icons/icon.png',
          height: 30,
          width: 30,
          fit: BoxFit.cover,
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _animationController.value * 10.0 * math.pi,
          child: child,
        );
      },
    );
  }
}
