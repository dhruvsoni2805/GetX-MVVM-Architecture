import 'package:getx_mvvm_pattern/data/network/netwrok_api_services.dart';
import 'package:getx_mvvm_pattern/models/user_list_model.dart';

import '../resources/api_urls/app_api_url.dart';

class HomeRepository {
  final _api = NetworkApiServices();

  Future<UserListModel> userListApi() async {
    dynamic response = await _api.getApi(ApiUrl.baseurl + ApiUrl.userlist);
    return UserListModel.fromJson(response);
  }
}
