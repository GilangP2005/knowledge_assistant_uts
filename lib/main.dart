// lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/chat_provider.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(
    // Menggunakan ChangeNotifierProvider untuk menyediakan state ke seluruh aplikasi
    ChangeNotifierProvider(
      create: (context) => ChatProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asisten UTS',
      // Baris ini menghilangkan tulisan DEBUG di pojok kanan atas
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        // Tema warna utama aplikasi
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const ChatScreen(),
    );
  }
}