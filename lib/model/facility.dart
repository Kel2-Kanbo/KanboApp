import 'dart:convert';

Facilities facilitiesFromJson(String str) => Facilities.fromJson(json.decode(str));

String facilitiesToJson(Facilities data) => json.encode(data.toJson());

class Facilities {
    Facilities({
        this.facilityId = 0,
        this.complexId = 0,
        this.facilityName = '',
        this.description = '',
        this.url = '',
    });

    int facilityId;
    int complexId;
    String facilityName;
    String description;
    String url;

    factory Facilities.fromJson(Map<String, dynamic> json) => Facilities(
        facilityId: json["facility_id"],
        complexId: json["complex_id"],
        facilityName: json["facility_name"],
        description: json["description"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "facility_id": facilityId,
        "complex_id": complexId,
        "facility_name": facilityName,
        "description": description,
        "url": url,
    };
}
