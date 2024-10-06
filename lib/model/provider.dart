import 'package:flutter/cupertino.dart';

class ChatListProvider extends ChangeNotifier {
  List chat = [] ;


  void updateChatList(String newChat)  {
    chat.add(newChat);
    notifyListeners();
  }
}

class CounterProvider extends ChangeNotifier {
  int counter=0;


  void changeCounter() {
    counter++;
    notifyListeners();
  }
}
