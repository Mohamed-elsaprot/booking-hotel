class Hotel {
  Hotel({
      this.describtion, 
      this.hotelCover, 
      this.imageLinks, 
      this.location, 
      this.name, 
      this.price,
      this.rate, 
      this.revNum, 
      this.roomsNumber,});

  Hotel.fromJson(dynamic json) {
    describtion = json['describtion'];
    hotelCover = json['hotelCover'];
    imageLinks = json['imageLinks'] != null ? json['imageLinks'].cast<String>() : [];
    location = json['location'];
    name = json['name'];
    price = json['price'];
    rate = json['rate'];
    revNum = json['revNum'];
    roomsNumber = json['roomsNumber'];
  }
  String? describtion;
  String? hotelCover;
  List<String>? imageLinks;
  String? location;
  String? name;
  int? price;
  int? rate;
  int? revNum;
  int? roomsNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['describtion'] = describtion;
    map['hotelCover'] = hotelCover;
    map['imageLinks'] = imageLinks;
    map['location'] = location;
    map['name'] = name;
    map['price'] = price;
    map['rate'] = rate;
    map['revNum'] = revNum;
    map['roomsNumber'] = roomsNumber;
    return map;
  }

}