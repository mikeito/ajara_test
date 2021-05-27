import 'package:flutter/material.dart';

class UserNameField extends StatefulWidget {
  String name;
  UserNameField({Key? key, required this.name}) : super(key: key);

  @override
  _UserNameFieldState createState() => _UserNameFieldState();
}

class _UserNameFieldState extends State<UserNameField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(labelText: 'Name'),
        maxLength: 30,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Name is Required';
          }
          if (value.length < 3) return 'it should be more than 3 chars';
          // value.length < 3 ? 'it should be more than 3 chars' : '';
          if (!RegExp(
              r'^[a-zA-Z0-9_]+$')
              .hasMatch(value)) {
            return 'No special chars allowed.';
          }

          return null;
        },
        onSaved: (value) {
          widget.name = value!;
        },
      ),
    );
  }
}
