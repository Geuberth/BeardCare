class Barber {
  final int id;
  final String name;
  String description;
  final int qualification;

  Barber({
    required this.id,
    required this.name,
    this.description = '',
    required this.qualification,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'qualification': qualification,
    };
  }

  Barber.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        description = res["description"],
        qualification = res["qualification"];

  @override
  String toString() {
    return 'Barber{id: $id, name: $name, description: $description, qualification: $qualification}';
  }
}
