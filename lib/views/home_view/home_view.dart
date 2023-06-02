import 'package:flutter/material.dart';
import 'package:makchain_gov/core/styles/texts/app_text_styles.dart';
import 'package:makchain_gov/core/utils/naviagtion.dart';
import 'package:makchain_gov/views/home_view/auth_view.dart';
import 'package:makchain_gov/views/home_view/nfc_reader.dart';
import 'package:makchain_gov/views/home_view/tag_reader.dart';
import 'package:makchain_gov/views/police_station/police_station_view.dart';
import 'package:makchain_gov/views/qr_scanner_view/qr_scanner_view.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var tag = {
    'nfca': {
      'identifier': [4, 160, 167, 82, 169, 17, 144],
      "atqa": [68, 0],
      "maxTransceiveLength": 253,
      'sak': 0,
      "timeout": 618
    },
    "mifareultralight": {
      "identifier": [4, 160, 167, 82, 169, 17, 144],
      "maxTransceiveLength": 253,
      "timeout": 618,
      "type": 2
    },
    "ndef": {
      "identifier": [4, 160, 167, 82, 169, 17, 144],
      "isWritable": true,
      "maxSize": 492,
      "canMakeReadOnly": true,
      "cachedMessage": {
        "records": [
          {
            "typeNameFormat": 1,
            "type": [84],
            "identifier": [],
            "payload": [
              2,
              101,
              110,
              51,
              48,
              50,
              48,
              54,
              50,
              57,
              49,
              52,
              48,
              48,
              48,
              57,
              54
            ]
          }
        ]
      },
      "type": "org.nfcforum.ndef.type2"
    }
  };

  @override
  void initState() {
    // TODO: implement initState
    //print("rrrrrrr" + tag['ndef']!['cachedMessage']!.toString());

    //print (ndef.UriRecord.("https://github.com/nfcim/flutter_nfc_kit"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "نقطة تفتيش بنها",
          style: AppTextStyle.headLine(),
        )),
        backgroundColor: Color(0xff4D1570),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          /*decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/banha.webp"),
              fit: BoxFit.cover,
            ),
          ),*/

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "قم باختيار الطريقة المناسبة او المتاحة",
                style: AppTextStyle.headLine(),
              ),
              SizedBox(
                  width: 200,
                  height: 200,
                  child: TextButton(
                    onPressed: () {
                      AppNavigator.customNavigator(
                          context: context, screen: MyApp(), finish: false);
                    },
                    child: Lottie.asset(
                        'assets/animations/nfc-id-card-scan-iphone.json',
                        width: 200,
                        height: 200),
                  )),

/*
              ElevatedButton(
                  onPressed: () {
                    AppNavigator.customNavigator(
                        context: context, screen: MyAppAuth(), finish: false);
                  },
                  child: Text("Let's Auth")),

              ElevatedButton(
                  onPressed: () {
                    AppNavigator.customNavigator(
                        context: context, screen: PoliceStationView(), finish: false);
                  },
                  child: Text("طلع بطاقتك")),
*/

              SizedBox(
                width: 200,
                height: 200,
                child: TextButton(
                    onPressed: () {
                      AppNavigator.customNavigator(
                          context: context,
                          screen: ScanScreen(),
                          finish: false);
                    },
                    // phone-qr-code-scan
                    child: Lottie.asset(
                      "assets/animations/phone-qr-code-scan.json",
                      width: 200,
                      height: 200,
                    )),
              ),
              //Image.asset("assets/images/Logo.png")
            ],
          ),
        ),
      ),
    );
  }
}
