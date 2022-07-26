abstract class ChatsStates{}
class ChatsInitialState extends ChatsStates{}

class ChatsGetUserDataLoadingState extends ChatsStates{}
class ChatsGetUserDataSuccessState extends ChatsStates{}
class ChatsGetUserDataErrorState extends ChatsStates{
  final String error;
  ChatsGetUserDataErrorState(this.error);
}

class ChatsGetUsersLoadingState extends ChatsStates{}
class ChatsGetUsersSuccessState extends ChatsStates{}
class ChatsGetUsersErrorState extends ChatsStates{
  final String error;
  ChatsGetUsersErrorState(this.error);
}

class ChatSendMessageLoadingState extends ChatsStates{}
class ChatSendMessageSuccessState extends ChatsStates{}
class ChatSendMessageErrorState extends ChatsStates{
  final String error;
  ChatSendMessageErrorState(this.error);
}

class ChatGetMessagesLoadingState extends ChatsStates{}
class ChatGetMessagesSuccessState extends ChatsStates{}
class ChatGetMessagesErrorState extends ChatsStates{
  final String error;
  ChatGetMessagesErrorState(this.error);
}