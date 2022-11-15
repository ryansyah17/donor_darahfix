import 'dart:convert';

import 'package:donor_darah/models/stokdarah.dart';
import 'package:donor_darah/ui/pages/berhasil_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

var listStokDarah = <Data>[].obs;

class StokdarahService {
  String baseUrl = 'http://44.210.160.13/api/stokdarah/stokdarah/';

  Future<List<Data>> getStokdarah() async {
    listStokDarah.clear();
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
      List<Data> stokDarah = [];

      datalist.map((e) => stokDarah.add(Data.fromJson(e))).toList();

      print(stokDarah[0]);
      listStokDarah.value = stokDarah;
      listStokDarah.refresh();

      return stokDarah;
    } else {
      throw Exception('Gagal mengambil data darah');
    }
  }

  Future<void> putStokDarah(String typedarah, String stok) async {
    var url = Uri.parse(baseUrl + "${listStokDarah.value[0].id}");
    Map body = {
      "goldarah_a": typedarah == 'A'
          ? (int.parse(listStokDarah.value[0].goldarahA.toString()) -
                  int.parse(stok.toString()))
              .toString()
          : listStokDarah.value[0].goldarahA,
      "goldarah_b": typedarah == 'B'
          ? (int.parse(listStokDarah.value[0].goldarahB.toString()) -
                  int.parse(stok.toString()))
              .toString()
          : listStokDarah.value[0].goldarahB,
      "goldarah_ab": typedarah == 'AB'
          ? (int.parse(listStokDarah.value[0].goldarahAb.toString()) -
                  int.parse(stok.toString()))
              .toString()
          : listStokDarah.value[0].goldarahAb,
      "goldarah_o": typedarah == 'O'
          ? (int.parse(listStokDarah.value[0].goldarahO.toString()) -
                  int.parse(stok.toString()))
              .toString()
          : listStokDarah.value[0].goldarahO
    };
    var response = await http.put(url, body: body);
    if (response.statusCode == 200) {
      getStokdarah();
      BerhasilPage();
    } else {
      Get.snackbar("Failed", "Gagal Ambil Stok");
    }
  }
}
