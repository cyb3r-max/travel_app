import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/data_model.dart';

class DataServices {
  String baseUrl = "https://fakestoreapi.com/products/";
  Future<List<DataModel>> getInfo() async {
    var apiURL = "/apiPlaces";
    http.Response res = await http.get(Uri.parse(baseUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
