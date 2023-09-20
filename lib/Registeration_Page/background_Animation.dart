import 'package:flutter/material.dart';

class BackgroundAnimation extends StatefulWidget {
  @override
  _BackgroundAnimationState createState() => _BackgroundAnimationState();
}

class _BackgroundAnimationState extends State<BackgroundAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          children: [
            Positioned.fill(
              left: _animation.value * MediaQuery.of(context).size.width,
              child: Image.asset(
                'images/movie.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              left: (_animation.value - 1.0) * MediaQuery.of(context).size.width,
              child: Image.asset(
                'images/movie.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      },
    );
  }
}
