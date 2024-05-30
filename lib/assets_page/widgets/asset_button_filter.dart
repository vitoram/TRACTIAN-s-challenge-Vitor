import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tractian_challenge/assets_page/providers/asset_provider.dart';

class AssetButtonFilter extends ConsumerWidget {
  final int index;
  const AssetButtonFilter({required this.index, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(buttonFilterProvider);
    return TextButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: selectedIndex != index ? Colors.white : Colors.blue,
        iconColor: selectedIndex != index ? Colors.grey.shade400 : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          side: BorderSide(
            color: Colors.grey.shade400,
            width: selectedIndex != index ? 2 : 0,
          ),
        ),
      ),
      onPressed: () {
        ref.read(buttonFilterProvider.notifier).state =
            index == selectedIndex ? -1 : index;
      },
      label: Text(
        index == 0 ? "Sensor de Energia" : "Crítico",
        style: TextStyle(
            color: selectedIndex != index ? Colors.grey : Colors.white,
            fontWeight: FontWeight.bold),
      ),
      icon: Icon(index == 0 ? Icons.bolt : Icons.error_outline),
    );
  }
}
