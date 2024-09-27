import 'package:flutter/material.dart';
import 'package:kripto_tukan/models/icons.dart';
import 'package:kripto_tukan/widgets/market.dart';
import 'package:kripto_tukan/widgets/minar.dart';
import 'package:kripto_tukan/widgets/settings.dart';
import 'package:kripto_tukan/widgets/wallet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

enum BottomIcons { Minar, Wallet, Market, Usuario, Menu }

class _HomePageState extends State<HomePage> {
  BottomIcons bottomIcons = BottomIcons.Wallet;
  @override
  Widget build(BuildContext context) {
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
           
            bottomIcons == BottomIcons.Wallet
                ? Container(
                    child: Wallet(),
                  )
                : Container(),
            bottomIcons == BottomIcons.Minar
                ? Center(
                    child: Minar(),
                  )
                : Container(),
            bottomIcons == BottomIcons.Market
                ? Center(
                    child: MarketPlace(),
                  )
                : Container(),
            bottomIcons == BottomIcons.Usuario
                ? Center(
                    child: Settings(),
                  )
                : Container(),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0Xff1e1c3c),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.0),
                        topRight: Radius.circular(35.0))),
                padding: const EdgeInsets.symmetric(
                    horizontal: 28.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          bottomIcons = BottomIcons.Minar;
                        });
                      },
                      child: bottomIcons == BottomIcons.Minar
                          ? Icon(
                              MyFlutterApp.minar,
                              size: 32.0,
                              color: Color(0xff39a1ba),
                            )
                          : Icon(
                              MyFlutterApp.minar,
                              color: Colors.white,
                              size: 32.0,
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          bottomIcons = BottomIcons.Wallet;
                        });
                      },
                      child: bottomIcons == BottomIcons.Wallet
                          ? Icon(
                              MyFlutterApp.wallet,
                              size: 32.0,
                              color: Color(0xff39a1ba),
                            )
                          : Icon(
                              MyFlutterApp.wallet,
                              color: Colors.white,
                              size: 32.0,
                            ),
                    ),
                    GestureDetector(
                      onTap: () => showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.0))),
                          context: context,
                          builder: (context) => buildBottom()),
                      child: bottomIcons == BottomIcons.Menu
                          ? Icon(
                              Icons.code_rounded,
                              size: 32.0,
                              color: Color(0xff39a1ba),
                            )
                          : Icon(
                              Icons.code_rounded,
                              color: Colors.white,
                              size: 32.0,
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          bottomIcons = BottomIcons.Market;
                        });
                      },
                      child: bottomIcons == BottomIcons.Market
                          ? Icon(
                              MyFlutterApp.market,
                              size: 32.0,
                              color: Color(0xff39a1ba),
                            )
                          : Icon(
                              MyFlutterApp.market,
                              color: Colors.white,
                              size: 32.0,
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          bottomIcons = BottomIcons.Usuario;
                        });
                      },
                      child: bottomIcons == BottomIcons.Usuario
                          ? Icon(
                              MyFlutterApp.usuario,
                              size: 32.0,
                              color: Color(0xff39a1ba),
                            )
                          : Icon(
                              MyFlutterApp.usuario,
                              color: Colors.white,
                              size: 32.0,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottom() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        color: Color(0Xff1e1c3c),
      ),
      height: 260,
      child: Padding(
        padding: const EdgeInsets.only(left:8.0,top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _butons(Icons.add_circle_outline_rounded, 'Buy',
                  'Buy crypto with cash'),
              _butons(Icons.autorenew_rounded, 'Convert',
                  'Convert one crypto to another'),
              _butons(Icons.arrow_upward_rounded, 'Send',
                  'Send crypto to another wallet'),
              _butons(Icons.arrow_downward_rounded, 'Receive',
                  'Receive crypto from another wallet')
            ],
          ),
        ),
      ),
    );
  }

  Widget _butons(IconData icon, String text1, String text2) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: Color(0xff39a1ba),
              size: 28.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(color: Colors.white, fontSize: 15.0,),
                ),
                Text(text2,
                    style: TextStyle(color: Colors.white70, fontSize: 15.0))
              ],
            ),
          )
        ],
      ),
    );
  }
}
