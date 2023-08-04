import 'package:getx_mvvm_pattern/data/network/netwrok_api_services.dart';
import 'package:getx_mvvm_pattern/models/user_list/user_list.dart';

class UserList {
  final _apiservice = NetworkApiServices();

  Future<UserListModel> userListApi() async {
    dynamic response =
        await _apiservice.getApi('https://reqres.in/api/users?page=2');
    return UserListModel.fromJson(response);
  }
}
