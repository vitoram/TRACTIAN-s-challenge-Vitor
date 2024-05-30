import 'package:flutter/material.dart';

class AssetListTile extends StatelessWidget {
  final String title;
  final String imageAsset;
  final bool eletric;
  final bool alert;
  const AssetListTile(
      {super.key,
      required this.title,
      required this.imageAsset,
      required this.eletric,
      required this.alert});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Image.asset(imageAsset),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Visibility(
            visible: eletric,
            child: const Padding(
              padding: EdgeInsets.only(left: 4.0, right: 4.0),
              child: Icon(
                Icons.bolt,
                color: Colors.green,
              ),
            ),
          ),
          Visibility(
            visible: alert,
            child: const Padding(
              padding: EdgeInsets.only(left: 4.0, right: 4.0),
              child: Icon(
                Icons.fiber_manual_record,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
