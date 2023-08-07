import 'package:getx_mvvm_pattern/data/network/netwrok_api_services.dart';
import 'package:getx_mvvm_pattern/resources/api_urls/app_api_url.dart';

class LoginRepository {
  final _apiservice = NetworkApiServices();

  Future<dynamic> LoginApi(var data) async {
    dynamic responce =
        await _apiservice.postApi(data, ApiUrl.baseurl + ApiUrl.login);
    // _apiservice.postApi(data, "https://dummyjson.com/auth/login");
    return responce;
  }
}
