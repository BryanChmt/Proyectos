
import 'package:flutter/material.dart';
import 'package:seguridad_policial/widgets/login_form.dart';

import 'package:seguridad_policial/widgets/responsive.dart';

class CustomLogin extends StatelessWidget {
  const CustomLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Responsive(
        mediumScreen: _LoginDesktop(),
        smallScreen: _LoginMobile(),
        largeScreen: _LoginDesktop(),
      ),
    );
  }
}

class _LoginMobile extends StatelessWidget {
  const _LoginMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: ExactAssetImage('assets/imagelanding.jpeg'),
                fit: BoxFit.cover,
              )),
            ),
            Container(
              height: 500.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Center(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: 600.0,
                  child: TextFields()),
            )
          ],
        ),
      ),
    );
  }
}

class _LoginDesktop extends StatelessWidget {
  const _LoginDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: ExactAssetImage('assets/imagelanding.jpeg'),
              fit: BoxFit.cover,
            )),
          ),
          Container(
            height: 500.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              width: 600.0,
              child: Center(child: TextFields()))
        ],
      ),
    );
  }
}
