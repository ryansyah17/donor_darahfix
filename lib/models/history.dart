// class History {
//   final int? id;
//   final String? picture;
//   final String? donor;
//   final String? tanggal;
//   final String? tempat;

//   History({
//     this.id,
//     this.picture,
//     this.donor,
//     this.tanggal,
//     this.tempat,
//   });
// }

class HistoryResult {
  bool? success;
  String? message;
  List<History>? data;

  HistoryResult({this.success, this.message, this.data});

  HistoryResult.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <History>[];
      json['data'].forEach((v) {
        data!.add(History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class History {
  int? id;
  int? idUsers;
  int? idPendonor;
  String? donorke;
  String? picture;
  String? tanggalDonor;
  String? lokasi;
  String? createdAt;
  String? updatedAt;

  History({
    this.id,
    this.idUsers,
    this.idPendonor,
    this.donorke,
    this.picture,
    this.tanggalDonor,
    this.lokasi,
    this.createdAt,
    this.updatedAt,
  });

  History.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUsers = json['id_users'];
    idPendonor = json['id_pendonor'];
    donorke = json['donorke'];
    picture = json['picture'];
    tanggalDonor = json['tanggal_donor'];
    lokasi = json['lokasi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_users'] = idUsers;
    data['id_pendonor'] = idPendonor;
    data['donorke'] = donorke;
    data['picture'] = picture;
    data['tanggal_donor'] = tanggalDonor;
    data['lokasi'] = lokasi;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

List<History> mockHistory = [
  History(
    id: 1,
    picture:
        'https://cdn.sekolah.mu/certificate/sertifikat-sekolahmu-3263774-1631417172-1.jpg',
    donorke: 'Donor Pertama',
    tanggalDonor: '17 April 2022',
    lokasi: 'Bukittinggi',
  ),
  History(
    id: 2,
    picture:
        'https://cdn.sekolah.mu/certificate/sertifikat-sekolahmu-3263774-1631417172-1.jpg',
    donorke: 'Donor Kedua',
    tanggalDonor: '17 Juli 2022',
    lokasi: 'Bukittinggi',
  ),
  History(
    id: 3,
    picture:
        'https://cdn.sekolah.mu/certificate/sertifikat-sekolahmu-3263774-1631417172-1.jpg',
    donorke: 'Donor Ketiga',
    tanggalDonor: '17 Oktober 2022',
    lokasi: 'Bukittinggi',
  ),
  History(
    id: 4,
    picture:
        'https://cdn.sekolah.mu/certificate/sertifikat-sekolahmu-3263774-1631417172-1.jpg',
    donorke: 'Donor Ketiga',
    tanggalDonor: '17 Oktober 2222',
    lokasi: 'Bukittinggi',
  ),
];
