class Plant {
  final String name;
  final String type;

  Plant({required this.name, required this.type});

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(name: json['name'], type: json['type']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'type': type};
  }
}
