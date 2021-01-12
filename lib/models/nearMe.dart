class NearMe {
  String districtName;
  String districtCode;
  String title;
  String lat;
  String lon;
  String desc;
  String description;
  String placeName;
  String contactInfo;
  String category;
  String type;
  String googleMapLink;
  double distanceBetween;

  NearMe(
      {this.districtName,
      this.districtCode,
      this.title,
      this.lat,
      this.lon,
      this.desc,
      this.description,
      this.placeName,
      this.contactInfo,
      this.category,
      this.type,
      this.googleMapLink,
      this.distanceBetween,
      });

  NearMe.fromJson(Map json) {
    this.districtName = json['districtName'];
    this.districtCode = json['districtCode'];
    this.title = json['title'];
    this.lat = json['lat'] ?? 0;
    this.lon = json['lon'] ?? 0;
    this.desc = json['desc'];
    this.description = json['description'];
    this.placeName = json['place_name'];
    this.contactInfo = json['contactInfo'];
    this.category = json['category'];
    this.type = json['type'];
    this.googleMapLink = json['googleMapLink'];
    this.distanceBetween = 0;
  }
}
