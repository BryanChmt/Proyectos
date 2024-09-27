import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seguridad_policial/models/imputados.dart';
import 'package:seguridad_policial/models/ofendidos.dart';
import 'package:seguridad_policial/models/testigos.dart';
import 'package:seguridad_policial/pages/descripcion_hechos.dart';

class ContentInforme extends StatefulWidget {
  @override
  _ContentInformeState createState() => _ContentInformeState();
}

class _ContentInformeState extends State<ContentInforme> {
  final _formKey = GlobalKey<FormState>();
  //listas
  List<Imputado> listDynamic = [];
  List<Ofendidos> listofendidos = [];
  List<Testigos> listtestigos = [];

  //Data
  List<String> imputadosdata = [];
  List<String> testigodata = [];
  List<String> ofendidodata = [];

  addimputado() {
    if (imputadosdata.length != 0) {
      imputadosdata = [];
      listDynamic = [];
      print('if');
    }
    setState(() {});
    if (listDynamic.length >= 5) {
      return;
    }
    listDynamic.add(new Imputado());
  }

  addtestigo() {
    if (testigodata.length != 0) {
      testigodata = [];
      listtestigos = [];
      print('if');
    }
    setState(() {});
    if (listtestigos.length >= 5) {
      return;
    }
    listtestigos.add(new Testigos());
  }

  addofendido() {
    if (ofendidodata.length != 0) {
      ofendidodata = [];
      listofendidos = [];
      print('if');
    }
    setState(() {});
    if (listofendidos.length >= 5) {
      return;
    }
    listofendidos.add(new Ofendidos());
  }
 

  submitData() {
    imputadosdata = [];
    testigodata = [];
    ofendidodata = [];

    //data de listas
    listDynamic.forEach((widget) => imputadosdata.add(widget.vestimenta.text));
    listDynamic.forEach((widget) => imputadosdata.add(widget.rasgosfisicos.text));
    listtestigos.forEach((widget) => testigodata.add(widget.correo.text));
    setState(() {});
    print(imputadosdata);
  }

  //Dropdown controllers
  String provinciadrop = "provincia";
  String cantondrop = "canton";
  String distritodrop = "distrito";
  String tipolugardrop = "tipolugar";

  //controllers
  TextEditingController _direccionsuceso = TextEditingController();
  TextEditingController _fechasuceso = TextEditingController();
  TextEditingController _horasuceso = TextEditingController();
  TextEditingController _avenida = TextEditingController();

  //   enviar() async {
  //   //asignacion de variables
  //   Map<String, dynamic> info = await _saveinforme.save_informe(
  //     provinciadrop,
  //     cantondrop,
  //     distritodrop,
  //     tipolugardrop,
  //     _direccionsuceso.text,
  //     _fechasuceso.text,
  //     _horasuceso.text,
  //     _avenida.text,
  //   );

  //   print(info);
  // }

// final _saveinforme = new SaveInforme();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.only(left: 15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Container(
                    width: size.width * 0.90,
                    decoration: BoxDecoration(
                      color: Color(0xffc7cdd4),
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                            width: size.width * 0.90,
                            decoration: BoxDecoration(
                              color: Color(0XFF29324c),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                'UBICACIÓN Y SITIO DEL SUCESO',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24.0),
                              )),
                            )),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 2,
                                child: _content(
                                    'Fecha del Suceso',
                                    TextInputType.name,
                                    FilteringTextInputFormatter
                                        .singleLineFormatter,
                                    _fechasuceso),
                              ),
                              Flexible(
                                flex: 2,
                                child: _content(
                                    'Hora del Suceso',
                                    TextInputType.name,
                                    FilteringTextInputFormatter
                                        .singleLineFormatter,
                                    _horasuceso),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Flexible(flex: 2, child: _provincia()),
                              Flexible(flex: 2, child: _canton()),
                              Flexible(flex: 2, child: _distrito()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: Column(
                                  children: [
                                    _content(
                                        'Barrio(Avenida-Calle)',
                                        TextInputType.emailAddress,
                                        FilteringTextInputFormatter
                                            .singleLineFormatter,
                                        _avenida),
                                    _tipolugar()
                                  ],
                                ),
                              ),
                              Flexible(
                                child: _textboxgrandes(
                                    'Dirección exacta del sitio del suceso', 4),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                            width: size.width * 0.90,
                            decoration: BoxDecoration(
                              color: Color(0XFF29324c),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                'IMPUTADOS (a)',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24.0),
                              )),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ElevatedButton(
                            onPressed: addimputado,
                            child: _autoSize('Agregar Imputados', 1, 15),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.yellow[900])),
                          ),
                        ),
                        Container(
                            child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                            
                              itemCount: listDynamic.length,
                              itemBuilder: (context, index) {
                                return listDynamic[index];
                              },
                            ),
                          ],
                        )),
                        Container(
                            width: size.width * 0.90,
                            decoration: BoxDecoration(
                              color: Color(0XFF29324c),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                'OFENDIDOS(a)',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24.0),
                              )),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ElevatedButton(
                            onPressed: addofendido,
                            child: _autoSize('Agregar Ofendidos', 1, 15),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.yellow[900])),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              ListView.builder(
                                  itemCount: listofendidos.length,
                                  shrinkWrap: true,
                                
                                  itemBuilder: (context, index) {
                                    return listofendidos[index];
                                  }),
                            ],
                          ),
                        ),
                        Container(
                            width: size.width * 0.90,
                            decoration: BoxDecoration(
                              color: Color(0XFF29324c),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                'TESTIGOS',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24.0),
                              )),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ElevatedButton(
                            onPressed: addtestigo,
                            child: _autoSize('Agregar Testigos', 1, 15),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.yellow[900])),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              ListView.builder(
                                  itemCount: listtestigos.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return listtestigos[index];
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        submitData();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 15.0),
                        child: _autoSize('Guardar', 1, 20.0),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0XFF29324c)),
                      ),
                    ),
                    const SizedBox(width: 30.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HechosPage()));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 15.0),
                        child: _autoSize('Siguiente', 1, 20.0),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0XFF29324c)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _content(String dato, TextInputType tipo,
      FilteringTextInputFormatter valid, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        controller: controller,
        inputFormatters: <TextInputFormatter>[valid],
        keyboardType: tipo,
        style: TextStyle(fontSize: 18.0),
        decoration: InputDecoration(
            labelText: dato,
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
  }

  Widget _autoSize(String data, int lines, double size) {
    return AutoSizeText(
      data,
      maxLines: lines,
      style: TextStyle(
        fontSize: size,
      
      ),
    );
  }

  Widget _provincia() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _autoSize('Provincia:', 2, 20.0),
        DropdownButtonFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xffc7cdd4),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          iconSize: 15.0,
          style: TextStyle(fontSize: 15.0, color: Colors.black),
          value: provinciadrop,
          onChanged: (newValue) {
            setState(
              () {
                provinciadrop = newValue;
              },
            );
          },
          items: [
            'provincia',
            'No',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _canton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _autoSize('Cantón:', 2, 20.0),
          DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffc7cdd4),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            iconSize: 15.0,
            style: TextStyle(fontSize: 15.0, color: Colors.black),
            value: cantondrop,
            onChanged: (newValue) {
              setState(
                () {
                  cantondrop = newValue;
                },
              );
            },
            items: [
              'canton',
              'No',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _distrito() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _autoSize('Distrito:', 2, 20.0),
        DropdownButtonFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xffc7cdd4),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          iconSize: 15.0,
          style: TextStyle(fontSize: 15.0, color: Colors.black),
          value: distritodrop,
          onChanged: (newValue) {
            setState(
              () {
                distritodrop = newValue;
              },
            );
          },
          items: [
            'distrito',
            'No',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _tipolugar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _autoSize('Tipo de Lugar:', 2, 20.0),
          DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffc7cdd4),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            iconSize: 15.0,
            style: TextStyle(fontSize: 15.0, color: Colors.black),
            value: tipolugardrop,
            onChanged: (newValue) {
              setState(
                () {
                  tipolugardrop = newValue;
                },
              );
            },
            items: [
              'tipolugar',
              'No',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _textboxgrandes(String data, int lines) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _autoSize(data, 1, 20.0),
   
          TextFormField(
            style: TextStyle(fontSize: 20),
            controller: _direccionsuceso,
            decoration: InputDecoration(
            
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              border: OutlineInputBorder(),
            ),
            maxLines: lines,
          ),
        ],
      ),
    );
  }
}
