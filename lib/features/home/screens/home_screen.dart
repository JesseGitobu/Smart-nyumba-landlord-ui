import 'package:flutter/material.dart';

import '../../authentication/presentation/splash_screen/widgets/background_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double WIDTH = MediaQuery.of(context).size.width;
    Widget Background = CustomPaint(
      size: Size(
          WIDTH,
          (WIDTH * 2.163551401869159)
              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: RPSCustomPainter(),
    );
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Background,
        ),
      ),
    );
  }
}
