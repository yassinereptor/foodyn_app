import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodyn_eatery/core/widgets/modal_container_widget.dart';
import 'package:foodyn_eatery/features/auth/presentation/pages/register_image_page.dart';
import 'package:foodyn_eatery/features/auth/presentation/widgets/botton_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';

class QrScannerPage extends StatefulWidget {
  static const kRouteName = "/qr-scanner";

  const QrScannerPage({Key? key}) : super(key: key);

  @override
  _QrScannerPageState createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? _qrResult;
  QRViewController? _qrViewController;
  bool _flashOn = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (_qrViewController != null) _qrViewController!.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController _qrViewController) {
    this._qrViewController = _qrViewController;

    _qrViewController.scannedDataStream.listen((scanData) {
      setState(() {
        _qrResult = scanData;
        Routes.seafarer.pop([_qrResult]);
      });
    });
  }

  void _flashTap() {
    if (_qrViewController != null)
      _qrViewController!.toggleFlash().then((value) => setState((){
        _flashOn = !_flashOn;
      }));
  }

  void _closeTap() {
    Routes.seafarer.pop();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (_qrViewController != null) {
      if (Platform.isAndroid) {
        _qrViewController!.pauseCamera();
      } else if (Platform.isIOS) {
        _qrViewController!.resumeCamera();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var scanArea = MediaQuery.of(context).size.width / 1.5;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                Expanded(
                  child: QRView(
                    formatsAllowed: [
                      BarcodeFormat.qrcode
                    ],
                    overlay: QrScannerOverlayShape(
                    borderColor: Colors.red,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: scanArea),
                    key: _qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                ),
              ],
            ),
            Positioned(
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: InkWell(
                            onTap: _flashTap,
                            child: Icon(
                              _flashOn
                                  ? Icons.flash_on_rounded
                                  : Icons.flash_off_rounded,
                              size: 30,
                              color: isDark(context)
                                  ? GlobalTheme.kPrimaryColor
                                  : GlobalTheme.kAccentColor,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 20),
                          child: InkWell(
                            onTap: _closeTap,
                            child: Icon(
                              Icons.close,
                              size: 30,
                              color: isDark(context)
                                  ? GlobalTheme.kPrimaryColor
                                  : GlobalTheme.kAccentColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
