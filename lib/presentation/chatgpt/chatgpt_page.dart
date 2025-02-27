import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/base/page/base_scafold.dart';
import 'package:flutter_base_bloc/core/config/resources/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import 'bloc/chatgpt_bloc.dart';

class ChatgptPage extends StatelessWidget {
  const ChatgptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatgptBloc(Gemini.instance, gemini: Gemini.instance)
        ..add(const ChatgptEvent.loadMessages()),
      child: const ChatgptView(),
    );
  }
}

class ChatgptView extends StatelessWidget {
  const ChatgptView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: color29D890,
      showBackButton: true,
      title: "Search Everything",
      body: BlocBuilder<ChatgptBloc, ChatgptState>(
        builder: (context, state) {
          return DashChat(
            messageOptions: const MessageOptions(
              currentUserContainerColor: colorBlack,
              containerColor: colorWhite,
              textColor: colorBlack,
            ),
            currentUser: context.read<ChatgptBloc>().currentUser,
            messages: state.chatgptList,
            onSend: (ChatMessage message) {
              context
                  .read<ChatgptBloc>()
                  .add(ChatgptEvent.sendMessage(message.text));
            },
          );
        },
      ),
    );
  }
}
