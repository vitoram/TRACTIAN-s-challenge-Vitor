import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tractian_challenge/assets_page/providers/asset_provider.dart';
import 'package:tractian_challenge/home/providers/home_providers.dart';
import 'package:tractian_challenge/model/company.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var listCompanies = ref.watch(listCompaniesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset("assets/image/logo.png")),
      ),
      body: listCompanies.when(
        data: (List<Company> listCompany) {
          if (listCompany.isEmpty) {
            return const Center(
              child: Text("No Companies"),
            );
          }
          return ListView.builder(
            itemCount: listCompany.length,
            itemBuilder: (context, index) {
              Company company = listCompany[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  color: const Color(0xFF2188FF),
                  child: InkWell(
                    onTap: () {
                      ref.read(companyProvider.notifier).state = company;
                      Navigator.of(context).pushNamed("/assetPage");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ListTile(
                        textColor: Colors.white,
                        leading: Image.asset("assets/icon/icon.png"),
                        title: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            "${company.name} Unit",
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        error: (Object error, StackTrace stackTrace) => Text('$error'),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
