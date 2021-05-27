import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberField extends StatefulWidget {
  final String phone;
  const PhoneNumberField({Key? key, required this.phone}) : super(key: key);

  @override
  _PhoneNumberFieldState createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntlPhoneField(
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            initialCountryCode: 'CM',

            onChanged: (phone) {
              print('Complete phone number: ' + phone.completeNumber);
            },
            onCountryChanged: (phone) {
              print('Country code changed to: ' + phone.countryISOCode!);
            },
          ),
          Text(
            'A confirmation code will be send to you.',
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
