import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tractian_challenge/assets_page/asset_page.dart';
import 'package:tractian_challenge/home/home_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TRACTIAN',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: AppBarTheme(
            backgroundColor: const Color(0xFF17192D),
            titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                ),
            iconTheme: const IconThemeData(color: Colors.white)),
        useMaterial3: true,
      ),
      initialRoute: "/homePage",
      routes: {
        "/homePage": (context) => const HomePage(),
        "/assetPage": (context) => const AssetPage(),
      },
    );
  }
}
