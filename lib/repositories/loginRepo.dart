import 'dart:convert';

import 'package:a_to_d_assignemt/models/loginDataModel.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class LoginRepo {
  final constants = Constants();
  Future<LoginDataModel> login(
    email,
    password,
  ) async {
    String url = constants.base_url + 'login';
    var body = json.encode({
      "email": email,
      "password": password,
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
      var data = LoginDataModel.fromJson(obj);
      return data;
    } else {
      var obj = json.decode(r.body);
      print(obj['msg']);
      var data = LoginDataModel(
          email: '',
          token: '',
          msg: obj['msg'],
          liveWeather: LiveWeather(
              id: 'id',
              date: '',
              minTemperature: 0,
              maxTemperature: 0,
              temperature: 0,
              condition: 'condition',
              windSpeed: 0,
              humidity: 0,
              cityId: 'cityId',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now()));
      return data;
    }
  }
}
