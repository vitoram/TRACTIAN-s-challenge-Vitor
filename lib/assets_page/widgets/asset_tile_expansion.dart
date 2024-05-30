import 'package:flutter/material.dart';

class AssetExpansionListTile extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final String imageAsset;
  final bool exapanded;
  const AssetExpansionListTile(
      {super.key,
      required this.title,
      required this.children,
      required this.imageAsset,
      required this.exapanded});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.only(left: 32),
        controlAffinity: ListTileControlAffinity.leading,
        title: Row(
          children: [
            Image.asset(imageAsset),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
        children: children,
      ),
    );
  }
}
