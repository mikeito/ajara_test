import 'dart:convert';

import 'package:ajara_test/service/registrationService.dart';
import 'package:ajara_test/styleguides/colors.dart';
import 'package:ajara_test/widgets/background_header.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Registration extends StatefulWidget {
  Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String _name = '';
  String _email = '';
  String _phoneNumber = '';
  String _countryCode = '';

  var resultData;
  var api_response;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildUserName() {
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
          if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
            return 'No special chars allowed.';
          }

          return null;
        },
        onSaved: (value) {
          _name = value!;
        },
      ),
    );
  }

  Widget _buildEmail() {
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
          _email = value!;
        },
      ),
    );
  }

  Widget _buildPhone() {
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
            // initialCountryCode: 'CM',
            onChanged: (phone) {
              print('Complete phone number: ' + phone.completeNumber);
              _countryCode = phone.countryISOCode!;
              _phoneNumber = phone.completeNumber;
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final registration = RegistrationService(username: _name, email_address: _email, phone_number: _phoneNumber, country_code: _countryCode);

    return SingleChildScrollView(
      reverse: true,
      child: Form(
        key: _formKey,
        child: Container(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                Flexible(flex: 2, child: BackgroundHeader()),
                Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildUserName(),
                          // SizedBox(height: 7.0,),
                          _buildEmail(),
                          SizedBox(height: 18.0,),
                          _buildPhone(),
                          SizedBox(height: 14.0,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.blueAccent,
                              primary: primaryColor,
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 132.0),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                              ),
                            ),
                            child: Text(
                              'Next',
                              style:
                                  TextStyle(color: tertiaryColor, fontSize: 24),
                            ),
                            onPressed: () async {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }

                              _formKey.currentState!.save();

                              final registration = RegistrationService(
                                  username: _name,
                                  email_address: _email,
                                  phone_number: _phoneNumber,
                                  country_code: _countryCode);

                              //Send to API
                              resultData = await registration.submitForm();
                              api_response = resultData["message"];
                              print(resultData["message"]);

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(api_response)));
                            },
                          )
                        ],
                      ),
                    )),
              ],
            )),
      ),
    );
  }
}
