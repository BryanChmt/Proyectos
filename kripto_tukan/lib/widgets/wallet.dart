import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kripto_tukan/Pages/depositar_page.dart';
import 'package:kripto_tukan/Pages/retirar_page.dart';
import 'package:kripto_tukan/models/icons.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _activos(context),
            const SizedBox(height: 10.0),
            _tasacambio(context),
            const SizedBox(height: 10.0),
            FittedBox(child: _buttons(context)),
            const SizedBox(height: 15.0),
            biletera(context),
            const SizedBox(height: 45.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                  child: Text(
                    'Monedas disponibles',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontFamily: 'light'),
                  ),
                ),
                _monedas(context, 'Ether', 'ETH', '0 ETH', r'0.00 $',
                    'assets/ether.png'),
                _monedas(context, 'Ripple', 'XRP', '0 XRP', r'0.00 $',
                    'assets/ripple.png'),
                _monedas(context, 'Bitcoin cash', 'BCH', '0 BCH', r'0.00 $',
                    'assets/bitcoin cash.png'),
                const SizedBox(height: 90.0),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buttons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF04bb04),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
            child: TextButton(
                style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RetirarPage()));
                },
                child: Row(
                  children: [
                    Icon(
                      MyFlutterApp.deposit,
                      color: Colors.white,
                      size: 18.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: _text('RETIRAR', 18.0, Colors.white, 'coco'),
                    ),
                  ],
                )),
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        Container(
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
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
            child: TextButton(
                style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DepositarPage()));
                },
                child: Row(
                  children: [
                    Icon(
                      MyFlutterApp.withdrawal,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    _text('DEPOSITAR', 16.0, Colors.white, 'coco'),
                  ],
                )),
          ),
        )
      ],
    );
  }

  Widget _activos(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.85,
      decoration: BoxDecoration(
        color: Color(0Xff1e1c3c),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _text('Activos totales', 15.0, Colors.white, 'light'),
                    Image(
                      image: AssetImage('assets/importante.png'),
                      height: 20.0,
                      width: 20.0,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _text(r'0,00 $ ', 70.0, Colors.white, 'light'),
                      // Icon(Icons.arrow_drop_down,size: 100.0,)
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  _text(r'0.000000000 BTC ', 15.0, Colors.white, 'light'),
                ],
              )
            ],
          ),
          Divider(color: Colors.grey),
          Container(
            height: 140.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13.0),
                  child: Container(
                    height: 140.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Saldo disponible',
                            style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.white70,
                                fontFamily: 'light')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _text(r'0,00 $ ', 35.0, Colors.white, 'light'),
                            // Icon(Icons.arrow_drop_down,size: 100.0,)
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        _text(
                            r'0.000000000 BTC ', 10.0, Colors.white70, 'light')
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Image(
                    image: AssetImage('assets/importante.png'),
                    height: 20.0,
                    width: 20.0,
                  ),
                ),
                VerticalDivider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 140.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Pendiente y en pedidos',
                                  style: TextStyle(
                                      fontSize: 11.0,
                                      color: Colors.white70,
                                      fontFamily: 'light')),
                              _text(r'0,00 $ ', 35.0, Colors.white, 'light'),
                              const SizedBox(height: 10.0),
                              _text(r'0.000000000 BTC', 10.0, Colors.white70,
                                  'light'),
                            ],
                          )),
                    ],
                  ),
                ),
                Container(
                  height: 140.0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Image(
                        image: AssetImage('assets/importante.png'),
                        height: 20.0,
                        width: 20.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _tasacambio(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.85,
      decoration: BoxDecoration(
        color: Color(0Xff1e1c3c),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _text('Tasa de cambio', 15.0, Colors.white, 'light'),
            _text(r'1BTC = 44,946.13 $ ', 30.0, Colors.white, 'light')
          ],
        ),
      ),
    );
  }

  Widget biletera(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0, left: 8.0),
          child: Text(
            'Billetera',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'light'),
          ),
        ),
        Container(
          width: size.width * 0.85,
          decoration: BoxDecoration(
            color: Color(0Xff1e1c3c),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                          width: 45.0,
                          child: Image(
                            image: AssetImage('assets/bitcoin.png'),
                            width: 38,
                            height: 38,
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _text('Bitcoin', 10.0, Colors.white, 'light'),
                          const SizedBox(height: 7.0),
                          _text('BTC', 10.0, Colors.white, 'light')
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _text('0.000000000 BTC ', 15.0, Colors.white, 'light'),
                      const SizedBox(height: 7.0),
                      _text(r'0.00$ ', 10.0, Colors.white, 'light')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _monedas(BuildContext context, String mone, String dimin, String mon,
      String cant, String asset) {
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
              const EdgeInsets.only(top: 10, bottom: 10, left: 8, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                        width: 45.0,
                        child: Image(
                          image: AssetImage(asset),
                          width: 35,
                          height: 35,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _text(mone, 10.0, Colors.white, 'ultra'),
                        const SizedBox(height: 7.0),
                        _text(dimin, 10.0, Colors.white, 'ultra')
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _text(mon, 15.0, Colors.white, 'light'),
                    const SizedBox(height: 7.0),
                    _text(cant, 10.0, Colors.white, 'light')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text(String data, double size, Color color, String family) {
    return AutoSizeText(
      data,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontFamily: family,
      ),
    );
  }
}
