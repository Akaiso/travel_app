import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/provider.dart';
import '../utils/font.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _messageController = TextEditingController();

  //Finction to send a message
  Future<void> _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;

    final User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('messages').add({
        'text': _messageController.text.trim(),
        'sender': user.email,
        'createdAt': Timestamp.now(),
      });
      _messageController.clear();
      dynamic collectn = _firestore.collection.toString();
      print("this is collectn::::::>>>>>>>>>>>>>>>>> $collectn");
    } else {
      await _firestore.collection('messages').add({
        'text': _messageController.text.trim(),
        'sender': null,
        'createdAt': Timestamp.now(),
      });
      print("this is collectn 2::::::>>>>>>>>>>>>>>>>> ");
      //return CircularProgressIndicator();
    }
  }

  void checkIfRegistered() {
    final User? user = _auth.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Kindly SignUp to chat with one of our agents')));
    }
  }

  // List chat = [];
  int counter = 0;
  String errorMessage = '';

  void validateChatField() {
    setState(() {
      if (_messageController.text == '') {
        errorMessage = "field MUST not be empty";
      } else {
        errorMessage = '';
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _firestore
    //    .collection('messages')
    //    .orderBy('createdAt', descending: true)
    //    .snapshots();
    // checkIfRegistered();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Customer Support Chat", style: kBoldNormal()),
      ),
      body: Column(
        children: [
          const Text("This is for the purpose of state management with provider"),
          Container(
            color: Colors.orange,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${context.watch<CounterProvider>().counter}"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text("${context.watch<ChatListProvider>().chat}"),
          const Divider(thickness: 1,color: Colors.black, indent: 5,),
          const Text("Chat begins here: "),

          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: context.read<ChatListProvider>().chat.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 80, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                context.watch<ChatListProvider>().chat[index]),
                          ),
                        )
                      ],
                    ),
                  ),
                );

                ;

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     child: ListTile(
                //     tileColor: Colors.green,
                //     title: Text(chat[index]),
                //                   ),
                //   ),
                // );
              },
            ),

            // StreamBuilder(
            //   stream: _firestore
            //       .collection('messages')
            //       .orderBy('createdAt', descending: true)
            //       .snapshots(),
            //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //     if (!snapshot.hasData) {
            //       return const Center(
            //           child:
            //           Text("Your chat will be seen here..."),
            //       ); //CircularProgressIndicator());
            //     }
            //    final messages = snapshot.data!.docs;
            //     return ListView.builder(
            //         reverse: true,
            //         itemCount: messages.length,
            //         itemBuilder: (context, index) {
            //          final message = messages[index];
            //           return  ListTile(
            //             title: Text(message['text']),
            //             subtitle: Text('sent by: ${message['sender']}'),
            //           );
            //         });
            //   },
            // ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    // onChanged: (value){
                    //   if(value == ''){
                    //      errorMessage = "wrong input";
                    //   }
                    // },
                    // validator: (value) {
                    //   if (value == null) {
                    //     errorMessage = "enter a value";
                    //   }
                    //   return null;
                    // },
                    controller: _messageController,
                    decoration: InputDecoration(
                      labelText: 'Enter your message...',
                      labelStyle: const TextStyle(color: Colors.black),
                      errorText: errorMessage,
                      border: const OutlineInputBorder(),
                      errorStyle: const TextStyle(color: Colors.red),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusColor: Colors.black,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      validateChatField();
                      // _sendMessage();
                      print(ChatListProvider().chat);
                      if (_messageController.text == '') {
                        return;
                      } else {
                        context
                            .read<ChatListProvider>()
                            .updateChatList(_messageController.text);
                      }
                      _messageController.clear();
                      context.read<CounterProvider>().changeCounter();
                      print("Hi");
                    });
                  },
                  icon: const Icon(Icons.send),
                ),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
