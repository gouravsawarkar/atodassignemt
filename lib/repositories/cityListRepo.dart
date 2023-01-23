import 'dart:convert';

import 'package:a_to_d_assignemt/models/cityListModel.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class CityListRepo {
  final constants = Constants();
  Future<CityListModel> getCityList(tocken) async {
    String url = constants.base_url + 'city-list?page=1&limit=5';

    http.Response r = await http.get(
      Uri.parse(url),
      headers: {
         'Authorization': 'Bearer $tocken',
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    print(r.body);
    if (r.statusCode == 201) {
      var obj = json.decode(r.body);
      var data = CityListModel.fromJson(obj);
      return data;
    } else {
      var obj = json.decode(r.body);
      var data = CityListModel.fromJson(obj);
      return data;
    }
  }
}
