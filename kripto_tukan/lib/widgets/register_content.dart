import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:kripto_tukan/Pages/login_page.dart';
import 'package:kripto_tukan/models/password_controller.dart';
import 'package:kripto_tukan/widgets/custom_check.dart';
import 'package:kripto_tukan/widgets/responsive.dart';

class CustomRegister extends StatelessWidget {
  const CustomRegister({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Responsive(
        mediumScreen: Desktop(),
        smallScreen: Mobile(),
        largeScreen: Desktop(),
      ),
    );
  }
}

class Desktop extends StatefulWidget {
  Desktop({Key key}) : super(key: key);

  @override
  _DesktopState createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool suscrib = false;
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
              width: 400,
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
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cree una nueva cuenta de',
                      style: TextStyle(fontSize: 23.0, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10.0),
                    Image(
                      image: AssetImage('assets/horizontal.png'),
                      height: 60,
                    ),
                    const SizedBox(height: 15.0),
                    _correovalidator(),
                    const SizedBox(height: 12.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: PasswordField(
                        controller: _passwordController,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    _confirm(),
                    const SizedBox(height: 12.0),
                    Container(
                        width: 200,
                        child: Column(
                          children: [
                            _custom('Un carácter en minúscula'),
                            _custom('Un carácter en mayúscula'),
                            _custom('8 caracteres como minimo'),
                            _custom('Un número'),
                            _custom('Un carácter especial'),
                            _custom('Las contraseñas coinciden')
                          ],
                        )),
                    const SizedBox(height: 10.0),
                    _politicas(),
                    const SizedBox(height: 10.0),
                    _suscribirse(),
                    const SizedBox(height: 10.0),
                    _botonRegister(),
                    const SizedBox(height: 8.0),
                    _buttonlogin()
                  ],
                ),
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

  Widget _confirm() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: _confirmpassword,
        obscureText: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          hintText: 'Confirmar Contraseña',
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Color(0xFF0dba0e),
          ),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return "* Required";
          } else if (_passwordController.text != _confirmpassword.text) {
            return "Las contraseñas no coinciden";
          } else
            return null;
        },
      ),
    );
  }

  Widget _politicas() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCheckbox(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          style: TextStyle(color: Colors.white),
                          text:
                              'Confirmo que la selección del país es correcta,acepto los'),
                      TextSpan(
                          style: TextStyle(color: Color(0xFF0dba0e)),
                          recognizer: TapGestureRecognizer(),
                          text: 'Términos de servicio')
                    ]),
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          style: TextStyle(color: Colors.white),
                          text:
                              'y doy mi consentimiento para recopila,usar y almacenar mis datos de acuerdo'),
                    ]),
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          style: TextStyle(color: Colors.white),
                          text: 'con nuestra'),
                      TextSpan(
                          style: TextStyle(color: Color(0xFF0dba0e)),
                          recognizer: TapGestureRecognizer(),
                          text: 'Politica de privacidad')
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _suscribirse() {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              activeColor: Colors.green,
              value: suscrib,
              onChanged: (bool value) {
                setState(() {
                  suscrib = value;
                });
              },
            ),
            Text(
              'Suscribase a nuestras noticias y actualizaciones del blog',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget _botonRegister() {
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
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
        child: Text(
          'REGISTRARSE',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  Widget _buttonlogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿Tengo ya una cuenta?',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 11.0,
          ),
        ),
        TextButton(
          onPressed: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CustomLogin())),
          },
          child: Text(
            'Inicia sesión',
            style: TextStyle(
              color: Color(0xFF0dba0e),
              fontWeight: FontWeight.w500,
              fontSize: 11.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _custom(String data) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: CustomCheckbox(),
        ),
        Text(
          data,
          style: TextStyle(color: Colors.white70, fontSize: 12.0),
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}

class Mobile extends StatefulWidget {
  Mobile({Key key}) : super(key: key);

  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool suscrib = false;
  // final content = [
  //   CheckBoxState(title: 'Un carácter en minúscula'),
  //   CheckBoxState(title: 'Un carácter en mayúscula'),
  //   CheckBoxState(title: '8 caracteres como minimo'),
  //   CheckBoxState(title: 'Un número'),
  //   CheckBoxState(title: 'Un carácter especial'),
  //   CheckBoxState(title: 'Las contraseñas coinciden'),
  // ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.85,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          'Cree una nueva cuenta de',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Image(
                        image: AssetImage('assets/horizontal.png'),
                        height: 60,
                      ),
                      const SizedBox(height: 15.0),
                      _correovalidator(),
                      const SizedBox(height: 12.0),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: PasswordField(
                          controller: _passwordController,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      _confirm(),
                      const SizedBox(height: 15.0),
                      Container(
                          width: 200,
                          child: Column(
                            children: [
                              _custom('Un carácter en minúscula'),
                              _custom('Un carácter en mayúscula'),
                              _custom('8 caracteres como minimo'),
                              _custom('Un número'),
                              _custom('Un carácter especial'),
                              _custom('Las contraseñas coinciden')
                            ],
                          )),
                      const SizedBox(height: 10.0),
                      _politicas(),
                      const SizedBox(height: 10.0),
                      _suscribirse(),
                      const SizedBox(height: 10.0),
                      _botonRegister(),
                      const SizedBox(height: 10.0),
                      _buttonlogin()
                    ],
                  ),
                ),
              ),
            ],
          ),
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

  // Widget _checked() {
  //   return Container(
  //     height: 300,
  //     width: 300,
  //     child: ListView(
  //       children: [...content.map(bodySingle).toList()],
  //     ),
  //   );
  // }
  // Widget bodySingle(CheckBoxState checkbox) {
  //   return CheckboxListTile(
  //       value: checkbox.value,
  //       controlAffinity: ListTileControlAffinity.leading,
  //       title: Text(checkbox.title!,style: TextStyle(color: Colors.white,fontSize: 12.0),),
  //       activeColor: Colors.green,
  //       onChanged: (bool? active) {
  //         setState(() {
  //           checkbox.value = active!;
  //         });
  //       });
  // }

  Widget _confirm() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: _confirmpassword,
        obscureText: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          hintText: 'Confirmar Contraseña',
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Color(0xFF0dba0e),
          ),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return "* Required";
          } else if (_passwordController.text != _confirmpassword.text) {
            return "Las contraseñas no coinciden";
          } else
            return null;
        },
      ),
    );
  }

  Widget _politicas() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCheckbox(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          style: TextStyle(color: Colors.white),
                          text:
                              'Confirmo que la selección del país es correcta,acepto los'),
                      TextSpan(
                          style: TextStyle(color: Color(0xFF0dba0e)),
                          recognizer: TapGestureRecognizer(),
                          text: 'Términos de servicio')
                    ]),
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          style: TextStyle(color: Colors.white),
                          text:
                              'y doy mi consentimiento para recopila,usar y almacenar mis datos de acuerdo'),
                    ]),
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          style: TextStyle(color: Colors.white),
                          text: 'con nuestra'),
                      TextSpan(
                          style: TextStyle(color: Color(0xFF0dba0e)),
                          recognizer: TapGestureRecognizer(),
                          text: 'Politica de privacidad')
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _suscribirse() {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              activeColor: Colors.green,
              value: suscrib,
              onChanged: (bool value) {
                setState(() {
                  suscrib = value;
                });
              },
            ),
            Text(
              'Suscribase a nuestras noticias y actualizaciones del blog',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget _botonRegister() {
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
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
        child: Text(
          'REGISTRARSE',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  Widget _buttonlogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿Tengo ya una cuenta?',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 11.0,
          ),
        ),
        TextButton(
          onPressed: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CustomLogin())),
          },
          child: Text(
            'Inicia sesión',
            style: TextStyle(
              color: Color(0xFF0dba0e),
              fontWeight: FontWeight.w500,
              fontSize: 11.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _custom(String data) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: CustomCheckbox(),
        ),
        Text(
          data,
          style: TextStyle(color: Colors.white70, fontSize: 12.0),
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
