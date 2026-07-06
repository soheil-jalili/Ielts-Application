import 'package:flutter/material.dart';
import 'package:ielts/screens/daily_challenge_guide_line_1.dart';

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
        child: DailyChallengeGuideLine1(),
      ),
    );
  }
}
