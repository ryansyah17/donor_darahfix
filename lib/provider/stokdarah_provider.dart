import 'package:donor_darah/services/stokdarah_services.dart';
import 'package:flutter/widgets.dart';

import '../models/stokdarah.dart';

class StokdarahProvider extends ChangeNotifier {
  List<Data> _stokDarah = [];
  List<Data> get stokDarah => _stokDarah;

  set stokDarah(List<Data> stokDarah) {
    _stokDarah = stokDarah;
    notifyListeners();
  }

  Future<void> getStokdarah() async {
    try {
      List<Data> stokDarah = await StokdarahService().getStokdarah();
      _stokDarah = stokDarah;
      print('Data berhasil diambil');
    } catch (e) {
      print(e);
    }
  }
}
