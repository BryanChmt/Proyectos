import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:seguridad_policial/models/checkbox.dart';

class Imputado extends StatefulWidget {
  final TextEditingController rasgosfisicos = TextEditingController();
  final TextEditingController vestimenta = TextEditingController();
  //colocar
  final TextEditingController nombre = TextEditingController();
  final TextEditingController cedula = TextEditingController();
  final TextEditingController edad = TextEditingController();
  final TextEditingController nacionalidad = TextEditingController();
  final TextEditingController fechanacimiento = TextEditingController();
  final TextEditingController conocidocomo = TextEditingController();
  final TextEditingController horaaprehencion = TextEditingController();
  final TextEditingController firma = TextEditingController();
  final TextEditingController telefono = TextEditingController();

  bool checkboxyes = false;
  bool checkboxno = false;
  bool entendidossi = false;
  bool entendidosno = false;
  bool fimarsi = false;
  bool firmarno = false;

  final hombre = [
    CheckBoxState(title: 'M', id: 1),
  ];

  final mujer = [
    CheckBoxState(title: 'F', id: 2),
  ];

  var selecteditems = [];

  @override
  _ImputadoState createState() => _ImputadoState();
}

class _ImputadoState extends State<Imputado> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width * 0.90,
          color: Color(0XFF29324c),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Imputado agregado',
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: textforms('NOMBRE'),
                  ),
                  Flexible(
                    flex: 2,
                    child: textforms('CEDULA O PASAPORTE'),
                  ),
                  Flexible(flex: 2, child: _checked())
                ],
              ),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: textforms(
                      'EDAD',
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: textforms(
                      'NACIONALIDAD',
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: textforms(
                      'FECHA DE NACIMIENTO',
                    ),
                  ),
                ],
              ),
              textforms(
                'TELEFONOS:CASA DE HABITACIÓN:',
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: textforms(
                      'Conocido como:',
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: textforms('Hora de Aprehensión'),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 8, right: 8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _autoSize(
                'Se indican principales derechos:\n1)Abstenerse a declarar\n2)Contar con un abogado defensor\n3)Conocer el motivo de su Aprehensión',
                4,
                20.0,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 4.0),
          child: Row(
            children: [
              Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0, right: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          children: [
                            _autoSize('Aprehendido:', 1, 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _autoSize('SI', 1, 18.0),
                                Checkbox(
                                  value: widget.checkboxyes,
                                  onChanged: (bool value) {
                                    setState(() {
                                      widget.checkboxyes = value;
                                    });
                                  },
                                ),
                                _autoSize('NO', 1, 18.0),
                                Checkbox(
                                  value: widget.checkboxno,
                                  onChanged: (bool value) {
                                    setState(() {
                                      widget.checkboxno = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3.0, left: 4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: [
                          _autoSize('Entendidos:', 1, 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _autoSize('SI', 1, 18.0),
                              Checkbox(
                                value: widget.entendidossi,
                                onChanged: (bool value) {
                                  setState(() {
                                    widget.entendidossi = value;
                                  });
                                },
                              ),
                              _autoSize('NO', 1, 18.0),
                              Checkbox(
                                value: widget.entendidosno,
                                onChanged: (bool value) {
                                  setState(() {
                                    widget.entendidosno = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 4.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        TextFormField(),
                        _autoSize('Firma', 1, 20),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        _autoSize('No quiso firmar', 1, 20.0),
                        Checkbox(
                          value: widget.fimarsi,
                          onChanged: (bool value) {
                            setState(() {
                              widget.fimarsi = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                      child: Column(
                    children: [
                      _autoSize('No sabe firmar', 1, 20.0),
                      Checkbox(
                        value: widget.firmarno,
                        onChanged: (bool value) {
                          setState(() {
                            widget.firmarno = value;
                          });
                        },
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
        Row(
          children: [
            Flexible(
              child: textboxgrandes(
                  context, 'Rasgos Físicos', 3, widget.rasgosfisicos),
            ),
            
            Flexible(
                child: textboxgrandes(
                    context, 'Vestimenta', 3, widget.vestimenta))
          ],
        )
      ],
    );
  }

  _checked() {
    return Container(
      height: 40.0,
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: ListView(
              children: [...widget.hombre.map(bodySingle).toList()],
            ),
          ),
          Flexible(
            flex: 2,
            child: ListView(
              children: [...widget.mujer.map(bodySingle).toList()],
            ),
          ),
        ],
      ),
    );
  }

  Widget bodySingle(CheckBoxState checkbox) {
    return CheckboxListTile(
        value: checkbox.value,
        controlAffinity: ListTileControlAffinity.platform,
        title: Text(checkbox.title),
        activeColor: Color(0xFF2464ec),
        onChanged: (bool value) {
          setState(() {
            // selecteditems.clear();
            checkbox.value = value;

            if (checkbox.value == true) {
              widget.selecteditems.add(checkbox.id);
            } else {
              widget.selecteditems.forEach((element) {
                print(element);
                if (checkbox.id == element) {
                  widget.selecteditems.remove(element);
                }
              });
            }
          });
        });
  }

  Widget textboxgrandes(BuildContext context, String data, int lines,
      TextEditingController controllerbox) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:4.0,vertical: 8.0),
      child: Container(
        width: size.width * 0.50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _autoSize(data, 1, 20.0),
            const SizedBox(height: 4.3),
            TextFormField(
              controller: controllerbox,
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
      ),
    );
  }

  Widget textforms(String dato) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        style: TextStyle(fontSize: 20.0),
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
}
