// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Asset {
  String id;
  String name;
  String? parentId;
  String? sensorId;
  String? sensorType;
  String? status;
  String? gatewayId;
  String? locationId;
  List<Asset> listAsset;
  Asset({
    required this.id,
    required this.name,
    this.parentId,
    this.sensorId,
    this.sensorType,
    this.status,
    this.gatewayId,
    this.locationId,
    required this.listAsset,
  });

  Asset copyWith({
    String? id,
    String? name,
    String? parentId,
    String? sensorId,
    String? sensorType,
    String? status,
    String? gatewayId,
    String? locationId,
    List<Asset>? listAsset,
  }) {
    return Asset(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      sensorId: sensorId ?? this.sensorId,
      sensorType: sensorType ?? this.sensorType,
      status: status ?? this.status,
      gatewayId: gatewayId ?? this.gatewayId,
      locationId: locationId ?? this.locationId,
      listAsset: listAsset ?? this.listAsset,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'parentId': parentId,
      'sensorId': sensorId,
      'sensorType': sensorType,
      'status': status,
      'gatewayId': gatewayId,
      'locationId': locationId,
      'listAsset': listAsset.map((x) => x.toMap()).toList(),
    };
  }

  factory Asset.fromMap(Map<String, dynamic> map) {
    return Asset(
      id: map['id'] as String,
      name: map['name'] as String,
      parentId: map['parentId'] != null ? map['parentId'] as String : null,
      sensorId: map['sensorId'] != null ? map['sensorId'] as String : null,
      sensorType:
          map['sensorType'] != null ? map['sensorType'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      gatewayId: map['gatewayId'] != null ? map['gatewayId'] as String : null,
      locationId:
          map['locationId'] != null ? map['locationId'] as String : null,
      listAsset: [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Asset.fromJson(String source) =>
      Asset.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Asset(id: $id, name: $name, parentId: $parentId, sensorId: $sensorId, sensorType: $sensorType, status: $status, gatewayId: $gatewayId, locationId: $locationId, listAsset: $listAsset)';
  }

  @override
  bool operator ==(covariant Asset other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.parentId == parentId &&
        other.sensorId == sensorId &&
        other.sensorType == sensorType &&
        other.status == status &&
        other.gatewayId == gatewayId &&
        other.locationId == locationId &&
        listEquals(other.listAsset, listAsset);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        parentId.hashCode ^
        sensorId.hashCode ^
        sensorType.hashCode ^
        status.hashCode ^
        gatewayId.hashCode ^
        locationId.hashCode ^
        listAsset.hashCode;
  }
}
