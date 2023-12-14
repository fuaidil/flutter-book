import 'dart:convert';

class Model {
  // dynamic id;
  // String name;
  // String email;
  // dynamic age;
  String location, image, name, desc, category, rate;
  String id;
  int distance;

  Model({
    required this.id,
    required this.desc,
    required this.name,
    required this.image,
    required this.location,
    required this.distance,
    required this.category,
    required this.rate,
  });

  factory Model.fromJson(Map<String, dynamic> map) {
    return Model(
      id: map["id"],
      image: map["image"],
      location: map["location"],
      name: map["name"],
      distance: map["distance"],
      desc: map["desc"],
      category: map["category"],
      rate: map["rate"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "image": image,
      "location": location,
      "name": name,
      "distance": distance,
      "desc": desc,
      "category": category,
      "rate": rate,
    };
  }

  @override
  String toString() {
    return 'Model{id: $id, image: $image, location: $location , name: $name, distance: $distance, desc: $desc, category: $category, rate: $rate}';
  }
}

List<Model> modelFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Model>.from(data.map((item) => Model.fromJson(item)));
}

String modelToJson(Model data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
