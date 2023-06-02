import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:makchain_gov/core/utils/naviagtion.dart';
import 'package:makchain_gov/views/home_view/auth_view.dart';
import 'package:makchain_gov/views/home_view/home_view.dart';
import 'package:makchain_gov/views/police_station/police_station_view.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../core/utils/navigation.dart';
import 'compmonents/qr_scanner_overlay.dart';

class ScanScreen extends StatelessWidget {
  MobileScannerController cameraController = MobileScannerController();

  ScanScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          MobileScanner(
            allowDuplicates: false,
            controller: cameraController,
            onDetect: (barcode, args) {
              if (barcode.rawValue == null) {
                debugPrint('Failed to scan Barcode');
              } else {
                final String code = barcode.rawValue!;
                debugPrint('Barcode found! $code');
                //cameraController = MobileScannerController();
                AppNavigator.customNavigator(
                    context: context,
                    screen: PoliceStationView(),
                    finish: false);
              }
            },
          ),
          QRScannerOverlay(
            overlayColour: Colors.black.withOpacity(
              0.5,
            ),
          ),
        ],
      ),
    );
  }
}
