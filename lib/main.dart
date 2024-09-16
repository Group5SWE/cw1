import 'package:flutter/material.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  bool _isFirstImage = true;
  int _counter = 0;

  // Function to toggle between images
  void _toggleImage() {
    setState(() {
      _isFirstImage = !_isFirstImage;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Theme Demo '),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Button Counter:',
              ),
              Text(
                '$_counter',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                      backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                      overlayColor: WidgetStateProperty.resolveWith<Color?>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.hovered)) {
                            return const Color.fromARGB(255, 0, 255, 13).withOpacity(1.00);
                          }
                          if (states.contains(WidgetState.focused) ||
                              states.contains(WidgetState.pressed)) {
                            return Colors.white.withOpacity(1.00);
                          }
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    onPressed: _incrementCounter,
                    child: Text('Increment'),
                  ),
                  Container(
                    width: 100, // Set a specific width
                    height: 100, // Set a specific height
                    child: Image.asset(
                      _isFirstImage ? 'assets/images/doggo.jpg' : 'assets/images/cat.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                      backgroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 255, 0, 0)),
                      overlayColor: WidgetStateProperty.resolveWith<Color?>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.hovered)) {
                            return const Color.fromARGB(255, 255, 255, 0).withOpacity(1.00);
                          }
                          if (states.contains(WidgetState.focused) ||
                              states.contains(WidgetState.pressed)) {
                            return Colors.white.withOpacity(1.00);
                          }
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    onPressed: _toggleImage,
                    child: Text('Change Image'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}