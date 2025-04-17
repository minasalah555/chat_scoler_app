import 'package:chat_scoler_app/models/message_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_scoler_app/constents.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages = FirebaseFirestore.instance.collection(
    KMessagesCollection,
  );
  List<MessageModel> messageList = [];

  void addMessage({required String message, required String email}) {
    try {
      messages.add({
        Kmessage: message,
        kCreatedAt: DateTime.now(),
        kEmail: email,
      });
      getMessages();
    } on Exception catch (e) {
      emit(ChatFailure());
    }
  }

  void getMessages() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messageList = [];
      for (int i = 0; i < event.docs.length; i++) {
        messageList.add(MessageModel.jsonData(event.docs[i]));
      }
      emit(ChatSuccess());
    });
  }
}
