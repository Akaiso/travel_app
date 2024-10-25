import 'package:flutter/cupertino.dart';

class ChatListProvider extends ChangeNotifier {
  List chat = [] ;
  List searched = [];

  void showSearched(){
    notifyListeners();
  }

void updateSearched(List list){
    searched = list;
    notifyListeners();
}

  void updateChatList(String newChat)  {
    chat.insert(0,newChat);
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
