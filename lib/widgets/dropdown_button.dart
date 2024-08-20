import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/utils/colors.dart';

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
    return FittedBox(fit: BoxFit.scaleDown,
      child: DropdownButton(
        iconEnabledColor: Colors.white,
          underline: const SizedBox(),
          isExpanded: false,
          value: _selectedValue,
          style: whiteNormal(),
          dropdownColor: kBlue(),
          items: const [
            DropdownMenuItem(value: 'English', child: Text('English')),
            DropdownMenuItem(value: 'French', child: Text('French')),
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
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: SizedBox(),
        underline: const SizedBox(),
        isExpanded: true,
        value: null,
        style: whiteNormal(),
        dropdownColor: kBlue(),
        hint: Container(
          width: 150,
          child: FittedBox(
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(child: Icon(Icons.person),),
                Container(width: 10,),
                Text('My Account',style: whiteNormal(),),
              ],
            ),
          ),
        ),
        items: [
          DropdownMenuItem(
              onTap: () {}, value: 'Login', child: const Text('Login')),
          DropdownMenuItem(
              onTap: () {}, value: 'Sign Up', child: const Text('Sign Up')),
        ],
        onChanged: (value) {});
  }
}
