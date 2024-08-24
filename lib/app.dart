import 'package:flutter/material.dart';
import 'package:live_score/ui/screens/match_list_screen.dart';

class LiveScoreApp extends StatelessWidget {
  const LiveScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const MatchListScreen(),
      theme: lightThemeData(),
    );
  }

  ThemeData lightThemeData(){
    return ThemeData(

      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        )
      ),

    );
  }

}
