import 'dart:convert';

import 'package:donor_darah/models/history.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

var listHistory = <History>[].obs;

class HistoryServices {
  String baseUrl =
      'https://backend-donordarah.herokuapp.com/public/api/history/history/';

  Future<List<History>> getHistory() async {
    listHistory.clear();
    var url = Uri.parse(baseUrl);
    var header = {'Content-Type': 'application/json'};
    var response = await http.get(
      url,
      headers: header,
    );
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List datalist = data['data'] as List;
      List<History> history = [];

      datalist.map((e) => history.add(History.fromJson(e))).toList();

      print(history[0]);
      listHistory.value = history;
      listHistory.refresh();

      return history;
    } else {
      throw Exception('Gagal mengambil data history');
    }
  }
}
