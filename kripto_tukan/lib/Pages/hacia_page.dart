import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kripto_tukan/Pages/home_page.dart';
import 'package:kripto_tukan/Pages/retirar_page.dart';
import 'package:kripto_tukan/models/icons.dart';

class HaciaPage extends StatefulWidget {
  const HaciaPage({Key key}) : super(key: key);

  @override
  _HaciaPageState createState() => _HaciaPageState();
}

class _HaciaPageState extends State<HaciaPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: ExactAssetImage('assets/fondo.jpg'),
                fit: BoxFit.cover,
              )),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Color(0Xff1e1c3c),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40.0),
                              bottomRight: Radius.circular(40.0))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 40.0,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RetirarPage()));
                                },
                                icon: Icon(
                                  MyFlutterApp.cancel,
                                  color: Color(0xff39a1ba),
                                  size: 25.0,
                                ),
                              ),
                            ),
                            Container(
                              height: 40.0,
                              width: size.width * 0.75,
                              child: Align(
                                alignment: Alignment.center,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      MyFlutterApp.deposit,
                                      color: Colors.white,
                                      size: 25.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        'RETIRAR HACIA',
                                        style: TextStyle(
                                            fontSize: 25.0,
                                            color: Colors.white,
                                            fontFamily: 'coco'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    width: size.width * 0.85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        gradient: LinearGradient(
                            colors: [
                              Color(0xff4c2f6a),
                              Color(0xFF392c6b),
                            ],
                            stops: [
                              0.2,
                              0.6
                            ],
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _text('Los retiros de', 15.0, Colors.white70,
                                  'light'),
                              _text(' INTERNA,KRYPTOMAT,', 15.0, Colors.white,
                                  'light'),
                            ],
                          ),
                          _text('LIGTNING,COINBASE,PAYEER,BITGO', 16.0,
                              Colors.white, 'light'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _text('a BTC', 15.0, Colors.white, 'light'),
                              _text(' están deshabilitados actualmente', 15.0,
                                  Colors.white70, 'light'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 45.0),
                  Text(
                    'Agregar opción de retiro se requiere 2-FA',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  FittedBox(
                    child: _routes(
                        context,
                        'Agregar nuevo BTC dirección de retiro',
                        Icons.add_circle_outline_rounded),
                  ),
                  FittedBox(
                      child:
                          _routes2(context, 'Conecte su cuenta de Coinbase')),
                  FittedBox(
                    child: _routes(context, 'Retirar a la billetera Lightning',
                        Icons.offline_bolt_sharp),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _routes(BuildContext context, String mone, IconData icon) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        width: size.width * 0.85,
        decoration: BoxDecoration(
          color: Color(0Xff1e1c3c),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 12, bottom: 12, left: 8, right: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                        width: 45.0,
                        child: Icon(
                          icon,
                          color: Color(0xff39a1ba),
                          size: 35.0,
                        )),
                    const SizedBox(width: 15.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _text(mone, 10.0, Colors.white70, 'ultra'),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color(0xff39a1ba),
                size: 25,
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _routes2(
    BuildContext context,
    String mone,
  ) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.85,
      decoration: BoxDecoration(
        color: Color(0Xff1e1c3c),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                      width: 60.0,
                      child: Text(
                        'coinbase',
                        style: TextStyle(color: Colors.lightBlue),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _text(mone, 10.0, Colors.white70, 'ultra'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color(0xff39a1ba),
              size: 25,
            )),
          ],
        ),
      ),
    );
  }

  Widget _text(String data, double size, Color color, String family) {
    return AutoSizeText(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontFamily: family,
      ),
    );
  }
}
