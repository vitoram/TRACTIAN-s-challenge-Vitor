import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tractian_challenge/assets_page/providers/asset_provider.dart';

class AssetFilterText extends ConsumerWidget {
  const AssetFilterText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        filled: true,
        fillColor: Colors.grey.shade200,
        prefixIcon: const Icon(Icons.search),
        hintText: 'Buscar Ativo ou Local',
      ),
      onChanged: (value) => ref.read(textFilterProvider.notifier).state = value,
    );
  }
}
