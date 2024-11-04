class GospelsModel {
  final String id;
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
