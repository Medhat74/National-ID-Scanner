import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:makchain_gov/blocs/citzen_cubit/citizen_cubit.dart';
import 'package:makchain_gov/core/styles/texts/app_text_styles.dart';
import 'package:makchain_gov/core/utils/naviagtion.dart';
import 'package:makchain_gov/views/police_station/police_station_view.dart';
import 'package:nfc_manager/nfc_manager.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ValueNotifier<dynamic> result = ValueNotifier(null);
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NfcManager Plugin Example')),
      body: SafeArea(
        child: FutureBuilder<bool>(
          future: NfcManager.instance.isAvailable(),
          builder: (context, ss) => ss.data != true
              ? Center(child: Text('NfcManager.isAvailable(): ${ss.data}'))
              : Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                      onPressed: _tagRead,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset('assets/animations/nfc-card-read.json',
                              width: 200, height: 200),
                          Text(
                            "ضع البطاقة تحت الهاتف",
                            style: AppTextStyle.headLine(),
                          ),
                          Text(
                            "واضغط علي الصورة",
                            style: AppTextStyle.headLine(),
                          ),
                        ],
                      ),
                    ),
                ),
              ),
          /*Flex(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  direction: Axis.vertical,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.all(4),
                        constraints: BoxConstraints.expand(),
                        decoration: BoxDecoration(border: Border.all()),
                        child: SingleChildScrollView(
                          child: ValueListenableBuilder<dynamic>(
                            valueListenable: result,
                            builder: (context, value, _) =>
                                Text('${value ?? ''}'),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: GridView.count(
                        padding: EdgeInsets.all(4),
                        crossAxisCount: 2,
                        childAspectRatio: 4,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        children: [
                          ElevatedButton(
                              child: Text('Tag Read'), onPressed: _tagRead),
                          */ /*ElevatedButton(
                              child: Text('Ndef Write'), onPressed: _ndefWrite),
                          */ /**/ /*ElevatedButton(
                              child: Text('Ndef Write Lock'),
                              onPressed: _ndefWriteLock),
                          */ /*
                        ],
                      ),
                    ),
                  ],
                ),*/
        ),
      ),
    );
  }

  void _tagRead() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      result.value = tag.data;

      NfcManager.instance.stopSession();
      debugPrint("rrrrrrrrr : " + tag.data.toString());
      final ndefTag = Ndef.from(tag);
      if (ndefTag!.cachedMessage != null) {
        var ndefMessage = ndefTag.cachedMessage!;
        if (ndefMessage.records.isNotEmpty &&
            ndefMessage.records.first.typeNameFormat ==
                NdefTypeNameFormat.nfcWellknown) {
          //If the first record exists as 1:Well-Known we consider this tag as having a value for us
          final wellKnownRecord = ndefMessage.records.first;

          ///Payload for a 1:Well Known text has the following format:
          ///[Encoding flag 0x02 is UTF8][ISO language code like en][content]
          if (wellKnownRecord.payload.first == 0x02) {
            //Now we know the encoding is UTF8 and we can skip the first byte
            final languageCodeAndContentBytes =
                wellKnownRecord.payload.skip(1).toList();
            //Note that the language code can be encoded in ASCI, if you need it be carfully with the endoding
            final languageCodeAndContentText =
                utf8.decode(languageCodeAndContentBytes);
            //Cutting of the language code
            final payload = languageCodeAndContentText.substring(2);
            print(payload);
          }
          //Parsing the content to int
        }
      }
      CitizenCubit.get(context).getCitizen("citizenToken");
      AppNavigator.customNavigator(
          context: context, screen: PoliceStationView(), finish: true);
    });
  }

  /*void _ndefWrite() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        result.value = 'Tag is not ndef writable';
        NfcManager.instance.stopSession(errorMessage: result.value);
        return;
      }

      NdefMessage message = NdefMessage([
        NdefRecord.createText('Hello World!'),
        NdefRecord.createUri(Uri.parse('https://flutter.dev')),
        NdefRecord.createMime(
            'text/plain', Uint8List.fromList('Hello'.codeUnits)),
        NdefRecord.createExternal(
            'com.example', 'mytype', Uint8List.fromList('mydata'.codeUnits)),
      ]);

      try {
        await ndef.write(message);
        result.value = 'Success to "Ndef Write"';
        print(result.value);
        NfcManager.instance.stopSession();
      } catch (e) {
        result.value = e;
        print(result.value);
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
    });
  }*/

  /*void _ndefWriteLock() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null) {
        result.value = 'Tag is not ndef';
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }

      try {
        await ndef.writeLock();
        result.value = 'Success to "Ndef Write Lock"';
        NfcManager.instance.stopSession();
      } catch (e) {
        result.value = e;
        NfcManager.instance.stopSession(errorMessage: result.value.toString());
        return;
      }
    });
  }*/
}
