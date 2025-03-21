import 'package:flutter/material.dart';
import 'home_page.dart'; // Import halaman utama
import 'detail_page.dart'; // Import halaman detail

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
        // Tema Light
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        // Tema Dark
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.system, // Mengikuti tema sistem
      home: const HomePage(), // Halaman utama
      routes: {
        '/detail': (context) => const DetailPage(imagePath: '',), // Rute untuk halaman detail
      },
    );
  }
}