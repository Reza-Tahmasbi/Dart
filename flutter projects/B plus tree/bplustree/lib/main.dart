import 'package:flutter/material.dart';
import 'screens/bplus_tree_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'B+ Tree Visualization',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme.of(context).copyWith(
          bodyMedium: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
              fontWeight: FontWeight.w400),
          labelMedium: const TextStyle(
            color: Colors.grey,
            fontStyle: FontStyle.italic,
            fontSize: 12,
          ),
          labelSmall: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      home: const BPlusTreeScreen(),
    );
  }
}
