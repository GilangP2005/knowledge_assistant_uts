// lib/providers/chat_provider.dart

import 'package:flutter/foundation.dart';
import '../models/message.dart';

class ChatProvider with ChangeNotifier {
  final List<Message> _messages = [
    // Sapaan Awal yang dipersonalisasi
    Message(text: "Halo! Apakah yang ingin kamu tanyakan? Asisten Gilang akan menjawab semua pertanyaan mu", isUser: false), 
  ];

  List<Message> get messages => _messages;

  void sendMessage(String text) {
    if (text.isEmpty) return;
    
    // 1. Tambah pesan pengguna
    _messages.add(Message(text: text, isUser: true));
    notifyListeners(); 

    // 2. Simulasi respons asisten setelah penundaan
    _simulateAssistantResponse(text);
  }

  void _simulateAssistantResponse(String userText) {
    String response;
    final query = userText.toLowerCase();

    // Logika Respons Simulasi yang Lebih Akurat dan Variatif
    if (query.contains('uts') || query.contains('tugas') || query.contains('nilai')) {
      response = "Fokus utama UTS adalah pada **Layouting** (Widget, Column, Row, ListView, Expanded) dan State Management (Provider). Integrasi data kompleks diabaikan.";
    } else if (query.contains('flutter') || query.contains('widget') || query.contains('coding')) {
      response = "Flutter menggunakan konsep Widget. Layouting chat Anda berhasil menggunakan kombinasi Row, Align, dan ListView.builder.";
    } else if (query.contains('warna') || query.contains('desain') || query.contains('estetik')) {
      response = "Desain yang baik berfokus pada kesederhanaan. Skema warna minimalis dan AppBar yang bersih akan memberikan nilai estetik tinggi.";
    } else if (query.contains('siapa') || query.contains('gilang')) {
      response = "Saya adalah Asisten Gilang, simulator chat yang diciptakan untuk menyelesaikan tugas Pemrograman Mobile 2 ini. Salam!";
    } else if (query.contains('dosen')) {
      response = "Dosen mata kuliah ini adalah Andri Nugraha Ramdhon S.Kom., M.Kom. (dari UTB).";
    } else if (query.contains('github') || query.contains('kode')) {
      response = "Pastikan Anda mengumpulkan source code via GitHub (direkomendasikan) atau GDrive, itu adalah salah satu poin wajib pengumpulan.";
    } else if (query.contains('1 + 1') || query.contains('hitung') || query.contains('berapa')) {
      response = "Hasilnya adalah 2. Ingat, fokuslah pada tampilan UI/UX yang dinamis, bukan pada kalkulasi ini!";
    } else if (query.contains('terima kasih') || query.contains('makasih')) {
      response = "Sama-sama! Senang bisa membantu Anda menyelesaikan tugas. Jangan lupa cek kelengkapan dokumen PDF Anda.";
    } else {
      // Jawaban default yang lebih umum
      response = "Pertanyaan Anda sangat menarik. Pastikan Anda sudah mengupload file .apk, source code (GitHub), dan video demo ke GDrive untuk pengumpulan.";
    }

    // Tunda 1 detik (simulasi loading)
    Future.delayed(const Duration(seconds: 1), () {
      _messages.add(Message(text: response, isUser: false));
      notifyListeners(); // Update UI
    });
  }
}