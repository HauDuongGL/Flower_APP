import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/base/page/base_scafold.dart';
import 'package:flutter_base_bloc/core/config/resources/color.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ChatgptPage extends StatefulWidget {
  const ChatgptPage({super.key});

  @override
  State<ChatgptPage> createState() => _ChatgptPageState();
}

class _ChatgptPageState extends State<ChatgptPage> {
  late final Gemini gemini;

  final ChatUser _currentUser =
      ChatUser(id: '1', firstName: "Me", lastName: "Hieu");
  final ChatUser _chatGPTUser =
      ChatUser(id: '2', firstName: "A", lastName: "I");

  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();

    Gemini.init(apiKey: "AIzaSyCAOwRF-OCEmsVfZ8d5vi644l4pjxsfXP8");
    gemini = Gemini.instance;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: color29D890,
      showBackButton: true,
      title: "Search Everything",
      body: DashChat(
        messageOptions: const MessageOptions(
          currentUserContainerColor: colorBlack,
          containerColor: colorWhite,
          textColor: colorBlack,
        ),
        currentUser: _currentUser,
        onSend: (ChatMessage message) {
          getGeminiResponse(message);
        },
        messages: _messages,
      ),
    );
  }

  Future<void> getGeminiResponse(ChatMessage message) async {
    setState(() {
      _messages.insert(0, message);
    });

    try {
      final response = await gemini.text(message.text);

      if (response?.output != null) {
        setState(() {
          _messages.insert(
            0,
            ChatMessage(
              user: _chatGPTUser,
              createdAt: DateTime.now(),
              text: response!.output!,
            ),
          );
        });
      }
    } catch (e) {
      debugPrint("Lỗi khi gọi Gemini API: $e");
    }
  }
}
