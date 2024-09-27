import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(width);
    return Container(
        color: Colors.red[900],
        width: double.infinity,
        child: (width > 750)
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  containerIzquierdo(),
                  // SizedBox(
                  //   width: 80,
                  // ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      button(),
                      containerCentral(),
                    ],
                  ),

                  // SizedBox(
                  //   width: 80,
                  // ),
                  containerDerecha()
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button(),
                  containerCentral(),

                  // SizedBox(
                  //   width: 80,
                  // ),
                  containerIzquierdo(),
                  // SizedBox(
                  //   width: 80,
                  // ),
                  containerDerecha()
                ],
              ));
  }
}

Widget button() {
  return Container(
    margin: EdgeInsets.all(10.0),
    child: FloatingActionButton(
      child: Icon(
        Icons.arrow_drop_up_sharp,
        color: Colors.white,
      ),
      backgroundColor: Color(0xFF151c26),
      foregroundColor: Colors.white,
      onPressed: () {},
    ),
  );
}

Widget containerCentral() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [autoTextTitle('Seguínos'), FaIcon(FontAwesomeIcons.instagram)],
    ),
  );
}

Widget containerIzquierdo() {
  return Container(
    width: 300,
    height: 300,
    padding: EdgeInsets.only(bottom: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        autoTextTitle('Acerca de'),
        SizedBox(height: 10),
        autoTextBody(
            'Fundado en medio de la pandemia del 2020, El Rancho de Oki nace como una pasión entre dos hermanos de brindar comida y servicio de calidad al mismo tiempo que compartimos la experiencia de un lugar maravilloso heredado de nuestra familia.')
      ],
    ),
  );
}

Widget containerDerecha() {
  return Container(
    width: 300,
    height: 300,
    padding: EdgeInsets.only(bottom: 20, right: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        autoTextTitle('Contacto'),
        Image(
          image: AssetImage('assets/waze.png'),
          width: 40,
          height: 40,
        ),
        autoTextBody(
            'Dirección: Carretera al Volcán Irazú del Cristo 3km hacia Pacayas.'),
        SizedBox(height: 20),
        autoTextBody('Tel: 8752-1414'),
        SizedBox(height: 15),
        autoTextBody('Horario: Martes a Domingo bajo reservación.')
      ],
    ),
  );
}

AutoSizeText autoTextTitle(String screenType) {
  return AutoSizeText(
    screenType,
    minFontSize: 20,
    maxFontSize: 50,
    maxLines: 1,
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: 'marker',
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 50,
    ),
  );
}

AutoSizeText autoTextBody(String screenType) {
  return AutoSizeText(
    screenType,
    minFontSize: 15,
    maxFontSize: 36,
    maxLines: 12,
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: Colors.white,
      fontSize: 15,
    ),
  );
}
