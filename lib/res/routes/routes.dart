import 'package:get/get.dart';
import 'package:nepalibussiness/UI/AddingInfo.dart';
import 'package:nepalibussiness/UI/dashboard.dart';
import 'package:nepalibussiness/UI/registration.dart';

import 'route_names.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteNames.loginScreen,
            page: () => const Registration(),
            transitionDuration: const Duration(milliseconds: 350),
            transition: Transition.circularReveal),
        GetPage(
            name: RouteNames.dashboard,
            page: () => const Dashboard(),
            transitionDuration: const Duration(milliseconds: 350),
            transition: Transition.circularReveal),
        GetPage(
            name: RouteNames.addingDetail,
            page: () => const Addinginfo(),
            transitionDuration: const Duration(milliseconds: 350),
            transition: Transition.circularReveal),
      ];
}
