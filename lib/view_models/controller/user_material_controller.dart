import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/data/response/status.dart';
import 'package:getx_mvvm_pattern/models/user_material.dart';
import 'package:getx_mvvm_pattern/repository/user_material_repository.dart';
import 'package:getx_mvvm_pattern/utils/utils.dart';

class UserMaterialScreenController extends GetxController {
  final _api = UserMaterialRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final usermateriallist = UserMaterialModel().obs;

  void setRxRequestStatus(Status statusvalue) =>
      rxRequestStatus.value = statusvalue;

  void setusermateriallist(UserMaterialModel usermaterialvalue) =>
      usermateriallist.value = usermaterialvalue;

  void usermatrialApi() {
    _api.userMaterialApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setusermateriallist(value);
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
      Utils.toastMessage(error.toString());
    });
  }
}
