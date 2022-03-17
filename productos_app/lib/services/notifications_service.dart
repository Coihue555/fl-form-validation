import 'package:flutter/material.dart';

class NotificationsService{
  static late GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackbar( String message){
    final snackbar = SnackBar(
      content: Text(message)
    );

    messengerKey.currentState!.showSnackBar(snackbar);
  }
}