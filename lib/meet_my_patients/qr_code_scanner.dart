import 'package:biocom2/meet_my_patients/meet_my_patients.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

const flashOn = 'FLASH ON';
const flashOff = 'FLASH OFF';

class QrCodeScanner extends StatefulWidget {
  static String id = 'qr_code_scanner';
  const QrCodeScanner({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  var qrText = '';
  var flashState = flashOn;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.blue,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
//          Expanded(
//            flex: 1,
//            child: FittedBox(
//              fit: BoxFit.contain,
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  SizedBox(
//                    height: 10.0,
//                  ),
//                  Text('QR Link : $qrText',
//                      style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                      )),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: <Widget>[
//                      Container(
//                        margin: EdgeInsets.all(8),
//                        child: RaisedButton(
//                          onPressed: () {
//                            if (controller != null) {
//                              controller.toggleFlash();
//                              if (_isFlashOn(flashState)) {
//                                setState(() {
//                                  flashState = flashOff;
//                                });
//                              } else {
//                                setState(() {
//                                  flashState = flashOn;
//                                });
//                              }
//                            }
//                          },
//                          child:
//                              Text(flashState, style: TextStyle(fontSize: 15)),
//                        ),
//                      ),
//                    ],
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: <Widget>[
//                      Container(
//                        margin: EdgeInsets.all(8),
//                        child: RaisedButton(
//                          onPressed: () {
//                            controller?.pauseCamera();
//                          },
//                          child: Text('Pause', style: TextStyle(fontSize: 15)),
//                        ),
//                      ),
//                      Container(
//                        margin: EdgeInsets.all(8),
//                        child: RaisedButton(
//                          onPressed: () {
//                            controller?.resumeCamera();
//                          },
//                          child: Text('Resume', style: TextStyle(fontSize: 15)),
//                        ),
//                      )
//                    ],
//                  ),
//                ],
//              ),
//            ),
//          )
        ],
      ),
    );
  }

//  bool _isFlashOn(String current) {
//    return flashOn == current;
//  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MeetMyPatients(
                      qrLink: qrText,
                    )));
        controller.dispose();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
