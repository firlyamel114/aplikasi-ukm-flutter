import 'package:flutter/material.dart';
import 'dashboard_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Kegiatan Mahasiswa',
      theme: ThemeData(fontFamily: 'Geist'),
      home: DashboardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
