part of 'chatgpt_bloc.dart';

@freezed
class ChatgptState extends BaseState with _$ChatgptState {
  const factory ChatgptState({
    @Default([]) List<ChatMessage> chatgptList,
    @Default(false) bool isLoading,
  }) = _ChatgptState;
}
