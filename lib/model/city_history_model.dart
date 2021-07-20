import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_lesson_1/data/city_history_data.dart';

class CityHistoryModel extends ChangeNotifier {
  String name = '';

  var _city = <CityHistoryData>[];

  CityHistoryData? citydata;

  CityHistoryModel() {
    _setup();
  }
  List<CityHistoryData> get cityname => _city;

  Future<void> _setup() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(CityHistoryDataAdapter());
    }
    final box = await Hive.openBox<CityHistoryData>('CityData');
    _city = box.values.toList();
    notifyListeners();
    box.listenable().addListener(() {
      _city = box.values.toList();
      notifyListeners();
    });
  }

  Future<void> saveCity(BuildContext context) async {
    if (name.isEmpty) {
      return;
    }
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(CityHistoryDataAdapter());
    }
    final box = await Hive.openBox<CityHistoryData>('CityData');
    final city = CityHistoryData(name: name);
    await box.add(city);
    Navigator.pop(context, name);
  }

  Future<void> popCityfromHistory(int index, BuildContext context) async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(CityHistoryDataAdapter());
    }
    final box = await Hive.openBox<CityHistoryData>('CityData');
    final cityIndex = box.getAt(index)?.name;
    Navigator.pop(context, cityIndex);
  }

  Future<void> clearHistory() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(CityHistoryDataAdapter());
    }
    final box = await Hive.openBox<CityHistoryData>('CityData');
    final keys = box.keys;
    box.deleteAll(keys);
  }
}
