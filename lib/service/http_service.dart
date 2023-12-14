// import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'dart:convert';
// import 'package:uas_prakmobile/place_model.dart';

// class HttpService {
//   // final String apiKey = '9da44c390e219ffdc840f1bc8c1cd1b8';
//   final String baseUrl = 'localhost:3000';

//   Future<List> getPopularMovies() async {
//     final String uri = baseUrl;

//     http.Response result = await http.get(Uri.parse(uri));
//     if (result.statusCode == HttpStatus.ok) {
//       print("Sukses");
//       final jsonResponse = json.decode(result.body);
//       final moviesMap = jsonResponse['results'];
//       List movies = moviesMap.map((i) => PlaceInfo.fromJson(i)).toList();
//       return movies;
//     } else {
//       print("Fail");
//       throw Exception("Fail");
//     }
//   }
// }
