import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/select_ticket_controller.dart';

class SelectTicketView extends GetView<SelectTicketController> {
  const SelectTicketView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/bg.png'),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: context.mediaQueryPadding.top),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 100,
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Select Your\nSeat',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333E63)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Commuter Line (A)'),
                        Text(
                          'Wagon 1-3A',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF656CEE)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 50,
                  // color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SeatStatus(title: 'Available', seatColor: Colors.white),
                      SeatStatus(title: 'Filled', seatColor: Color(0xFFFF8B2D)),
                      SeatStatus(
                          title: 'Selected', seatColor: Color(0xFF656CEE)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: Column(
                      children: [
                        GridView.count(
                          crossAxisCount: 6,
                          // childAspectRatio: (5 / 4),
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 18,
                          shrinkWrap: true,
                          children: List.generate(
                            6,
                            (index) {
                              var colVal = 'Wagon';
                              switch (index) {
                                case 1:
                                  colVal = 'A';
                                  break;
                                case 2:
                                  colVal = 'B';
                                  break;
                                case 3:
                                  colVal = 'C';
                                  break;
                                case 4:
                                  colVal = 'D';
                                  break;
                                case 5:
                                  colVal = 'E';
                                  break;
                              }
                              return Center(
                                child: Text('$colVal',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: index == 0 ? 10 : 12)),
                              );
                            },
                          ),
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            Container(
                              width: 55,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Obx(
                                  () => Column(
                                    children: List.generate(
                                      controller.carriage.length,
                                      (index) => GestureDetector(
                                        onTap: () =>
                                            controller.changeCarriage(index),
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          height: 150,
                                          decoration: BoxDecoration(
                                            color: controller
                                                        .indexCarriage.value ==
                                                    index
                                                ? Color(0xFF656CEE)
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.black54),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${index + 1}',
                                              style: TextStyle(
                                                  color: controller
                                                              .indexCarriage
                                                              .value ==
                                                          index
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Obx(
                                  () => GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: 10,
                                            crossAxisCount: 5,
                                            crossAxisSpacing: 10),
                                    itemCount: controller
                                        .carriage[
                                            controller.indexCarriage.value]
                                        .length,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () => controller.chooseSeat(index),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black38),
                                          color: controller.carriage[controller
                                                          .indexCarriage.value]
                                                      [index]['status'] ==
                                                  'F'
                                              ? Color(0xFFFF8B2D)
                                              : controller.carriage[controller
                                                              .indexCarriage
                                                              .value][index]
                                                          ['status'] ==
                                                      'S'
                                                  ? Color(0xFF656CEE)
                                                  : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            // '${e['id'].substring(3)}',
                                            '${controller.carriage[controller.indexCarriage.value][index]['id'].substring(3)}',
                                            style: TextStyle(fontSize: 9),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  /*
                                  GridView.count(
                                    padding: EdgeInsets.all(10),
                                    crossAxisCount: 5,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    children: controller.carriage[
                                            controller.indexCarriage.value]
                                        .map(
                                          (e) => 
                                        )
                                        .toList(),
                                  ),
*/
                                ),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('SELECT YOUR SEAT'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF656CEE),
                      fixedSize: Size(Get.width * 0.8, 50),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SeatStatus extends StatelessWidget {
  const SeatStatus({
    Key? key,
    required this.title,
    required this.seatColor,
  }) : super(key: key);

  final String title;
  final Color seatColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: seatColor,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(width: 7),
        Text(
          '$title',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
