import 'dart:convert';

import 'package:a_to_d_assignemt/constants.dart';
import 'package:a_to_d_assignemt/models/liveWeatherModel.dart';
import 'package:a_to_d_assignemt/models/otherForcastModel.dart';
import 'package:a_to_d_assignemt/models/smallForcastModel.dart';
import 'package:http/http.dart' as http;

class Forcast {
  final constants = Constants();
  Future<SmallForcastModel> getSmallForcast(cityId, tocken) async {
    String url = constants.base_url +
        'view-small-forecast/${cityId}?access_token=${tocken}';
    print(url);
    http.Response r = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tocken',
        'accept': 'application/json',
      },
    );
    print('obj ${r.body}');
    if (r.statusCode == 201) {
      var obj = json.decode(r.body);

      var data = SmallForcastModel.fromJson(obj);

      return data;
    } else {
      var obj = json.decode(r.body);
      var data = SmallForcastModel.fromJson(obj);
      return data;
    }
  }

  Future<OtherForcastModel> getOtherForcast(cityId, tocken) async {
    String url = constants.base_url +
        'view-other-forecast/${cityId}?access_token=${tocken}';

    http.Response r = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tocken',
        'accept': 'application/json',
      },
    );

    if (r.statusCode == 201) {
      var obj = json.decode(r.body);
      var data = OtherForcastModel.fromJson(obj);
      return data;
    } else {
      var obj = json.decode(r.body);
      var data = OtherForcastModel.fromJson(obj);
      return data;
    }
  }
}
