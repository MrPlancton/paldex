import 'dart:convert';

import 'package:paldex/core/network.dart';
import 'package:paldex/data/source/remote/models/item.dart';

class RemoteDataSource {
  RemoteDataSource(this.networkManager);

  static const String itemsURL =
      'https://gist.githubusercontent.com/hungps/48f4355fb1a89ddaf47f56961dc8a245/raw/pal-items.json';

  static const String url =
      'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pals.json';

  final NetworkManager networkManager;

  Future<List<RemotePalModel>> getPals() async {
    final response = await networkManager.request(RequestMethod.get, url);

    final data = (json.decode(response.data) as List)
        .map((item) => RemotePalModel.fromJson(item))
        .toList();

    return data;
  }

  Future<List<RemoteItemModel>> getItems() async {
    final response = await networkManager.request(RequestMethod.get, itemsURL);

    final data =
        (json.decode(response.data) as List).map((item) => RemoteItemModel.fromJson(item)).toList();

    return data;
  }
}