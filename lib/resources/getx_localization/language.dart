import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          //Splash Screen
          'welcome.title': "Welcome Guy's",

          //Login Screen
          'loginform.title': 'login form',
          'login.btntitle': 'Login',
          'email.hinttext': 'Enter Your Email Id',
          'email.example': 'Example@gmail.com',
          'password.hinttext': 'Enter Your Password',
          'password.example': '* * * * * *'
        },
      };
}
