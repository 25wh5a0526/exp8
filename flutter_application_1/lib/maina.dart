import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Animation"),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Tap the box to animate",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 25),

              GestureDetector(
                onTap: () {
                  setState(() {
                    isAnimated = !isAnimated;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  width: isAnimated ? 220 : 120,
                  height: isAnimated ? 180 : 120,
                  decoration: BoxDecoration(
                    color: isAnimated
                        ? Colors.deepPurple
                        : Colors.orange,
                    borderRadius: BorderRadius.circular(
                      isAnimated ? 50 : 10,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "ANIMATION",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}