import 'package:flutter_network/models/user.dart';

abstract class AbstractOfficesRepository {
  Future<OfficesList> fetchOfficesList();
}
