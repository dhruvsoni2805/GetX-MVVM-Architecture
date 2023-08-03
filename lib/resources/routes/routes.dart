import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/resources/routes/routes_name.dart';
import 'package:getx_mvvm_pattern/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => const SplashScreen(),
            // transitionDuration: const Duration(seconds: 1),
            transition: Transition.leftToRightWithFade),
      ];
}
