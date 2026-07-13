import 'package:flutter/material.dart';
import 'package:ielts/screens/daily_challenge_games.dart';


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
        child: DailyChallengeGames(),
      ),
    );
  }
}
