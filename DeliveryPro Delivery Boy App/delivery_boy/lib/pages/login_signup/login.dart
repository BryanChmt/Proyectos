import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:delivery_boy/constant/constant.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:delivery_boy/pages/login_signup/otp_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String phoneNumber;
  String phoneIsoCode;
  DateTime currentBackPressTime;
  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: WillPopScope(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(fixPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Image.asset(
                    'assets/delivery.png',
                    width: 200.0,
                    fit: BoxFit.fitWidth,
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text('Signin with Phone Number', style: greyHeadingStyle),
                  heightSpace,
                  heightSpace,
                  Container(
                    padding: EdgeInsets.only(left: fixPadding),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurRadius: 1.5,
                          spreadRadius: 1.5,
                          color: Colors.grey[200],
                        ),
                      ],
                    ),
                    child: InternationalPhoneInput(
                      onPhoneNumberChange: onPhoneNumberChange,
                      initialPhoneNumber: phoneNumber,
                      initialSelection: phoneIsoCode,
                      enabledCountries: [
                        '+233',
                        '+1',
                        '+91',
                        '+596',
                        '+689',
                        '+262',
                        '+241',
                        '+220',
                        '+995',
                        '+49',
                        '+350'
                      ],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15.0),
                        hintText: 'Phone Number',
                        hintStyle: greyHeadingStyle,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: fixPadding),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OTPScreen()));
                      },
                      child: Container(
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: primaryColor,
                        ),
                        child: Text(
                          'Continue',
                          style: wbuttonWhiteTextStyle,
                        ),
                      ),
                    ),
                  ),
                  heightSpace,
                  Text('We\'ll send OTP for Verification.',
                      style: lightGreyStyle),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Color(0xFF3B5998),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/facebook.png',
                            height: 25.0,
                            fit: BoxFit.fitHeight,
                          ),
                          widthSpace,
                          Text(
                            'Log in with Facebook',
                            style: wbuttonWhiteTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/google.png',
                            height: 25.0,
                            fit: BoxFit.fitHeight,
                          ),
                          widthSpace,
                          Text(
                            'Log in with Google',
                            style: buttonBlackTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }
}
