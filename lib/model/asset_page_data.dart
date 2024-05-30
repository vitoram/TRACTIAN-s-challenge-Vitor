import 'package:tractian_challenge/model/asset.dart';
import 'package:tractian_challenge/model/location.dart';

class AssetPageData {
  List<Asset> listAsset = [];
  List<Location> listLocation = [];
  AssetPageData({
    required this.listAsset,
    required this.listLocation,
  });

  AssetPageData copyWith({
    List<Asset>? listAseet,
    List<Location>? listLocation,
  }) {
    return AssetPageData(
      listAsset: listAseet ?? listAsset,
      listLocation: listLocation ?? this.listLocation,
    );
  }
}
