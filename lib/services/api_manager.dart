import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api/constants/strings.dart';
import 'package:rest_api/models/lek_laos_info.dart';
import 'package:rest_api/models/newsinfo.dart';

class API_Manager {
  Future<Welcome> getNews() async {
    var client = http.Client();
    var newModels = null;

    try {
      var response = await client.get(Strings.new_url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newModels = Welcome.fromJson(jsonMap);
      }
    } catch (exception) {
      return newModels;
    }
    return newModels;
  }
}

class LekLaos {
  static get(){
    var url = "https://retechsole.com/lekdet_api/public/api/lek-lao";
    var jsonString;
    var data;
    http.get(url).then((response) {
      jsonString = response.body;
      data = json.decode(jsonString);
      print(data);
    });

    // var client = http.Client();
    // var newModels = null;
    //
    // try {
    //   var response = await client.get(url);
    //   if (response.statusCode == 200) {
    //     var jsonString = response.body;
    //     var jsonMap = json.decode(jsonString);
    //
    //     newModels = LekLaos.fromJson(jsonMap);
    //   }
    // } catch (exception) {
    //   return newModels;
    // }
    // return newModels;

  }
}
