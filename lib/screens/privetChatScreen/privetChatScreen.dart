import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet/cubits/chatsCubit/cubit.dart';
import 'package:meet/cubits/chatsCubit/states.dart';
import 'package:meet/models/messageModel.dart';
import 'package:meet/models/userModel.dart';
import 'package:meet/shared/styles/icon_broken.dart';
class PrivetChatScreen extends StatelessWidget {
  final UserModel model;
  PrivetChatScreen(this.model, {Key? key}) : super(key: key);

  final _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatsCubit, ChatsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ChatsCubit chatsCubit = ChatsCubit.get(context);
        //UserModel userModel=chatsCubit.userModel;
        MessageModel messageModel = chatsCubit.messageModel;
        List<MessageModel> messages = chatsCubit.messages;
        if (state is! ChatsInitialState) {
          chatsCubit.getMessages(receiverId: model.userID!);
          return Scaffold(
            appBar: AppBar(
              titleSpacing: 0.0,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage('${model.image}'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${model.name}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 20),
                  )
                ],
              ),
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 510,
                      child: Expanded(child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var message=chatsCubit.messages[index];
                          if(model.userID==message.senderID){
                            return buildMessage(message);
                          }
                          else {
                            return buildMyMessage(message);
                          }
                        },
                        separatorBuilder: (context, index) => SizedBox(height: 5,),
                        itemCount: chatsCubit.messages.length),),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _messageController,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  hintText: "Type a message",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  )),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                             CircleAvatar(radius: 22,
                            child:IconButton(onPressed: (){
                              chatsCubit.sendMessage(
                                  dateTime: DateTime.now().toString(),
                                  receiverID: model.userID!,
                                  text: _messageController.text);
                            },
                                icon:const Icon(IconBroken.Send) )
                              )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget buildMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child:  Text(
                  "${model.text}",
                  maxLines: 45,
                )),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      );

  Widget buildMyMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.2),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5.0,
                ),
                child: Text("${model.text}")),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      );
}
