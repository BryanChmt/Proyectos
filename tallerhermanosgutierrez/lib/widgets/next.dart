import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tallerhermanosgutierrez/pages/facturacion.dart';
import 'package:tallerhermanosgutierrez/widgets/otrascont.dart';
import 'package:tallerhermanosgutierrez/widgets/piezascont.dart';

import 'agregarcont.dart';

class NextContent extends StatefulWidget {
  const NextContent({Key key}) : super(key: key);

  @override
  _NextContentState createState() => _NextContentState();
}

class _NextContentState extends State<NextContent> {
  bool agregar = false;
  bool piezas = false;
  bool otras = true;
  String dropdowndcondicion = "NUEVA";
  int _currentIndex = 0;
  List<Widget> _paginas = [
    AgregarCont(),
    PiezasCont(),
    OtrasCont(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.white,
              width: size.width * 0.85,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Facturacion(),
                                  ),
                                ),
                              },
                              icon: Icon(Icons.arrow_left_sharp),
                              iconSize: 40.0,
                            ),
                            Text('Atrás',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.0),)
                          ],
                        ),
                        Image(
                          image: AssetImage('assets/logo.png'),
                          height: 100.0,
                          width: 200.0,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle( backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red[600],
                          ),),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Guardar',style: TextStyle(fontSize: 16.0)),
                                Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: Colors.grey,
                                  size: 40.0,
                                ),
                              ],
                            ))
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.red[600],
                          width: 2.0,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              color: Colors.red[600],
                            ),
                            width: size.width * 100,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _text('Reparación de partes', 25.0,
                                      Colors.white),
                                  const SizedBox(height: 5.0),
                                  _text(
                                      'Información de las piezas a reparar en el servicio',
                                      15.0,
                                      Colors.grey[300]),
                                ],
                              ),
                            ),
                          ),
                          _paginas[_currentIndex]
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  color: Color(0xFF0944ba),
                ),
                label: 'Agregar Piezas'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.miscellaneous_services_outlined,
                  color: Color(0xFF0944ba),
                ),
                label: 'Piezas'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  color: Color(0xFF0944ba),
                ),
                label: 'Otras Piezas')
          ]),
    );
  }

  Widget _text(String data, double size, Color color) {
    return AutoSizeText(
      data,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
