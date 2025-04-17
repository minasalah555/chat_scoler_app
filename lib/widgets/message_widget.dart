import 'package:chat_scoler_app/constents.dart';
import 'package:chat_scoler_app/models/message_model.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({required this.messageModel});
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,

      child: Container(
        padding: EdgeInsets.only(top: 32, bottom: 32, right: 32, left: 16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
            topLeft: Radius.circular(32),
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            messageModel.message,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////
///
class ErrorMessagerWidgetFirst extends StatelessWidget {
  const ErrorMessagerWidgetFirst({required this.messageModel});
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,

      child: Container(
        padding: EdgeInsets.only(top: 32, bottom: 32, right: 32, left: 16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
            topLeft: Radius.circular(32),
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            messageModel.message,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

///
class MessageWidgetSecondUser extends StatelessWidget {
  const MessageWidgetSecondUser({required this.messageModel});
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,

      child: Container(
        padding: EdgeInsets.only(top: 32, bottom: 32, right: 32, left: 16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xff005F83),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
            topLeft: Radius.circular(32),
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            messageModel.message,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

///
class ErrorMessagerWidget extends StatelessWidget {
  const ErrorMessagerWidget({required this.messageModel});
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,

      child: Container(
        padding: EdgeInsets.only(top: 32, bottom: 32, right: 32, left: 16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
            topLeft: Radius.circular(32),
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            messageModel.message,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
