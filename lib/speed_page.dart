import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:money_tracker/speedometer.dart';
import 'color_constants.dart';

class SpeedPage extends StatelessWidget {
  SpeedPage({super.key});

  final cont = Get.put<SpeedoMeterViewCont>(SpeedoMeterViewCont(),
      tag: 'sm', permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black_background,
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedLabelStyle: TextStyle(fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        selectedItemColor: purple_clr,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.sensors_rounded), label: 'Service'),
          BottomNavigationBarItem(icon: Icon(Icons.wifi), label: 'VPN'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
      body: Column(
        children: [
          // Container(height: 27, color: black_background),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              color: black_background,
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {Get.back();},
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          )),
                      Text(
                        'Speed Test',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 30,
                      )
                    ],
                  ),
                  Obx(() {
                    return Text(
                      cont.place.value,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    );
                  }),
                  Expanded(child: SizedBox()),
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: SpeedoMeter(),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: white_background,
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Obx(() {
                    return Text(
                      '${cont.percent.value}% complete',
                      style: TextStyle(
                          color: cont.percent.value == 100
                              ? purple_clr
                              : black_background,
                          fontSize: 15),
                    );
                  }),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.network_cell_rounded,
                                color: purple_clr, size: 30),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Server',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                Obx(() {
                                  return Text(
                                    cont.server.value,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  );
                                })
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        Divider(color: Colors.grey[300], thickness: 1),
                        SizedBox(height: 5),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.wifi,
                                      color: purple_clr,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Ping',
                                      style: TextStyle(
                                          color: purple_clr, fontSize: 15),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.download_rounded,
                                      color: purple_clr,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Download',
                                      style: TextStyle(
                                          color: purple_clr, fontSize: 15),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.upload_rounded,
                                      color: purple_clr,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Upload',
                                      style: TextStyle(
                                          color: purple_clr, fontSize: 15),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Obx(() {
                                      return Text(
                                        cont.ping.value.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      );
                                    }),
                                    SizedBox(width: 5),
                                    Text(
                                      'ms',
                                      style: TextStyle(
                                          fontSize: 17, color: purple_clr),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Obx(() {
                                      return Text(
                                        cont.uploadSpeed.value.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      );
                                    }),
                                    SizedBox(width: 5),
                                    Text(
                                      'Mbp/s',
                                      style: TextStyle(
                                          fontSize: 17, color: purple_clr),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Obx(() {
                                      return Text(
                                        cont.downloadSpeed.value.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      );
                                    }),
                                    SizedBox(width: 5),
                                    Text(
                                      'Mbp/s',
                                      style: TextStyle(
                                          fontSize: 17, color: purple_clr),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        Divider(color: Colors.grey[300], thickness: 1),
                        SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {
                            cont.isRunning.value
                                ? print('Running')
                                : measureSpeed();
                          },
                          child: Obx(() {
                            return Container(
                              height: 40,
                              width: 300,
                              decoration: BoxDecoration(
                                color: cont.isRunning.value
                                    ? black_background
                                    : purple_clr,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                  child: Text(
                                'Start Test',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )),
                            );
                          }),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
