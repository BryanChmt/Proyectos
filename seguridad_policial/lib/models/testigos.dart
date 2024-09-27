import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:seguridad_policial/models/checkbox.dart';

class Testigos extends StatefulWidget {
  //controllers
  final TextEditingController nombre = TextEditingController();
  final TextEditingController cedula = TextEditingController();
  final TextEditingController textboxgrande = TextEditingController();
  final TextEditingController casahabitacion = TextEditingController();
  final TextEditingController trabajo = TextEditingController();
  final TextEditingController celular = TextEditingController();
  final TextEditingController profesion = TextEditingController();
  final TextEditingController firma = TextEditingController();
  final TextEditingController correo = TextEditingController();

  final hombre = [
    CheckBoxState(title: 'M', id: 1),
  ];

  final mujer = [
    CheckBoxState(title: 'F', id: 2),
  ];

  var selecteditems = [];
  @override
  _TestigosState createState() => _TestigosState();
}

class _TestigosState extends State<Testigos> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(children: [
      Container(
        width: size.width * 0.90,
        color: Color(0XFF29324c),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Testigo agregado',
            style: TextStyle(color: Colors.white, fontSize: 25.0),
          ),
        ),
      ),
      Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  textforms(
                    'NOMBRE',widget.nombre
                  ),
                  
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: textforms(
                'CEDULA O PASAPORTE',widget.cedula
              ),
            ),
            Flexible(flex: 2, child: _checked())
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: textboxgrandes(context, 'DIRECCIÓN EXACTA', 3),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: _autoSize('TELEFONOS:', 1, 20.0),
        ),
        Row(
          children: [
            Flexible(
              flex: 2,
              child: textforms(
                'CASA DE HABITACIÓN:',widget.casahabitacion
              ),
            ),
            Flexible(
              flex: 2,
              child: textforms(
                'Trabajo:',widget.trabajo
              ),
            ),
            Flexible(
              flex: 2,
              child: textforms(
                'celular',widget.celular
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              flex: 2,
              child: textforms(
                'Profesión u Oficio:',widget.profesion
              ),
            ),
            Flexible(
              flex: 2,
              child: textforms(
                'Firma:',widget.firma
              ),
            ),
            Flexible(
              flex: 2,
              child: textforms(
                'Correo Electrónico',widget.correo
              ),
            ),
          ],
        )
      ]))
    ]);
  }

    Widget textboxgrandes(BuildContext context, String data, int lines,
    ) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _autoSize(data, 1, 20.0),
          const SizedBox(height: 4.3),
          TextFormField(
            controller: widget.textboxgrande,
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

  Widget textforms(String dato, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.all(4.0),
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

  Widget _autoSize(String data, int lines, double size) {
    return AutoSizeText(
      data,
      maxLines: lines,
      style: TextStyle(
        fontSize: size,
      ),
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
}
