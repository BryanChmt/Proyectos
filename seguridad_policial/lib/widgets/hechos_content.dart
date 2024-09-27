import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:seguridad_policial/models/checkbox.dart';
import 'package:seguridad_policial/models/asistidosModel.dart';
import 'package:seguridad_policial/models/oficialesModel.dart';
import 'package:seguridad_policial/pages/manifestacion.dart';

class ContentHechos extends StatefulWidget {  
  List<Oficiales> listOficiales = [];
  List<String> dataOficiales = [];

  List<Asistidos> listAsistidos = [];
  List<String> dataAsistidos = [];

  @override
  _ContentHechosState createState() => _ContentHechosState();
}

class _ContentHechosState extends State<ContentHechos> {

  addOficial() {
    if (widget.dataOficiales.length != 0) {
      widget.dataOficiales = [];
      widget.listOficiales = [];
      print('if');
    }
    setState(() {});
    if (widget.listOficiales.length >= 5) {
      return;
    }
    widget.listOficiales.add(new Oficiales());
  }

  addAsistidos() {
    if (widget.dataAsistidos.length != 0) {
      widget.dataAsistidos = [];
      widget.listAsistidos = [];
      print('if');
    }
    setState(() {});
    if (widget.listAsistidos.length >= 5) {
      return;
    }
    widget.listAsistidos.add(new Asistidos());
  }

  @override
  void initState() {
    super.initState();
    addOficial();
    addAsistidos();
  }

  submitData() {
    widget.dataOficiales = [];

    //data de listas
    //widget.listOficiales.forEach((widget) => widget.dataOficiales.add(widget.oficiales));

    setState(() {});
    print(widget.dataOficiales);
  }

  final _formKey = GlobalKey<FormState>();

  //checkbox
  bool checksi = false;
  bool checkno = false;
  final acep = [
    CheckBoxState(title: 'Si', id: 1),
  ];
  final neg = [
    CheckBoxState(title: 'No', id: 2),
  ];
  var selecteditems = [];

  //controllers
  TextEditingController _descripcionHechos = TextEditingController();
  TextEditingController _diligenciasPoli = TextEditingController();
  TextEditingController _asesor = TextEditingController();

  TextEditingController _expediente = TextEditingController();
  TextEditingController _fechadenotif = TextEditingController();
  TextEditingController _fechaenquefuenotif = TextEditingController();

  String alerta = "911";

//     enviar() async {
//     //asignacion de variables
//     Map<String, dynamic> info = await _savehechos.save_hechos(
//       _descripcionHechos.text,
//     _diligenciasPoli.text,
//        _asesor.text,
//       _numero.text,
//       _expediente.text,
//       _fechadenotif.text,
//       _fechaenquefuenotif.text,
//       alerta,
//       invol,
//       oficiales
//     );

//     print(info);
//   }

// final _savehechos = new SaveHechos();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
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
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'DESCRIPCIÓN DE HECHOS',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22.0),
                                ),
                              ],
                            )),
                          )),
                      const SizedBox(height: 20.0),
                      _textboxgrandes('', 8, _descripcionHechos),
                      const SizedBox(height: 20.0),
                      Container(
                          width: size.width * 0.90,
                          decoration: BoxDecoration(
                            color: Color(0XFF29324c),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'DILIGENCIAS POLICIALES',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22.0),
                                ),
                              ],
                            )),
                          )),
                      const SizedBox(height: 20.0),
                      _textboxgrandes('', 10, _diligenciasPoli),
                      const SizedBox(height: 20.0),
                      Container(
                          width: size.width * 0.90,
                          decoration: BoxDecoration(
                            color: Color(0XFF29324c),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'ASPECTOS ADMINISTRATIVOS',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22.0),
                                ),
                              ],
                            )),
                          )),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Flexible(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: aspectos(),
                              )),
                              Flexible(
                                  child:
                                      _textforms('Asesor Legal(MSP)', _asesor)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          onPressed: addAsistidos,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: _autoSize(
                                'Agregar Asistidos', 1, 18, Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.yellow[900])),
                        ),
                      ),
                      involucrados(),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 4, left: 20, right: 8),
                        child: medidasproteccion(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          onPressed: addOficial,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: _autoSize(
                                'Agregar Oficial', 1, 18, Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.yellow[900])),
                        ),
                      ),
                      datos()
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              FittedBox(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 15.0),
                      child: _autoSize('Guardar', 1, 20.0, Colors.white),
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
                              builder: (context) => ManifestPage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 15.0),
                      child: _autoSize('Siguiente', 1, 20.0, Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0XFF29324c)),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget medidasproteccion() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffc7cdd4),
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _autoSize(
                    'En caso de Violencia Domestica:\nMedidas de Protección Vigentes:',
                    4,
                    20,
                    Colors.black),
                _autoSize('SI', 1, 18.0, Colors.black),
                Checkbox(
                  value: checksi,
                  onChanged: (bool value) {
                    setState(() {
                      checksi = value;
                    });
                  },
                ),
                _autoSize('NO', 1, 18.0, Colors.black),
                Checkbox(
                  value: checkno,
                  onChanged: (bool value) {
                    setState(() {
                      checkno = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Row(
            
            children: [
              Flexible(child: _autoSize('Expediente N°:', 1, 20, Colors.black)),
              Flexible(
                  child: TextFormField(
                controller: _expediente,
              )),
              Flexible(
                  child:
                      _autoSize('Fecha de Notificación:', 2, 20, Colors.black)),
              Flexible(
                  child: TextFormField(
                controller: _fechadenotif,
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:8.0),
            child: Column(
             
              children: [
                _autoSize(
                    'Fecha en que fue notificado personalmente el agresor',
                    1,
                    20,
                    Colors.black),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: _fechaenquefuenotif,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget aspectos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '¿Quién dio la Alerta?',
          style: TextStyle(fontSize: 20.0),
        ),
        const SizedBox(
          height: 10.0,
        ),
        DropdownButtonFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xffc7cdd4),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          iconSize: 15.0,
          style: TextStyle(fontSize: 18.0, color: Colors.black),
          value: alerta,
          onChanged: (newValue) {
            setState(
              () {
                alerta = newValue;
              },
            );
          },
          items: [
            '911',
            'Comunicaciones',
            'Unidad Policial',
            'Denuncia',
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

  Widget involucrados() {
    return Container(
        child: Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: widget.listAsistidos.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: widget.listAsistidos[index],
            );
          },
        ),
      ],
    ));
  }

  Widget datos() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'OFICIALES QUE LE ASISTEN',
            style: TextStyle(fontSize: 18.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
              child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: widget.listOficiales.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: widget.listOficiales[index],
                  );
                },
              ),
            ],
          )),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  Widget _autoSize(String data, int lines, double size, Color color) {
    return AutoSizeText(
      data,
      maxLines: lines,
      style: TextStyle(fontSize: size, color: color),
    );
  }

  Widget _textboxgrandes(
      String data, int lines, TextEditingController controller) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.70,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          border: OutlineInputBorder(),
        ),
        maxLines: lines,
      ),
    );
  }

  Widget _textforms(String dato, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.only(top: 4.0),
      child: TextFormField(
        controller: controller,
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
}
