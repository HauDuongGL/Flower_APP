import 'dart:convert';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base_bloc/core/base/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'chatgpt_event.dart';
part 'chatgpt_state.dart';
part 'chatgpt_bloc.freezed.dart';

class ChatgptBloc extends BaseBloc<ChatgptEvent, ChatgptState> {
  final ChatUser currentUser = ChatUser(id: '1', firstName: "Me");
  final ChatUser chatGPTUser = ChatUser(id: '2', firstName: "FloBot");

  final Gemini gemini;

  ChatgptBloc(Gemini instance, {required this.gemini})
      : super(const ChatgptState()) {
    on<_Started>(_onStarted);
    on<_SendMessage>(_onSendMessage);
    on<_LoadMessages>(_onLoadHistory);
  }

  Future<void> _onStarted(_Started event, Emitter<ChatgptState> emit) async {
    emit(state.copyWith(isLoading: true));
    List<ChatMessage> history = await _loadChatHistory();
    emit(state.copyWith(chatgptList: history, isLoading: false));
  }

  Future<void> _onLoadHistory(
      _LoadMessages event, Emitter<ChatgptState> emit) async {
    List<ChatMessage> history = await _loadChatHistory();
    emit(state.copyWith(chatgptList: history));
  }

  Future<void> _onSendMessage(
      _SendMessage event, Emitter<ChatgptState> emit) async {
    List<ChatMessage> updatedMessages = [
      ChatMessage(
          user: currentUser, createdAt: DateTime.now(), text: event.message),
      ...state.chatgptList,
    ];
    // debugPrint("updatedMessages.length: ${updatedMessages.length}");

    emit(state.copyWith(chatgptList: updatedMessages, isLoading: true));

    try {
      final response = await gemini.text(event.message);
      if (response?.output != null) {
        updatedMessages.insert(
          0,
          ChatMessage(
              user: chatGPTUser,
              createdAt: DateTime.now(),
              text: response!.output!),
        );

        emit(state.copyWith(chatgptList: updatedMessages, isLoading: false));
        await _saveChatHistory(updatedMessages);
      }
    } catch (e) {
      debugPrint("Lỗi khi gọi Gemini API: $e");
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _saveChatHistory(List<ChatMessage> messages) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> encodedMessages =
        messages.map((msg) => jsonEncode(msg.toJson())).toList();
    await prefs.setStringList('chat_history', encodedMessages);
  }

  Future<List<ChatMessage>> _loadChatHistory() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? encodedMessages = prefs.getStringList('chat_history');

    if (encodedMessages == null) return [];

    return encodedMessages
        .map((msg) => ChatMessage.fromJson(jsonDecode(msg)))
        .toList();
  }
}
