import 'dart:convert';

Complex complexFromJson(String str) => Complex.fromJson(json.decode(str));

String complexToJson(Complex data) => json.encode(data.toJson());

class Complex {
  int complexId;
  int cityId;
  int districtId;
  String complexName;
  String address;

  Complex({
    this.complexId = 0,
    this.cityId = 0,
    this.districtId = 0,
    this.complexName = '',
    this.address = '',
  });

  factory Complex.fromJson(Map<String, dynamic> json) => Complex(
        complexId: json["complex_id"],
        cityId: json["city_id"],
        districtId: json["district_id"],
        complexName: json["complex_name"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "complex_id": complexId,
        "city_id": cityId,
        "district_id": districtId,
        "complex_name": complexName,
        "address": address,
      };
}
