import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kripto_tukan/Pages/hacia_page.dart';
import 'package:kripto_tukan/models/icons.dart';

import 'home_page.dart';

class RetirarPage extends StatefulWidget {
  const RetirarPage({Key key}) : super(key: key);

  @override
  _RetirarPageState createState() => _RetirarPageState();
}

class _RetirarPageState extends State<RetirarPage> {
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
                alignment: Alignment.topCenter,
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
                              Icons.arrow_back_ios_rounded,
                              color: Color(0xff39a1ba),
                              size: 25.0,
                            ),
                          ),
                        ),
                        Container(
                          height: 27.0,
                          width: size.width * 0.75,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  MyFlutterApp.deposit,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    'RETIRAR',
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.white,
                                        fontFamily: 'extra'),
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
              const SizedBox(height: 40.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _search(),
                      const SizedBox(height: 20.0),
                      _monedas(context, 'Bitcoin ', '0 BTC', 'BTC', r'0.00 $',
                          'assets/bitcoin.png'),
                      _monedas(context, 'Ether', 'ETH', '0 ETH', r'0.00 $',
                          'assets/ether.png'),
                      _monedas(context, 'Ripple', 'XRP', '0 XRP', r'0.00 $',
                          'assets/ripple.png'),
                      _monedas(context, 'Bitcoin cash', 'BCH', '0 BCH',
                          r'0.00 $', 'assets/bitcoin cash.png'),
                      _monedas(context, 'Litecoin', '0 LTC', 'LTC', r'0.00 $',
                          'assets/litecoin.png'),
                      _monedas(context, 'Dash', '0 Dash', 'DASH', r'0.00 $',
                          'assets/dash.png'),
                      _monedas(context, 'Zcash', '0 ZEC', 'ZEC', r'0.00 $',
                          'assets/zcash.png'),
                      const SizedBox(height: 90.0)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    )));
  }

  Widget _search() {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.85,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(MyFlutterApp.lupa),
          )),
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  hintText: 'Buscar'),
            ),
          )
        ],
      ),
    );
  }

  Widget _monedas(BuildContext context, String mone, String dimin, String mon,
      String cant, String asset) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HaciaPage()));
      },
      child: Padding(
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
