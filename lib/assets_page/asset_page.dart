import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tractian_challenge/assets_page/providers/asset_provider.dart';
import 'package:tractian_challenge/assets_page/widgets/asset_button_filter.dart';
import 'package:tractian_challenge/assets_page/widgets/asset_filter_text.dart';
import 'package:tractian_challenge/assets_page/widgets/asset_list.dart';
import 'package:tractian_challenge/model/asset.dart';
import 'package:tractian_challenge/model/asset_page_data.dart';
import 'package:tractian_challenge/model/company.dart';
import 'package:tractian_challenge/model/location.dart';

class AssetPage extends ConsumerWidget {
  const AssetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Company? company = ref.watch(companyProvider);
    if (company == null) {
      return const Scaffold(
        body: Center(
          child: Text("Erro"),
        ),
      );
    }
    var assetPageData = ref.watch(assetPageDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Assets")),
      ),
      body: assetPageData.when(
          data: (AssetPageData data) {
            List<Location> listLocation = data.listLocation;
            List<Asset> listAsset = data.listAsset;
            if (listAsset.isEmpty && listLocation.isEmpty) {
              return const Center(
                child: Text("Company is Empty"),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AssetFilterText(),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 10,
                    children: [
                      AssetButtonFilter(index: 0),
                      AssetButtonFilter(index: 1),
                    ],
                  ),
                ),
                Expanded(
                  child: AssetList(
                    listLocation: listLocation,
                    listAsset: listAsset,
                  ),
                )
              ],
            );
          },
          error: (Object error, StackTrace stackTrace) => Text('$error'),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
