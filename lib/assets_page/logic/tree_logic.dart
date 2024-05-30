import 'package:flutter/material.dart';
import 'package:tractian_challenge/assets_page/widgets/asset_tile.dart';
import 'package:tractian_challenge/assets_page/widgets/asset_tile_expansion.dart';
import 'package:tractian_challenge/model/asset.dart';
import 'package:tractian_challenge/model/location.dart';

Widget? locationChildrens(
  Location location,
  int filterButton,
  String filterText,
) {
  if (location.listAsset.isEmpty && location.listLocation.isEmpty) {
    //Nenhuma location vazia fica quando tem filtro dos botões ativos
    if (filterButton != -1) {
      return null;
    }
    //Se não tiver o nome é ser nulo;
    if (filterText != "" && !location.name.contains(filterText)) {
      return null;
    }
    //Como é um sem filhos, não é um tile expansível
    return AssetListTile(
      title: location.name,
      imageAsset: "assets/icon/location.png",
      eletric: false,
      alert: false,
    );
  } else {
    List<Widget> children = [];
    //Se já tiver o nome do filtro não é para filtrar os filhos
    //Pelo menos foi assim que entendi ser melhor
    //Se for para não mostrar os filhos que não tiverem os nomes é só:
    //    remover a linha de baixo
    //    descomentar as partes de baixo
    String newFilterText = location.name.contains(filterText) ? "" : filterText;

    for (Location subLocation in location.listLocation) {
      Widget? subLocationWidget =
          locationChildrens(subLocation, filterButton, newFilterText);
      if (subLocationWidget != null) children.add(subLocationWidget);
    }
    for (Asset asset in location.listAsset) {
      Widget? assetionWidget =
          assetChildrens(asset, filterButton, newFilterText);
      if (assetionWidget != null) children.add(assetionWidget);
    }
    if (children.isEmpty) {
      // if (filterText == "") {
      return null;
    }
    // if (!location.name.contains(filterText)) {
    //   return null;
    // }
    //   AssetListTile(
    //     title: location.name,
    //     imageAsset: "assets/icon/location.png",
    //     eletric: false,
    //     alert: false,
    //   );
    // }
    return AssetExpansionListTile(
      exapanded: filterButton != -1 || filterText != "",
      title: location.name,
      imageAsset: "assets/icon/location.png",
      children: children,
    );
  }
}

Widget? assetChildrens(Asset asset, int filterButton, String filterText) {
  if (asset.listAsset.isEmpty) {
    //Retorna nulo se não tiver nome que estão procurando
    if (filterText != "" && !asset.name.contains(filterText)) {
      return null;
    }
    //Vai mostrar se tem o ícone de alerta e de energia
    //Se tiver mais ícone para mostrar é só colocar aqui
    bool eletric = false;
    bool alert = false;
    if (asset.status == "alert") {
      alert = true;
    }

    if (asset.sensorType == "energy") {
      eletric = true;
    }
    //Se não tiver filtrando por botão é para retornar a tile
    if (filterButton == -1) {
      AssetListTile(
        title: asset.name,
        imageAsset: asset.sensorType == null
            ? "assets/icon/asset.png"
            : "assets/icon/component.png",
        eletric: eletric,
        alert: alert,
      );
    }
    //Depois daqui estão filtrando por botão, então se não for componente (SensorType nulo) é para retornar nulo
    if (asset.sensorType == null) {
      return null;
    }
    if (filterButton == 0 && asset.sensorType != "energy") {
      return null;
    }
    if (filterButton == 1 && asset.status != "alert") {
      return null;
    }
    return AssetListTile(
      title: asset.name,
      imageAsset: asset.sensorType == null
          ? "assets/icon/asset.png"
          : "assets/icon/component.png",
      eletric: eletric,
      alert: alert,
    );
  } else {
    List<Widget> children = [];
    //Se já tiver o nome do filtro não é para filtrar os filhos
    //Pelo menos foi assim que entendi ser melhor
    //Se for para não mostrar os filhos que não tiverem os nomes é só:
    //    comentar a linha de baixo
    //    descomentar as partes de baixo
    String newFilterText = asset.name.contains(filterText) ? "" : filterText;
    for (Asset subAsset in asset.listAsset) {
      Widget? subLocationWidget =
          assetChildrens(subAsset, filterButton, newFilterText);
      if (subLocationWidget != null) children.add(subLocationWidget);
    }
    if (children.isEmpty) {
      // if (filterText == "") {
      //   return null;
      // }
      // if (!asset.name.contains(filterText)) {
      return null;
      // }
      // AssetListTile(
      //   title: asset.name,
      //   imageAsset: "assets/icon/location.png",
      //   eletric: false,
      //   alert: false,
      // );
    }
    return AssetExpansionListTile(
      exapanded: filterButton != -1 || filterText != "",
      title: asset.name,
      imageAsset: asset.sensorType == null
          ? "assets/icon/asset.png"
          : "assets/icon/component.png",
      children: children,
    );
  }
}
