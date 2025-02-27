part of 'chatgpt_bloc.dart';

@freezed
class ChatgptEvent extends BaseEvent with _$ChatgptEvent {
  const factory ChatgptEvent.started() = _Started;
  const factory ChatgptEvent.sendMessage(String message) = _SendMessage;
  const factory ChatgptEvent.loadMessages() = _LoadMessages;
}
