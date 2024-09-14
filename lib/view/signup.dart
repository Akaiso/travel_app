import 'package:flutter/material.dart';

import '../controller/authentication.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final auth = Auth();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter your name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "password",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter your password";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "confirm password",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter your password";
                          }
                          if (value != _passwordController.text) {
                            return "password don't match";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _phoneController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "phone number",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter your phone number";
                          }
                          if (value != _passwordController.text) {
                            return "password don't match";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _formKey.currentState!.validate();
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Sign up successful")));
                            }
                            try {} catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Signup failed")));
                            }
                            auth.signup(
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                                _passwordController.text.trim(),
                                _phoneController.text.trim());
                          },
                          child: const Text(" Sign up"))
                    ],
                  ),
                ),
              ))
        ],
      ),
    ));
  }
}