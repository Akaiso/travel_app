import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

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
   String? aiResponse ;

  Future<void> sendAiMessage() async {
    final model = GenerativeModel(
        model: "gemini-1.5-flash-latest", apiKey: dotenv.get("AI_API_KEY"));
    final prompt = GetStorage().read("chatMessage");    //_messageController.text.trim();
    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);
    aiResponse = response.text;
  }

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
      debugPrint("this is collectn::::::>>>>>>>>>>>>>>>>> $collectn");
    } else {
      await _firestore.collection('messages').add({
        'text': _messageController.text.trim(),
        'sender': null,
        'createdAt': Timestamp.now(),
      });
      debugPrint("this is collectn 2::::::>>>>>>>>>>>>>>>>> ");
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
        centerTitle: true,
        title: Text("Customer Support Chat", style: kBoldNormal()),
      ),
      body: Column(
        children: [
          // const Text(
          //     "This is for the purpose of state management with provider"),
          // Container(
          //   color: Colors.orange,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Text("${context.watch<CounterProvider>().counter}"),
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
         // Text("${context.watch<ChatListProvider>().chat}"),
         //  const Divider(
         //    thickness: 1,
         //    color: Colors.black,
         //    indent: 5,
         //  ),
         // const Text("Chat begins here: "),
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
                      color: Colors.black,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                context.watch<ChatListProvider>().chat[index], style: const TextStyle(color: Colors.white),),
                          ),
                        )
                      ],
                    ),
                  ),
                );

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
                    setState(() async {
                      validateChatField();
                      // _sendMessage();
                      debugPrint("${ChatListProvider().chat}");
                      if (_messageController.text == '') {
                        return;
                      } else {
                        context
                            .read<ChatListProvider>()
                            .updateChatList(_messageController.text);
                        GetStorage().write("chatMessage" , _messageController.text);
                        _messageController.clear();
                      }
                      await sendAiMessage();
                      if(context.mounted){
                        context.read<ChatListProvider>().updateChatList(aiResponse!);
                      }
                      GetStorage().remove("chatMessage");

                      context.read<CounterProvider>().changeCounter();


                      debugPrint("This is the aiResponse: $aiResponse");
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
