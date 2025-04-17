import 'package:chat_scoler_app/constents.dart';
import 'package:chat_scoler_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_scoler_app/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  static String id = 'ChatView';

  final _controller = ScrollController();
  TextEditingController controller = TextEditingController();
  CollectionReference messages = FirebaseFirestore.instance.collection(
    KMessagesCollection,
  );

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(kLogo, width: 70, height: 70),
            Text('Chat', style: TextStyle(fontSize: 22, color: Colors.white)),
          ],
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                var messageList =
                    BlocProvider.of<ChatCubit>(context).messageList;
                return ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messageList.length,
                  itemBuilder: (context, index) {
                    if (email == messageList[index].id) {
                      return MessageWidget(messageModel: messageList[index]);
                    } else {
                      return MessageWidgetSecondUser(
                        messageModel: messageList[index],
                      );
                    }
                  },
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (message) {
                BlocProvider.of<ChatCubit>(
                  context,
                ).addMessage(message: message, email: email);
                // print('on submitted ->$message');
                controller.clear();

                _controller.animateTo(
                  0,
                  duration: Duration(milliseconds: 1),
                  curve: Curves.fastOutSlowIn,
                );
              },

              // onChanged: (data) {
              //   print('on Change ->$data');
              // },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: Icon(Icons.send, color: kPrimaryColor),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


//005F83