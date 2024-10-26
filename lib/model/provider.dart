import 'package:flutter/cupertino.dart';

class ChatListProvider extends ChangeNotifier {
  List chat = [];

  void updateChatList(String newChat) {
    chat.insert(0, newChat);
    notifyListeners();
  }
}

class CounterProvider extends ChangeNotifier {
  int counter = 0;

  void changeCounter() {
    counter++;
    notifyListeners();
  }
}

class ChangeOriginProvider extends ChangeNotifier{
  String origin = "DUBAI";

  void changeOrigin(String newOrigin){
     origin = origin;
    notifyListeners();
  }

}
