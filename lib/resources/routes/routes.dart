import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/resources/routes/routes_name.dart';
import 'package:getx_mvvm_pattern/user_interface/splash_screen/splashscreen.dart';

import '../../user_interface/login/login_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => const SplashScreen(),
            // transitionDuration: const Duration(seconds: 1),
            transition: Transition.leftToRightWithFade),
        GetPage(
          name: RoutesName.loginScreen,
          page: () => const LoginScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transition: Transition.zoom,
        ),
      ];
}
