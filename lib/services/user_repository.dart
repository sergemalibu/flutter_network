import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_network/models/user.dart';

class OfficesRepository {
  static Future<OfficesList> getOfficesList() async {
    const url = 'https://about.google/static/data/locations.json';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return OfficesList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }
}
