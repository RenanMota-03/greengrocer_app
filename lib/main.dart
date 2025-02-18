import 'package:flutter/material.dart';
import 'src/view/auth/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey.shade300,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: SignInScreen(),
    );
  }
}
