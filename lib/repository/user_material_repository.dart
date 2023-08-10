import 'package:getx_mvvm_pattern/data/network/netwrok_api_services.dart';

import '../models/user_material.dart';

class UserMaterialRepository {
  final _api = NetworkApiServices();

  Future<UserMaterialModel> userMaterialApi() async {
    dynamic response = await _api.getApi("https://reqres.in/api/unknown");
    return UserMaterialModel.fromJson(response);
  }
}
