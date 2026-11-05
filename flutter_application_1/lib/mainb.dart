import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> fade;
  late Animation<Offset> slide;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    fade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(controller);

    slide = Tween<Offset>(
      begin: const Offset(-2, 0),
      end: Offset.zero,
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Fade and Slide Animation")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: fade,
                child: SlideTransition(
                  position: slide,
                  child: Container(
                    width: 180,
                    height: 100,
                    color: Colors.deepPurple,
                    alignment: Alignment.center,
                    child: const Text(
                      "Hello Flutter",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  controller.forward(from: 0);
                },
                child: const Text("Start Animation"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}