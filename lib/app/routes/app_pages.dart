import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/select_ticket/bindings/select_ticket_binding.dart';
import '../modules/select_ticket/views/select_ticket_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_TICKET,
      page: () => const SelectTicketView(),
      binding: SelectTicketBinding(),
    ),
  ];
}
