import 'package:flutter/material.dart';

class MovieFlow extends StatefulWidget {
  const MovieFlow({super.key});

  @override
  State<MovieFlow> createState() => _MovieFlowState();
}

class _MovieFlowState extends State<MovieFlow> {
  final pageController = PageController();

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(microseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  void prevousPage() {
    pageController.previousPage(
      duration: const Duration(
        microseconds: 600,
      ),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      //physics: const NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          body: Container(
            color: Colors.red,
          ),
        ),
        Scaffold(
          body: Container(
            color: Colors.green,
          ),
        ),
        Scaffold(
          body: Container(
            color: Colors.blue,
          ),
        ),
        Scaffold(
          body: Container(
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
