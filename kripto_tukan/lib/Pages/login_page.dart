import 'package:flutter/material.dart';
import 'package:kripto_tukan/widgets/login_content.dart';

class CustomLogin extends StatelessWidget {
  const CustomLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            
        decoration: BoxDecoration(
                image: DecorationImage(
              image: ExactAssetImage('assets/fondo.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          Center(
            child: Custom(),
          )
        ],
      ),
    );
  }
}
