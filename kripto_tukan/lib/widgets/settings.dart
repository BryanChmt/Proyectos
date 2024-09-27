import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 90.0),
          child: Container(
            width: size.width * 0.85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Color(0Xff1e1c3c),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   _account() ,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 5.0),
                    child: Text(
                      'Configuración del perfil',
                      style: TextStyle(color: Color(0xff39a1ba), fontSize: 18.0),
                    ),
                  ),
                  _content('Detalles del Perfil'),
                  _content('Limites de cuenta'),
                  _content('Configuracion de cuenta'),
                  _content('Seguridad'),
                  _content('Notificaciones'),
             
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _content(String text) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 20.0, fontFamily: 'ultra'),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color(0xff39a1ba),
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _account() {
    return Container(
      height:200.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: AssetImage('assets/account.png'),width: 100,height: 100,),
          Text('correo@dominio.com')
        ],
      ),
    );
  }
}
