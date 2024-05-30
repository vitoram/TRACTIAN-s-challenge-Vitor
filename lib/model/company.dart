// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Company {
  String id;
  String name;
  Company({
    required this.id,
    required this.name,
  });

  Company copyWith({
    String? id,
    String? name,
  }) {
    return Company(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Company(id: $id, name: $name)';

  @override
  bool operator ==(covariant Company other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
