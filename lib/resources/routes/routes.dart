import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/resources/routes/routes_name.dart';
import 'package:getx_mvvm_pattern/view/home/user_list_screen.dart';

import '../../view/login/login_screen.dart';
import '../../view/splash_screen/splashscreen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => const SplashScreen(),
            transitionDuration: const Duration(seconds: 1),
            transition: Transition.zoom),
        GetPage(
          name: RoutesName.loginScreen,
          page: () => const LoginScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transition: Transition.zoom,
        ),
        GetPage(
          name: RoutesName.homescreen,
          page: () => const UserListScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transition: Transition.zoom,
        ),
      ];
}
