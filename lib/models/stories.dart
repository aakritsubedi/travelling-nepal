class Stories {
  int id;
  String caption;
  String uploadedBy;
  String location;
  String coordinate;
  String imageBase64;
  String imagePath;
  String type;
  String status;
  DateTime createdDate;
  DateTime updatedDate;

  Stories({
    this.id,
    this.caption,
    this.uploadedBy,
    this.location,
    this.coordinate,
    this.imageBase64,
    this.imagePath,
    this.type,
    this.status,
    this.createdDate,
    this.updatedDate,
  });

  Stories.fromJson(Map json) {
    this.id = json['id'];
    this.caption = json['caption'];   
    this.uploadedBy = json['uploaded_by'];
    this.location = json['location'];
    this.coordinate = json['coordinate'];
    this.imageBase64 = json['image_base64'];
    this.imagePath = json['image_path'];
    this.type = json['type'];
    this.status = json['status'];
    this.createdDate = json['created_date'];
    this.updatedDate = json['updated_date'];
  }
}
