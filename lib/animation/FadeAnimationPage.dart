import 'package:flutter/material.dart';

class FadeAnimationPage extends StatefulWidget {
  const FadeAnimationPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _FadeAnimateState();
}

//1. with TickerProviderStateMixin
//2. AnimationController,CurvedAnimation
//3. FadeTransition
class _FadeAnimateState extends State<FadeAnimationPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(microseconds: 2000), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: FadeTransition(
          opacity: curve,
          child: const FlutterLogo(
            size: 100.0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'fade',
        onPressed: () {
          controller.forward();
        },
        child: const Icon(Icons.play_circle),
      ),
    );
  }
}
