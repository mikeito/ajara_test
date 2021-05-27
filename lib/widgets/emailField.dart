import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  String email;
  EmailField({Key? key, required this.email}) : super(key: key);

  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Email is Required';
          }

          if (!RegExp(
              r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
              .hasMatch(value)) {
            return 'Please enter a valid email Address';
          }

          return null;
        },
        onSaved: (value) {
          widget.email = value!;
        },
      ),
    );
  }
}
