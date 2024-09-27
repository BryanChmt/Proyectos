import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        children: <Widget>[_superior(), _lado(), _horario()],
      ),
    );
  }
}

Widget _superior() {
  return Container(
    child: Row(
      children: <Widget>[
        Icon(
          Icons.place_outlined,
          color: Colors.white,
        ),
        _texto('Boquerón,Cartago,Costa Rica')
      ],
    ),
  );
}

Widget _lado() {
  return Container(
    padding: EdgeInsets.only(left: 20),
    child: Row(
      children: <Widget>[
        Icon(
          Icons.phone,
          color: Colors.white,
        ),
        _texto('8752-1414')
      ],
    ),
  );
}

Widget _horario() {
  return Container(
    padding: EdgeInsets.only(left: 20),
    child: Row(
      children: <Widget>[
        Icon(
          Icons.timelapse_rounded,
          color: Colors.white,
        ),
        _texto('Martes a Domingo bajo reservación')
      ],
    ),
  );
}

Widget _texto(String texto) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(texto, style: TextStyle(color: Colors.white, fontSize: 10)),
    ),
  );
}
