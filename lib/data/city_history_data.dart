import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CityHistoryData extends HiveObject {
  String name;

  CityHistoryData({
    required this.name,
  });
}

class CityHistoryDataAdapter extends TypeAdapter<CityHistoryData> {
  @override
  int get typeId => 0;

  @override
  CityHistoryData read(BinaryReader reader) {
    return CityHistoryData(name: reader.readString());
  }

  @override
  void write(BinaryWriter writer, CityHistoryData obj) {
    writer.writeString(obj.name);
  }
}
