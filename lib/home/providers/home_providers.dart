import 'package:tractian_challenge/model/company.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final listCompaniesProvider = FutureProvider<List<Company>>((ref) async {
  final response =
      await http.get(Uri.parse('https://fake-api.tractian.com/companies'));
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    List<Company> listCompanies = [];
    for (var mapCompany in jsonData) {
      listCompanies.add(Company.fromMap(mapCompany));
      print(mapCompany);
    }
    return listCompanies;
  } else {
    throw Exception('Failed to load companies');
  }
});
