import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kripto_tukan/Pages/home_page.dart';
import 'package:kripto_tukan/models/icons.dart';

class DepositarPage extends StatefulWidget {
  const DepositarPage({Key key}) : super(key: key);

  @override
  _DepositarPageState createState() => _DepositarPageState();
}

class _DepositarPageState extends State<DepositarPage> {
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
                                          builder: (context) => HomePage()));
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
                                      MyFlutterApp.withdrawal,
                                      color: Color(0xff39a1ba),
                                      size: 22.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        'DEPOSITAR BITCOIN(BTC)',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontFamily: 'ultra'),
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
                  _cont()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cont() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buttons(),
          const SizedBox(height: 50),
          Image(
            image: AssetImage('assets/alerta_1.png'),
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 50),
          _text('¡Envíe solo Bitcoin(BTC) a esta dirección!', 15.0,
              Colors.grey[850], 'coco'),
          const SizedBox(height: 30),
          _text('Enviar a cualquier otra moneda digital', 14.0,
              Colors.grey[850], 'coco'),
          const SizedBox(height: 8),
          _text('resultará en una pérdida permanente.', 14.0, Colors.grey[850],
              'coco'),
          const SizedBox(height: 55),
          ElevatedButton(
              style: ButtonStyle(
                splashFactory: NoSplash.splashFactory,
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF04bb04)),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 10.0, left: 20.0, right: 20.0),
                child:
                    _text('MOSTRAR BTC DIRECCIÓN', 18.0, Colors.white, 'coco'),
              )),
        ],
      ),
    );
  }

  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
              color: Color(0Xff1e1c3c)),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 18.0, bottom: 18.0, left: 18.0, right: 40.0),
            child: TextButton(
                style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DepositarPage()));
                },
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/bitcoin.png'),
                      width: 35,
                      height: 35,
                    ),
                    const SizedBox(width: 10.0),
                    _text('BITCOIN', 13.0, Colors.white70, 'ultra'),
                  ],
                )),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
              color: Colors.grey[800]),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 13.0, bottom: 13.0, left: 10.0, right: 30.0),
            child: TextButton(
                style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DepositarPage()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.offline_bolt_sharp,
                      size: 45.0,
                      color: Colors.grey[700],
                    ),
                    _text('RED LIGHTNING', 12.0, Colors.white, 'ultra'),
                  ],
                )),
          ),
        )
      ],
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
