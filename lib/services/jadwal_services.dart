import 'dart:convert';

import 'package:donor_darah/models/jadwal.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

var listJadwal = <Jadwal>[].obs;

class JadwalServices {
  String baseUrl = 'http://44.210.160.13/api/jadwal/jadwal';
  // get
  Future<List<Jadwal>> getJadwal() async {
    listJadwal.clear();
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
      List<Jadwal> jadwal = [];

      // datalist.map((e) => jadwal.add(Jadwal.fromJson(e))).toList();

      print(jadwal[0]);
      listJadwal.value = jadwal;
      listJadwal.refresh();

      return jadwal;
    } else {
      throw Exception('Gagal mengambil data Jadwal');
    }
  }
}
