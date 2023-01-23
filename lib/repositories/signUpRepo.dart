import 'dart:convert';

import 'package:a_to_d_assignemt/constants.dart';
import 'package:a_to_d_assignemt/models/userModel.dart';
import 'package:http/http.dart' as http;

class SignUpRepo {
  final constants = Constants();
  Future<UserDataModel> signUp(name, email, phone, password, country) async {
    String url = constants.base_url + 'create-user';
    var body = json.encode({
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "country": country
    });
    print(body);
    http.Response r = await http.post(Uri.parse(url),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: body);
    print(r.body);
    if (r.statusCode == 201) {
      var obj = json.decode(r.body);

      var data = UserDataModel.fromJson(obj);
      return data;
    } else {
      var obj = json.decode(r.body);

      return UserDataModel(
          status: false,
          msg: obj['message'],
          data: Data(
              name: name,
              email: email,
              phone: phone,
              password: password,
              country: country,
              id: 'id',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              v: 0));
    }
  }
}
