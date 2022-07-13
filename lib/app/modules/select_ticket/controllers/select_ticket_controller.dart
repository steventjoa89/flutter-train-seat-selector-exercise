import 'package:get/get.dart';

class SelectTicketController extends GetxController {
  var indexCarriage = 0.obs;
  var isChoosed = false;
  Map<String, int> tempChoosedSeat = {'carriage': 0, 'seat': 0};

  var carriage = List.generate(
    6,
    (idxCarriage) => List<Map<String, dynamic>>.generate(
      75,
      (idxSeat) {
        switch (idxCarriage) {
          case 0:
            return {
              "id": "ID-${idxCarriage + 1}-${idxSeat + 1}",
              "status": idxSeat >= 24 && idxSeat <= 28 ||
                      idxSeat >= 40 && idxSeat <= 44
                  ? 'F'
                  : "A",
            };
            break;
          case 1:
            return {
              "id": "ID-${idxCarriage + 1}-${idxSeat + 1}",
              "status": idxSeat >= 3 && idxSeat <= 35 ||
                      idxSeat >= 42 && idxSeat <= 48
                  ? 'F'
                  : "A",
            };
            break;
        }

        return {
          "id": "ID-${idxCarriage + 1}-${idxSeat + 1}",
          "status": "A",
        };
      },
    ),
  ).obs;

  void changeCarriage(int index) {
    indexCarriage.value = index;
    carriage.refresh();
  }

  void chooseSeat(int seat) {
    switch (carriage[indexCarriage.value][seat]['status']) {
      case 'A': // SELECT AVAILABLE SEAT
        if (isChoosed) {
          // clear previous selected seat

          carriage[tempChoosedSeat['carriage']!][tempChoosedSeat['seat']!]
              .update("status", (value) => 'A');
        }
        carriage[indexCarriage.value][seat].update("status", (value) => 'S');
        // tempChoosedSeat.value = seat;
        tempChoosedSeat = {'carriage': indexCarriage.value, 'seat': seat};
        isChoosed = true;
        break;
      case 'S': // UNSELECT
        carriage[indexCarriage.value][seat].update("status", (value) => 'A');
        isChoosed = false;
        break;
      default:
        break;
    }
    carriage.refresh();
  }
}
