// import 'dart:convert';

import 'package:uas_prakmobile/model.dart';
// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  var client = http.Client();

  Future<List<Model>?> getProfiles() async {
    var uri = Uri.parse('http://localhost:3000/models');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return modelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Model>?> getCategory(String Category) async {
    var uri = Uri.parse('http://localhost:3000/models');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return modelFromJson(response.body);
    } else {
      return null;
    }
    // var uri = Uri.parse('http://localhost:3000/models');
    // var response = await client.get(uri);
    // var result = jsonDecode(response.body)['category'];
    // if (response.statusCode == 200) {
    //   print("Connection successful");
    //   //  if (Category == jsonDecode(response.body)['category']) {
    //   print("test");
    //   List<Model> books =
    //       (result['category'] as List).map((e) => Model.fromJson(e)).toList();
    //   return modelFromJson(response.body);
    //   //  }
    // } else {
    //   return null;
    // }
  }

  Future<List<Model>?> getBooksByCategory(String category) async {
    var uri = Uri.parse('http://localhost:3000/models');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      List<Model> allModels = modelFromJson(response.body);

      // Filter models based on the specified category
      List<Model> filteredModels =
          allModels.where((model) => model.category == category).toList();

      return filteredModels;
    } else {
      return null;
    }
  }

  // Future<bool> saveProfile(
  //     String id, String name, String email, String age) async {
  //   var uri = Uri.parse('http://localhost:3000/users/?');
  //   final response = await client.post(uri,
  //       // headers: {"content-type": "application/json"},
  //       // body: profileToJson(data),
  //       body: ({'id': id, 'name': name, 'email': email, 'age': age}));
  //   if (response.statusCode == 201) {
  //     print('berhasil simpan');
  //     return true;
  //   } else {
  //     print('Gagal simpan');
  //     return false;
  //   }
  // }

  // Future deleteProfiles(String id) async {
  //   var uri = Uri.parse('http://localhost:3000/users/' + id);
  //   final response = await client.delete(
  //     uri,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // Future updateProfiles(
  //     String id, String name, String email, String age) async {
  //   var uri = Uri.parse('http://localhost:3000/users/' + id);
  //   final response = await client.put(uri,
  //       body: ({'id': id, 'name': name, 'email': email, 'age': age}));
  //   if (response.statusCode == 200) {
  //     print('berhasil diupdate');
  //     return true;
  //   } else {
  //     print('Gagal diupdate');
  //     return false;
  //   }
  // }
}
