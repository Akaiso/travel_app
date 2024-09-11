import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:travel_app/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  Future<void> _sendEmail() async {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String message = _messageController.text;

    final Uri emailUri = Uri(scheme: 'mailto',
    path: 'your-email@example.com',
    query: 'subject=Contact Us Message from $name&body=$message\n\nEmail: $email');

    if(await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not launch email app."))
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text("Contact Us"),),
            body:  SingleChildScrollView(
      child: Column(
        children: [
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 30.0),
             child: Container(
              color: Colors.white,
              child: const ListTile(
                leading: Text("Head Office"),
                title: Text(
                    "House 9324, flat 80, Birland Crescent, Kubwa, Abuja. P.O.Box 9001"),
                subtitle: Text("+234(0) 8080000000 \n+234(0) 8030000000"),
                trailing: Text("youremail@ejece.com"),
              ),
                       ),
           ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width < 800? 20.0 : MediaQuery.of(context).size.width/3.5),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "please enter your name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16,),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please enter your email";
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16,),
                  TextFormField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      labelText: "Message",
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 5,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please enter a message";
                      }
                      return null;
                    }
                  ),
                  const SizedBox(height: 16,),
                  ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        _sendEmail();
                      }
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(kGreenFooter())),
                    child: const Text("Send Message"),

                  )
                ],
              ),

            ),
          )

        ],
      ),
    )));
  }
}
