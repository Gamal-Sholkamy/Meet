import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet/cubits/chatsCubit/states.dart';
import 'package:meet/models/messageModel.dart';
import 'package:meet/models/userModel.dart';
import 'package:meet/shared/local/cacheHelper.dart';

class ChatsCubit extends Cubit<ChatsStates> {
  ChatsCubit():super(ChatsInitialState());
  static ChatsCubit get(context) => BlocProvider.of(context);
  UserModel userModel=UserModel();
  MessageModel messageModel=MessageModel();
  void getUserDataToChats() {
    emit(ChatsGetUserDataLoadingState());
    String userID = CacheHelper.getData(key: 'userID');
    FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(ChatsGetUserDataSuccessState());
    }).catchError((e) {
      emit(ChatsGetUserDataErrorState(e.toString()));
    });
  }
  List<UserModel>users=[];
  void getUsers() {
    if (users.isEmpty) {
      emit(ChatsGetUsersLoadingState());
      FirebaseFirestore.instance.collection('users').get()
          .then((value) {
        value.docs.forEach((element) {
          if (element.data()['userID'] != CacheHelper.getData(key: 'userID')) {
            users.add(UserModel.fromJson(element.data()));
          }
        });
        emit(ChatsGetUsersSuccessState());
      }).catchError((onError) {
        emit(ChatsGetUsersErrorState(onError.toString()));
      });
    }
  }

  /// Send Message /////////////////////////////////////////////
  void sendMessage({
    required String dateTime,
    required String receiverID,
    required String text,
  })
  {

    messageModel=MessageModel(
      text: text,
      senderID: userModel!.userID,
      receiverID: receiverID,
      dateTime: dateTime,
    );
    emit(ChatSendMessageLoadingState());
    /// add message to sender collection
    FirebaseFirestore.instance.
    collection('users').doc(userModel!.userID).
    collection('chats').doc(receiverID).
    collection('messages').add(messageModel!.toMap())
        .then((value) {
      emit(ChatSendMessageSuccessState());
    }).catchError((onError){
      emit(ChatSendMessageErrorState(onError.toString()));
    });
    /// add message to receiver collection
    FirebaseFirestore.instance.
    collection('users').doc(receiverID).
    collection('chats').doc(userModel!.userID).
    collection('messages').add(messageModel!.toMap())
        .then((value) {
      emit(ChatSendMessageSuccessState());
    }).catchError((onError){
      emit(ChatSendMessageErrorState(onError.toString()));
    });

  }
  ///get Messages
  List<MessageModel> messages=[];
  void getMessages(
      {
        required String receiverId,
      }
      ){
    FirebaseFirestore.instance.
    collection('users').doc(userModel!.userID!).
    collection('chats').doc(receiverId).
    collection('messages').orderBy('dateTime')
        .snapshots().
    listen((event) {
      messages=[];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });
      emit(ChatGetMessagesSuccessState());
    });


  }


}