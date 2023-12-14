class PlaceInfo {
  late String location, image, name, desc, category, rate;
  // late String id;
  late int distance;
  // final int days;

  PlaceInfo({
    // required this.id,
    required this.desc,
    required this.name,
    required this.image,
    required this.location,
    required this.distance,
    required this.category,
    required this.rate,
    // required this.days,
  });

  // PlaceInfo.fromJson(Map<String, dynamic> parsedJson) {
  //   this.id = parsedJson["id"];
  //   this.image = parsedJson["image"];
  //   this.location = parsedJson["location"];
  //   this.name = parsedJson["name"];
  //   this.distance = parsedJson["distance"];
  //   this.desc = parsedJson["desc"];
  //   this.category = parsedJson["category"];
  //   this.rate = parsedJson["rate"];
  // }
}

List places = [
  PlaceInfo(
    image: 'assets/images/laskar-pelangi.png',
    location: 'Rp 50.000',
    name: 'Laskar Pelangi',
    distance: 50,
    // days: 12,
    desc: "Buku Fiksi Laskar Pelangi",
    category: 'Fiksi',
    rate: '4.4',
  ),
  PlaceInfo(
    image: 'assets/images/politik.jpg',
    location: 'Rp 60.000',
    name: 'Politik Indentitas',
    distance: 47,
    // days: 22,
    desc: "Buku Politik",
    category: 'Politik',
    rate: '4.5',
  ),
  PlaceInfo(
    image: 'assets/images/sains.jpg',
    location: 'Rp 40.000',
    name: 'Sains Modern',
    distance: 20,
    // days: 12,
    desc: "Buku Sains Modern",
    category: 'Sains',
    rate: '4.1',
  ),
  PlaceInfo(
    image: 'assets/images/buya-hamka.jpeg',
    location: 'Rp 70.000',
    name: 'Buya Hamka',
    distance: 20,
    // days: 12,
    desc: "Novel Buya Hamka",
    category: 'Novel',
    rate: '4.8',
  ),
];
