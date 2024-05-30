// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:tractian_challenge/model/asset.dart';

class Location {
  String id;
  String name;
  String? parentId;
  List<Location> listLocation;
  List<Asset> listAsset;
  Location({
    required this.id,
    required this.name,
    this.parentId,
    required this.listLocation,
    required this.listAsset,
  });

  Location copyWith({
    String? id,
    String? name,
    String? parentId,
    List<Location>? listLocation,
    List<Asset>? listAsset,
  }) {
    return Location(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      listLocation: listLocation ?? this.listLocation,
      listAsset: listAsset ?? this.listAsset,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'parentId': parentId,
      'listLocation': listLocation.map((x) => x.toMap()).toList(),
      'listAsset': listAsset.map((x) => x.toMap()).toList(),
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      id: map['id'] as String,
      name: map['name'] as String,
      parentId: map['parentId'] != null ? map['parentId'] as String : null,
      listLocation: [],
      listAsset: [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Location(id: $id, name: $name, parentId: $parentId, listLocation: $listLocation, listAsset: $listAsset)';
  }

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.parentId == parentId &&
        listEquals(other.listLocation, listLocation) &&
        listEquals(other.listAsset, listAsset);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        parentId.hashCode ^
        listLocation.hashCode ^
        listAsset.hashCode;
  }
}
