class JadwalResult {
  bool? success;
  String? message;
  List<Jadwal>? data;

  JadwalResult({this.success, this.message, this.data});

  JadwalResult.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Jadwal>[];
      json['data'].forEach((v) {
        data!.add(new Jadwal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Jadwal {
  int? id;
  String? nameStand;
  String? waktu;
  double? latitude;
  double? longitude;
  String? picture;
  String? location;
  String? createdAt;
  String? updatedAt;

  Jadwal(
      {this.id,
      this.nameStand,
      this.waktu,
      this.latitude,
      this.longitude,
      this.picture,
      this.location,
      this.createdAt,
      this.updatedAt});

  Jadwal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameStand = json['name_stand'];
    waktu = json['waktu'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    picture = json['picture'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_stand'] = this.nameStand;
    data['waktu'] = this.waktu;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['picture'] = this.picture;
    data['location'] = this.location;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

List<Jadwal> mockJadwal = [
  Jadwal(
      id: 1,
      picture:
          'https://pmidiy.or.id/wp-content/uploads/2021/05/20210511_103323-2048x1152.jpg',
      waktu: '09.00 - 11.00  WIB',
      latitude: -0.927115004362968,
      longitude: 100.42774221215359,
      location: 'Jln. Bukittingi No. 23',
      nameStand: 'Stand Mobil 1'),
  //
];
