import 'Hotels.dart';

class CityModel {
  CityModel({
      this.cityName,
      this.cityPic,
      this.hotels,});

  CityModel.fromJson(dynamic json) {
    cityName = json['cityName'];
    cityPic = json['cityPic'];
    if (json['hotels'] != null) {
      hotels = [];
      json['hotels'].forEach((v) {
        hotels!.add(Hotel.fromJson(v));
      });
    }
  }
  String? cityName;
  String? cityPic;
  List<Hotel>? hotels;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cityName'] = cityName;
    map['cityPic'] = cityPic;
    if (hotels != null) {
      map['hotels'] = hotels!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}