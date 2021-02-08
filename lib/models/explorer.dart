class Explorer {
  String imageUrl;
  String name;
  String description;
  String address;
  double lat;
  double lon;
  String category;
  String info;

  Explorer(
      {this.imageUrl,
      this.name,
      this.description,
      this.address,
      this.lat,
      this.lon,
      this.category,
      this.info});

  Explorer.fromJson(Map json) {
    this.imageUrl = json['image_url'] ?? 'https://images.unsplash.com/photo-1544735889-85af3b181b7d';
    this.name = json['name'];
    this.description = json['description'];
    this.address = json['address'];
    this.lat = double.parse(json['lat']) ?? 0;
    this.lon = double.parse(json['lon']) ?? 0;
    this.category = json['category'];
    this.info = json['info'];
  }
}
