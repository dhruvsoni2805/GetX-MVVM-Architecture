import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/models/user_list/user_list.dart';
import 'package:getx_mvvm_pattern/repository/userlist_repository.dart';

import '../../data/response/status.dart';

class HomeScreenController extends GetxController {
  final _api = UserList();

  final rxRequestStatus = Status.LOADING.obs;
  final userlist = UserListModel().obs;

  void rxSetRequestStatus(Status _value) => rxRequestStatus.value = _value;

  void setUserList(UserListModel _value) => userlist.value = _value;

  void userListApi() {
    print("object");
    _api.userListApi().then((value) {
      rxSetRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      rxSetRequestStatus(Status.ERROR);
    });
  }
}
