class BukuModel {
  String? id;
  String? image;
  String? location;
  String? name;
  int? distance;
  String? desc;
  String? category;
  String? rate;

  BukuModel(
      {this.id,
      this.image,
      this.location,
      this.name,
      this.distance,
      this.desc,
      this.category,
      this.rate});

  BukuModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    location = json['location'];
    name = json['name'];
    distance = json['distance'];
    desc = json['desc'];
    category = json['category'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['location'] = this.location;
    data['name'] = this.name;
    data['distance'] = this.distance;
    data['desc'] = this.desc;
    data['category'] = this.category;
    data['rate'] = this.rate;
    return data;
  }
}
