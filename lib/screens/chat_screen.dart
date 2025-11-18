// lib/screens/chat_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/message.dart';
import '../providers/chat_provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  Widget _buildMessage(Message message) {
    final isUser = message.isUser;
    final alignment = isUser ? Alignment.centerRight : Alignment.centerLeft;
    // Skema Warna Estetik (User: Indigo, Asisten: Putih)
    final color = isUser ? Colors.indigo[400] : const Color(0xFFFFFFFF); 
    final textColor = isUser ? Colors.white : Colors.black87; 

    return Container(
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15.0),
            topRight: const Radius.circular(15.0),
            bottomLeft: isUser ? const Radius.circular(15.0) : const Radius.circular(0.0),
            bottomRight: isUser ? const Radius.circular(0.0) : const Radius.circular(15.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          message.text,
          style: TextStyle(color: textColor, fontSize: 16.0),
        ),
      ),
    );
  }

  Widget _buildInputArea(ChatProvider provider) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F5F8), // Latar belakang input sama dengan body
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: <Widget>[
          Expanded( 
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Tanyakan sesuatu...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white, // Input field berwarna Putih Bersih
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              ),
              onSubmitted: (_) => _sendMessage(provider),
            ),
          ),
          const SizedBox(width: 8.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () => _sendMessage(provider),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(ChatProvider provider) {
    if (_controller.text.isNotEmpty) {
      provider.sendMessage(_controller.text);
      _controller.clear();
      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F8), // Latar Belakang Abu-abu Lembut
      appBar: AppBar( 
        title: const Text(
          'Tanya Gilang Aja', // <--- NAMA APLIKASI FINAL
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
        centerTitle: false, 
        backgroundColor: const Color(0xFFF2F5F8), 
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Icon(Icons.smart_toy_outlined, color: Colors.indigo),
        ),
      ),
      body: Consumer<ChatProvider>(
        builder: (context, chatProvider, child) {
          return Column(
            children: <Widget>[
              Expanded( 
                child: ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  itemCount: chatProvider.messages.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messages.reversed.toList()[index];
                    return _buildMessage(message);
                  },
                ),
              ),
              _buildInputArea(chatProvider),
            ],
          );
        },
      ),
    );
  }
}