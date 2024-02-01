import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:paldex/core/network.dart';
import 'package:paldex/data/source/github/models/item.dart';
import 'package:paldex/data/source/github/models/pal.dart';

class GithubDataSource {
  GithubDataSource(this.networkManager);

  static const String itemsURL = 'https://gist.githubusercontent.com/hungps/48f4355fb1a89ddaf47f56961dc8a245/raw/pal-items.json';

  static const String url = 'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pals.json';

  static const String pals = 'assets/pals.json';

  final NetworkManager networkManager;

  Future<List<GithubPalModel>> getPals() async {
    //final response = await networkManager.request(RequestMethod.get, url);

    final response = await rootBundle.loadString(pals);
    try {
      final data = (json.decode(response) as List).map((item) => GithubPalModel.fromJson(item)).toList();

      return data;
    } catch (e) {
      print("GithubPalModel");
      print(e);
      return [];
    }
  }

  Future<List<GithubItemModel>> getItems() async {
    final response = await networkManager.request(RequestMethod.get, itemsURL);

    final data = (json.decode(response.data) as List).map((item) => GithubItemModel.fromJson(item)).toList();

    return data;
  }
}
