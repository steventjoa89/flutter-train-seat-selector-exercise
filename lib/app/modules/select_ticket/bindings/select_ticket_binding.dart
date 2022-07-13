import 'package:get/get.dart';

import '../controllers/select_ticket_controller.dart';

class SelectTicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectTicketController>(
      () => SelectTicketController(),
    );
  }
}
