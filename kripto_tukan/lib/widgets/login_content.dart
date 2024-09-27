import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kripto_tukan/Pages/register_page.dart';
import 'package:kripto_tukan/models/password_controller.dart';
import 'package:kripto_tukan/widgets/register_content.dart';
import 'package:kripto_tukan/widgets/responsive.dart';


class Custom extends StatelessWidget {
  const Custom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Responsive(
       mediumScreen: LoginDesktop(),
       smallScreen: LoginMobile (),
       largeScreen: LoginDesktop(),
      ),
    );
  }
}

class LoginDesktop extends StatefulWidget {
  LoginDesktop({Key key}) : super(key: key);

  @override
  _LoginDesktopState createState() => _LoginDesktopState();
}

class _LoginDesktopState extends State<LoginDesktop> {
    final _formKey = GlobalKey<FormState>();
  bool check = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
  
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return Form(
      key: _formKey,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                  color: Color(0Xff1e1c3c),
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5.0,
                      offset: Offset(0.0, 3.0),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'Inicie sesión con su cuenta de',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  Image(image: AssetImage('assets/logo tukan.png'),height: 150.0,),
                  const SizedBox(height: 20.0),
                  _buttonregister(context),
                  const SizedBox(height: 10.0),
                  _correovalidator(),
                  SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child:PasswordField( controller: _passwordController,),
                  ),
                  const SizedBox(height: 15.0),
                  bodySingle(),
                  const SizedBox(height: 15.0),
                  _botonIngresa(),
                  const SizedBox(height: 20.0),
                  _buttonforgot('¿Olvidaste tu contraseña?', context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 Widget _correovalidator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          hintText: 'Correo electrónico',
          prefixIcon: Icon(
            Icons.person_outline_outlined,
            color: Color(0xFF0dba0e),
          ),
        ),
        // validator: (String value) {
        //   if (value.isEmpty) {
        //     return "* Required";
        //   } else if (!value.contains('@')) {
        //     return "No es un correo electronico valido";
        //   } else if (value.contains('@')) {
        //     _passwordController.clear();
        //     Navigator.of(context).push(
        //       MaterialPageRoute(
        //         builder: (BuildContext context) {
        //           return Facturacion();
        //         },
        //       ),
        //     );
        //   } else
        //     return null;
        // },
      ),
    );
  }

  Widget _botonIngresa() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0dba0e)),
      ),
      onPressed: () {
        // if (_formKey.currentState.validate()) {
        //   print("Validated");
        // } else {
        //   print("Not Validated");
        // }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        child: Text(
          'INICIAR SESIÓN',
          textAlign: TextAlign.center,
          style: TextStyle( 
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  Widget _buttonforgot(String texto, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.lock_outline_rounded,color: Colors.white,size: 18.0,),
        TextButton(
          onPressed: () => {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => ForgotPage())),
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              texto,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buttonregister(BuildContext context) {
    return Column(
      children: [
        Text('¿Nuevo en CryptoTukan?',style: TextStyle(color: Colors.white,fontSize: 16.0),),
        TextButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterPage(),
              ),
            ),
          },
          child: Text(
            'Registrate aquí',
            style: TextStyle(
              color: Color(0xFF0dba0e),
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget bodySingle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            value: check,
            activeColor: Color(0xFF0dba0e),
            onChanged: (value) {
              setState(() {
                check = value;
              });
            }),
             AutoSizeText(              
          'Mantenerme conectado en el dispositivo',
          maxLines: 2,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
  
}

class LoginMobile  extends StatefulWidget {
  @override
  __LoginMobileState createState() => __LoginMobileState();
}

class __LoginMobileState extends State<LoginMobile > {
  final _formKey = GlobalKey<FormState>();
  bool check = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width * 0.85,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                  color: Color(0Xff1e1c3c),
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5.0,
                      offset: Offset(0.0, 3.0),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'Inicie sesión con su cuenta de',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  Image(image: AssetImage('assets/logo tukan.png'),height: 150.0,),
                  const SizedBox(height: 20.0),
                  _buttonregister(context),
                  const SizedBox(height: 10.0),
                  _correovalidator(),
                  SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child:PasswordField( controller: _passwordController,),
                  ),
                  const SizedBox(height: 15.0),
                  bodySingle(),
                  const SizedBox(height: 15.0),
                  _botonIngresa(),
                  const SizedBox(height: 20.0),
                  _buttonforgot('¿Olvidaste tu contraseña?', context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _correovalidator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          hintText: 'Correo electrónico',
          prefixIcon: Icon(
            Icons.person_outline_outlined,
            color: Color(0xFF0dba0e),
          ),
        ),
        // validator: (String value) {
        //   if (value.isEmpty) {
        //     return "* Required";
        //   } else if (!value.contains('@')) {
        //     return "No es un correo electronico valido";
        //   } else if (value.contains('@')) {
        //     _passwordController.clear();
        //     Navigator.of(context).push(
        //       MaterialPageRoute(
        //         builder: (BuildContext context) {
        //           return Facturacion();
        //         },
        //       ),
        //     );
        //   } else
        //     return null;
        // },
      ),
    );
  }

  Widget _botonIngresa() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF0dba0e)),
      ),
      onPressed: () {
        // if (_formKey.currentState.validate()) {
        //   print("Validated");
        // } else {
        //   print("Not Validated");
        // }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        child: Text(
          'INICIAR SESIÓN',
          textAlign: TextAlign.center,
          style: TextStyle( 
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  Widget _buttonforgot(String texto, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.lock_outline_rounded,color: Colors.white,size: 18.0,),
        TextButton(
          onPressed: () => {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => ForgotPage())),
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              texto,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buttonregister(BuildContext context) {
    return Column(
      children: [
        Text('¿Nuevo en CryptoTukan?',style: TextStyle(color: Colors.white,fontSize: 16.0),),
        TextButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterPage(),
              ),
            ),
          },
          child: Text(
            'Registrate aquí',
            style: TextStyle(
              color: Color(0xFF0dba0e),
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget bodySingle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            value: check,
            activeColor: Color(0xFF0dba0e),
            onChanged: (value) {
              setState(() {
                check = value;
              });
            }),
             AutoSizeText(              
          'Mantenerme conectado en el dispositivo',
          maxLines: 2,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
