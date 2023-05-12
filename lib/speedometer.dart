import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_internet_speed_test/flutter_internet_speed_test.dart';
import 'package:money_tracker/color_constants.dart';
import 'package:rive/rive.dart';
import 'package:get/get.dart';

late SMINumber speed;
int realspeed = 0;

class SpeedoMeter extends StatelessWidget {
  SpeedoMeter({super.key});

  final cont = Get.find<SpeedoMeterViewCont>(tag: 'sm');

  void _onInit(Artboard artboard) {
    final ctrl =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(ctrl!);
    speed = ctrl.findSMI('speed');
    speed.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          children: [
            RiveAnimation.asset(
              'assets/speedometer.riv',
              artboard: 'Speedometer Artboard',
              onInit: _onInit,
            ),
            Center(
              child: Obx(() {
                return Text(
                  cont.realspeed.value.toString(),
                  style: TextStyle(fontSize: 36, color: Colors.white),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

void pingrate() async {
  final cont = Get.find<SpeedoMeterViewCont>(tag: 'sm');
  try {
    final result = await InternetAddress.lookup('google.com');
    final ipAddress = result.first;
    final ping = await _ping(ipAddress);
    print('Ping: ${ping.inMilliseconds} ms');
    cont.ping.value = ping.inMilliseconds.toInt();
  } on SocketException catch (e) {
    print('Error: ${e.message}');
  }
}

Future<Duration> _ping(InternetAddress ipAddress) async {
  final stopwatch = Stopwatch()..start();
  final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
  socket.listen((event) {
    if (event == RawSocketEvent.read) {
      socket.receive();
      stopwatch.stop();
      socket.close();
    }
  });
  socket.send([0], ipAddress, 80);
  return stopwatch.elapsed;
}

void measureSpeed() {
  final cont = Get.find<SpeedoMeterViewCont>(tag: 'sm');

  cont.isRunning.value = true;

  speed.value = 0;
  cont.realspeed.value = 0;
  cont.uploadSpeed.value = 0;
  cont.downloadSpeed.value = 0;
  cont.percent.value = 0;
  cont.place.value = '_-_';
  cont.server.value = '_-_';
  cont.ping.value = 0;

  FlutterInternetSpeedTest().startTesting(
      onDefaultServerSelectionDone: (client) {
    client!.location!.country != null
        ? cont.place.value = client.location!.country.toString() +
            ' - ' +
            client.location!.city.toString()
        : '___';

    client.isp != null ? cont.server.value = client.isp.toString() : '_-_';
    pingrate();
  }, onCompleted: (TestResult download, TestResult upload) {
    cont.isRunning.value = false;
  }, onProgress: (double percent, TestResult data) {
    speed.value = data.transferRate;
    cont.realspeed.value = data.transferRate.toInt();
    cont.percent.value = percent.toInt();
  }, onError: (errorMessage, speedTestError) {
    print(errorMessage);
    Get.snackbar('', '',
        duration: Duration(seconds: 2),
        backgroundColor: black_background,
        snackPosition: SnackPosition.BOTTOM,
        overlayBlur: 10,
        padding: EdgeInsets.only(bottom: 30),
        margin: EdgeInsets.only(bottom: 200, left: 30, right: 30),
        messageText: Text(
          errorMessage,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ));
    cont.isRunning.value = false;
  }, onUploadComplete: (data) {
    cont.uploadSpeed.value = data.transferRate.toInt();
  }, onDownloadComplete: (data) {
    cont.downloadSpeed.value = data.transferRate.toInt();
  });
}

class SpeedoMeterViewCont extends GetxController {
  var realspeed = 0.obs;
  var uploadSpeed = 0.obs;
  var downloadSpeed = 0.obs;
  var percent = 0.obs;
  var place = '_-_'.obs;
  var server = '_-_'.obs;
  var ping = 0.obs;

  var isRunning = false.obs;
}
