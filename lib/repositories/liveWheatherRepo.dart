import 'dart:convert';

import 'package:a_to_d_assignemt/models/cityListModel.dart';
import 'package:a_to_d_assignemt/models/liveWeatherModel.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class LiveWeatherRepo {
  final constants = Constants();
  Future<LiveWeatherModel> getLiveWeather(cityId, tocken) async {
    String url =
        constants.base_url + 'live-weather/${cityId}?access_token=${tocken}';
    print(url);
    http.Response r = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tocken',
        'accept': 'application/json',
      },
    );
    print(r.body);
    if (r.statusCode == 201) {
      var obj = json.decode(r.body);
      var data = LiveWeatherModel.fromJson(obj);
      return data;
    } else {
      var obj = json.decode(r.body);
      var data = LiveWeatherModel.fromJson(obj);
      return data;
    }
  }
}
