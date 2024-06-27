import 'package:flutter/material.dart';
import 'package:flutter_front/modules/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Front',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue[400]!),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
