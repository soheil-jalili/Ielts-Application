import 'package:flutter/material.dart';
import 'package:ielts/screens/quiz_landing_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: QuizLandingScreen(),
      ),
    );
  }
}
