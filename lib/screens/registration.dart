import 'package:ajara_test/styleguides/colors.dart';
import 'package:ajara_test/widgets/background_header.dart';
import 'package:ajara_test/widgets/emailField.dart';
import 'package:ajara_test/widgets/phoneNumberField.dart';
import 'package:ajara_test/widgets/userNameField.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Registration extends StatefulWidget {
  Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String _name = '';
  String _email = '';
  String _phone = '';

  // UserNameField userNameField = UserNameField();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  submitForm() async {
    final String apiLink = 'https://sandbox.nellys-coin.ejaraapis.xyz/api/v1/auth/sign-up/check-signup-details';
    var url = Uri.parse(apiLink);

    var response = await http.post(url, body: {
      'username': 'steve',
      'email_address': 'steve@gmail',
      'phone_number': '+237655447788',
      'country_code': 'CM',
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      reverse: true,
      child: Form(
        key: _formKey,
        child: Container(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: BackgroundHeader()
                ),
                Flexible(
                  flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          UserNameField(name: _name,),
                          EmailField(email: _email),
                          PhoneNumberField(phone: _phone),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.blueAccent,
                              primary: primaryColor,
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 132.0),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              ),
                            ),
                            child: Text(
                              'Next',
                              style: TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            onPressed: () {
                              // submitForm();
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }

                              _formKey.currentState!.save();

                              print('saving');
                              print(_name);
                              print(_email);

                              //Send to API
                            },
                          )
                        ],
                      ),
                    )
                ),
              ],
            )),
      ),
    );
  }
}
