import 'package:dio/dio.dart';
import 'package:flutter_network/models/user.dart';
import 'package:flutter_network/repositories/abstract_offices_repository.dart';

class OfficesRepository implements AbstractOfficesRepository {
  OfficesRepository({required this.dio});
  final Dio dio;
  static const url = 'https://about.google/static/data/locations.json';
  static const error = 'Error';

  @override
  Future<OfficesList> fetchOfficesList() async {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      return OfficesList.fromJson(response.data);
    } else {
      throw Exception(error);
    }
  }
}
