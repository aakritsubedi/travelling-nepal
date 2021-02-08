class Weather {
  double lat;
  double lon;
  String city;
  Map info;
  int temp;

  Weather({
    this.lat,
    this.lon,
    this.city,
    this.info,
    this.temp
  });

  Weather.fromJson(Map json) {
    this.lat = json['lat'];
    this.lon = json['lon'];
    this.city = json['city_name'];
    this.info = json['weather'];
    this.temp = json['temp'];
  }
}
