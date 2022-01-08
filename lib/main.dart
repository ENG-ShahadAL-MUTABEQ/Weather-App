import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';

void main() => runApp(const ClimaApp());

class ClimaApp extends StatelessWidget {
  const ClimaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF411D45),
        ),
      ),
      home: const LoadingScreen(),
    );
  }
}
