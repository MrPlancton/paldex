// import 'dart:math';
//
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:paldex/data/source/local/models/item.dart';
// import 'package:paldex/data/source/local/models/pal.dart';
// import 'package:paldex/data/source/local/models/pal_gender.dart';
// import 'package:paldex/data/source/local/models/pal_stats.dart';
//
// class LocalDataSource {
//   static Future<void> initialize() async {
//     await Hive.initFlutter();
//
//     Hive.registerAdapter<PalHiveModel>(PalHiveModelAdapter());
//     Hive.registerAdapter<PalGenderHiveModel>(PalGenderHiveModelAdapter());
//     Hive.registerAdapter<PalStatsHiveModel>(PalStatsHiveModelAdapter());
//     Hive.registerAdapter<ItemHiveModel>(ItemHiveModelAdapter());
//
//     await Hive.openBox<PalHiveModel>(PalHiveModel.boxKey);
//     await Hive.openBox<PalGenderHiveModel>(PalGenderHiveModel.boxKey);
//     await Hive.openBox<PalStatsHiveModel>(PalStatsHiveModel.boxKey);
//     await Hive.openBox<ItemHiveModel>(ItemHiveModel.boxKey);
//   }
//
//   Future<bool> hasData() async {
//     final palBox = Hive.box<PalHiveModel>(PalHiveModel.boxKey);
//
//     return palBox.length > 0;
//   }
//
//   Future<bool> hasItemData() async {
//     final itemBox = Hive.box<ItemHiveModel>(ItemHiveModel.boxKey);
//
//     return itemBox.length > 0;
//   }
//
//   Future<void> savePals(Iterable<PalHiveModel> pals) async {
//     final palBox = Hive.box<PalHiveModel>(PalHiveModel.boxKey);
//
//     final palsMap = {for (var e in pals) e.number: e};
//
//     await palBox.clear();
//     await palBox.putAll(palsMap);
//   }
//
//   Future<List<PalHiveModel>> getAllPals() async {
//     final palBox = Hive.box<PalHiveModel>(PalHiveModel.boxKey);
//
//     final pals = List.generate(palBox.length, (index) => palBox.getAt(index))
//         .whereType<PalHiveModel>()
//         .toList();
//
//     return pals;
//   }
//
//   Future<List<PalHiveModel>> getPals({required int page, required int limit}) async {
//     final palBox = Hive.box<PalHiveModel>(PalHiveModel.boxKey);
//     final totalPals = palBox.length;
//
//     final start = (page - 1) * limit;
//     final newPalCount = min(totalPals - start, limit);
//
//     final pals = List.generate(newPalCount, (index) => palBox.getAt(start + index))
//         .whereType<PalHiveModel>()
//         .toList();
//
//     return pals;
//   }
//
//   Future<PalHiveModel?> getPal(String number) async {
//     final palBox = Hive.box<PalHiveModel>(PalHiveModel.boxKey);
//
//     return palBox.get(number);
//   }
//
//   Future<List<PalHiveModel>> getEvolutions(PalHiveModel pal) async {
//     final palFutures = pal.evolutions.map((palNumber) => getPal(palNumber));
//
//     final pals = await Future.wait(palFutures);
//
//     return pals.whereType<PalHiveModel>().toList();
//   }
//
//   Future<void> saveItems(Iterable<ItemHiveModel> items) async {
//     final itemBox = Hive.box<ItemHiveModel>(ItemHiveModel.boxKey);
//
//     final itemsMap = {for (var e in items) e.name: e};
//     await itemBox.clear();
//     await itemBox.putAll(itemsMap);
//   }
//
//   Future<List<ItemHiveModel>> getAllItems() async {
//     final itemBox = Hive.box<ItemHiveModel>(ItemHiveModel.boxKey);
//
//     final items = List.generate(itemBox.length, (index) => itemBox.getAt(index))
//         .whereType<ItemHiveModel>()
//         .toList();
//
//     return items;
//   }
//
//   Future<List<ItemHiveModel>> getItems({required int page, required int limit}) async {
//     final itemBox = Hive.box<ItemHiveModel>(ItemHiveModel.boxKey);
//     final totalItems = itemBox.length;
//
//     final start = (page - 1) * limit;
//     final newItemCount = min(totalItems - start, limit);
//
//     final items = List.generate(newItemCount, (index) => itemBox.getAt(start + index))
//         .whereType<ItemHiveModel>()
//         .toList();
//
//     return items;
//   }
// }
