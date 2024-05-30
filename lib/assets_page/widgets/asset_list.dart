import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tractian_challenge/assets_page/logic/tree_logic.dart';
import 'package:tractian_challenge/assets_page/providers/asset_provider.dart';
import 'package:tractian_challenge/model/asset.dart';
import 'package:tractian_challenge/model/location.dart';

class AssetList extends ConsumerWidget {
  final List<Location> listLocation;
  final List<Asset> listAsset;
  const AssetList(
      {required this.listLocation, required this.listAsset, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int filterButton = ref.watch(buttonFilterProvider);
    String filterText = ref.watch(textFilterProvider);
    List<Widget> children = [];
    for (Location location in listLocation) {
      Widget? locationItem =
          locationChildrens(location, filterButton, filterText);
      if (locationItem != null) children.add(locationItem);
    }
    for (Asset asset in listAsset) {
      Widget? assetItem = assetChildrens(asset, filterButton, filterText);
      if (assetItem != null) children.add(assetItem);
    }
    if (children.isEmpty) {
      return const Center(
        child: Text("Nenhum Ativo com Essa Característica"),
      );
    }
    return ListView(
      children: children,
    );
  }
}
