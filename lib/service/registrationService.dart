import 'dart:convert';

import 'package:http/http.dart' as http;

class RegistrationService {
  final String username;
  final String email_address;
  final String phone_number;
  final String country_code;

  RegistrationService(
      {required this.username,
      required this.email_address,
      required this.phone_number,
      required this.country_code});

  Future submitForm() async {
    final String apiLink =
        'https://sandbox.nellys-coin.ejaraapis.xyz/api/v1/auth/sign-up/check-signup-details';
    var url = Uri.parse(apiLink);

    var response = await http.post(url, body: {
      'username': username,
      'email_address': email_address,
      'phone_number': phone_number,
      'country_code': country_code,
    });

    var jsonData = jsonDecode(response.body.toString());
    // var jsonData = {
    //   'statusCode': response.statusCode,
    //   'body': response.body,
    // };

    return jsonData;
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
  }
}
