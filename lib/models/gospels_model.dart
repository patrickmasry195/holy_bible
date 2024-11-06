import 'package:hive/hive.dart';

part 'gospels_model.g.dart';

@HiveType(typeId: 0)
class GospelsModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  GospelsModel({required this.id, required this.name});

  factory GospelsModel.fromJson(Map<String, dynamic> json) {
    return GospelsModel(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  String toString() => name;
}
