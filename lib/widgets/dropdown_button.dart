import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travel_app/utils/colors.dart';
import 'package:travel_app/view/home_page.dart';
import 'package:travel_app/view/login.dart';
import 'package:travel_app/view/signup.dart';

import '../utils/font.dart';

class FlightCategorySelectionDropdown extends StatefulWidget {
  const FlightCategorySelectionDropdown({super.key});

  @override
  State<FlightCategorySelectionDropdown> createState() =>
      _FlightCategorySelectionDropdownState();
}

class _FlightCategorySelectionDropdownState
    extends State<FlightCategorySelectionDropdown> {
  String _selectedValue = 'Economy';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: MediaQuery.of(context).size.width / 12,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.transparent)),
      child: DropdownButton(
        isExpanded: true,
        underline: const SizedBox(),
        elevation: 0,
        value: _selectedValue,
        // style: const TextStyle(fontSize: 8),
        items: const [
          DropdownMenuItem(
            value: 'Economy',
            child: Text('Economy'),
          ),
          DropdownMenuItem(
              value: 'Premium Economy', child: Text('Premium Economy')),
          DropdownMenuItem(value: 'Business ', child: Text('Business ')),
          DropdownMenuItem(value: 'First Class', child: Text('First Class')),
        ],
        onChanged: (String? value) {
          setState(() {
            _selectedValue = value!;
          });
        },
      ),
    );
  }
}

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String _selectedValue = 'English';
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: DropdownButton(
          iconEnabledColor: Colors.white,
          underline: const SizedBox(),
          isExpanded: false,
          value: _selectedValue,
          style: kBoldWhiteNormal(),
          dropdownColor: kBlue(),
          items:  [
            DropdownMenuItem(value: 'English', child: Text('English',style: kBoldNormal())),
            DropdownMenuItem(value: 'French', child: Text('French', style: kBoldNormal())),
          ],
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
          }),
    );
  }
}

class MyAccountDropdown extends StatefulWidget {
  const MyAccountDropdown({super.key});

  @override
  State<MyAccountDropdown> createState() => _MyAccountDropdownState();
}

class _MyAccountDropdownState extends State<MyAccountDropdown> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        icon: const SizedBox(),
        underline: const SizedBox(),
        isExpanded: true,
        value: null,
        hint: FittedBox(
          child: SizedBox(
            width: 110,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                    child: CircleAvatar(
                  child: Icon(Icons.person),
                )),
                Container(
                  width: 10,
                ),
                Text(
                  'My Account',
                  style: kBoldWhiteNormal(),
                ),
              ],
            ),
          ),
        ),
        items: [
          DropdownMenuItem(
              value: 'Login', child: Text('Login', style: kBoldNormal())),
          DropdownMenuItem(
              value: 'Sign Up', child: Text('Sign Up', style: kBoldNormal())),
        ],
        onChanged: (value) {
          selectedValue = value;
          if (value != null) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              switch (value) {
                case "Login":
                  return const LogIn();
                case "Sign Up":
                  return const SignUp();
                default:
                  return const HomePage();
              }
            }));
          }
        });
  }
}
