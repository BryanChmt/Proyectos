import 'package:flutter/material.dart';




class Pantalla extends StatelessWidget {
  const Pantalla({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(     
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,         
          children: [
            _texto('¡PRONTO', Color(0xFF6fcc28), 50.0, 'trial',FontWeight.normal ),
            _texto('DESPEGAMOS!', Color(0xFF6fcc28), 50.0, 'trial',FontWeight.normal ),
            _texto('Empresa de Blockchain', Colors.black, 20.0, 'light',FontWeight.normal),
            _texto('Minas de Crypto', Colors.black, 20.0, 'light',FontWeight.normal),
            _texto('CON ENERGÍA', Color(0xFF6fcc28), 45.0, 'trial',FontWeight.normal ), 
            _texto('RENOVABLE', Color(0xFF6fcc28), 45.0, 'trial',FontWeight.normal ), 
            _texto('Venta de Rigs', Colors.black, 15.0, 'ultra',FontWeight.w600),
            _texto('Venta de Planes de Minería', Colors.black, 15.0, 'ultra',FontWeight.w600),
            _texto('Alquiler espacio en Datacenter', Colors.black, 15.0, 'ultra',FontWeight.w600)
          ],
        ),
      ),
    );
  }
  Widget _texto (String dato,Color color,double size,String family,FontWeight letra){
    return Text(dato,style: TextStyle(color: color,fontSize: size,fontFamily: family,fontWeight: letra ),);
  }
}