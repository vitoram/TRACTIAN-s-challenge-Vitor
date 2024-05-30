import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tractian_challenge/model/asset.dart';
import 'package:tractian_challenge/model/asset_page_data.dart';
import 'package:tractian_challenge/model/company.dart';
import 'package:http/http.dart' as http;
import 'package:tractian_challenge/model/location.dart';

final companyProvider = StateProvider<Company?>((ref) => null);
final textFilterProvider = StateProvider.autoDispose<String>((ref) => "");
final buttonFilterProvider = StateProvider.autoDispose<int>((ref) => -1);

final assetPageDataProvider = FutureProvider<AssetPageData>((ref) async {
  String id = ref.watch(companyProvider)?.id ?? "";
  final responseLocation = await http
      .get(Uri.parse('https://fake-api.tractian.com/companies/$id/locations'));
  if (responseLocation.statusCode == 200) {
    var jsonDataLocation = jsonDecode(responseLocation.body);
    List<Location> listLocation = [];
    Map<String, List<Location>> mapLocationFilho = {};
    Map<String, Location> mapLocationTotal = {};
    for (var mapLocation in jsonDataLocation) {
      Location location = Location.fromMap(mapLocation);
      mapLocationTotal[location.id] = location;
      if (location.parentId == null) {
        listLocation.add(location);
      } else {
        if (mapLocationFilho.containsKey(location.parentId)) {
          mapLocationFilho[location.parentId!]!.add(location);
        } else {
          mapLocationFilho[location.parentId!] = [location];
        }
      }
    }
    for (String key in mapLocationFilho.keys) {
      mapLocationTotal[key]!.listLocation.addAll(mapLocationFilho[key]!);
    }
    listLocation;
    final responseAssets = await http
        .get(Uri.parse('https://fake-api.tractian.com/companies/$id/assets'));
    if (responseAssets.statusCode == 200) {
      var jsonDataAssets = jsonDecode(responseAssets.body);
      List<Asset> listAsset = [];
      Map<String, List<Asset>> mapAssetFilho = {};
      Map<String, Asset> mapAssetTotal = {};
      for (var mapAsset in jsonDataAssets) {
        Asset asset = Asset.fromMap(mapAsset);
        mapAssetTotal[asset.id] = asset;
        if (asset.parentId == null && asset.locationId == null) {
          listAsset.add(asset);
        } else {
          if (asset.parentId != null) {
            if (mapAssetFilho.containsKey(asset.parentId)) {
              mapAssetFilho[asset.parentId]!.add(asset);
            } else {
              mapAssetFilho[asset.parentId!] = [asset];
            }
          } else {
            if (mapLocationTotal.containsKey(asset.locationId)) {
              mapLocationTotal[asset.locationId!]!.listAsset.add(asset);
            } else {
              print("Location não existente");
            }
          }
        }
      }
      for (String key in mapAssetFilho.keys) {
        mapAssetTotal[key]!.listAsset.addAll(mapAssetFilho[key]!);
      }
      listLocation;

      return AssetPageData(listAsset: listAsset, listLocation: listLocation);
    } else {
      throw Exception('Failed to load assets');
    }
  } else {
    throw Exception('Failed to load locations');
  }
});
