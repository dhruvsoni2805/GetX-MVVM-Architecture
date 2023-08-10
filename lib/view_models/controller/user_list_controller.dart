import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/models/user_list_model.dart';
import 'package:getx_mvvm_pattern/repository/home_repository.dart';
import 'package:getx_mvvm_pattern/utils/utils.dart';

import '../../data/response/status.dart';

class UserListController extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userlist = UserListModel().obs;

  RxBool iconActive = true.obs;

  void setRxRequestStatus(Status statusvalue) =>
      rxRequestStatus.value = statusvalue;

  void setuserList(UserListModel uservalue) => userlist.value = uservalue;

  void userListApi() {
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setuserList(value);
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
      Utils.toastMessage(error.toString());
    });
  }

  void changeIconAnimation() {
    iconActive.value = !iconActive.value;
  }
}
