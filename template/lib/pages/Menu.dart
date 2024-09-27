import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:template/pages/responsive.dart';

import 'package:template/widgets/centro.dart';
import 'package:template/widgets/footer.dart';
import 'package:template/widgets/navbar.dart';
import 'package:template/widgets/swipers.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: mC,
    //   body: MainCard(),
    // );
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: (width >= 1200)
          ? LargeScreenAppBar()
          : (width >= 850)
              ? MediumScreenAppBar()
              : SmallScreenAppBar(),
      body: Container(
          decoration: BoxDecoration(color: Color(0xFF151c26)),
          child: Scrollbar(
            isAlwaysShown: true,
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(
                horizontal: 0.0,
              ),
              child: Column(children: [
                const SizedBox(height: 150),
                SizedBox(height: 20.0),
                Swiper(),
                SizedBox(height: 10.0),
                centroim(),
                Contenido(),
                Footer()
              ]),
            ),
          )),
    );
  }
}
