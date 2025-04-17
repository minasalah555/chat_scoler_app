import 'package:chat_scoler_app/constents.dart';

class MessageModel {
  final String message;
  final String id;

  MessageModel(this.message, this.id);

  factory MessageModel.jsonData(jsonData) {
    return MessageModel(jsonData[Kmessage], jsonData[kEmail]);
  }
}
