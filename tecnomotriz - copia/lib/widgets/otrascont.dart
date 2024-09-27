  
  import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
  class OtrasCont extends StatefulWidget {
    const OtrasCont({Key key}) : super(key: key);

  @override
  _OtrasContState createState() => _OtrasContState();
}

class _OtrasContState extends State<OtrasCont> {
    @override
    Widget build(BuildContext context) {
        String dropdowndcondicion = "NUEVA";
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _text(
                '¿La pieza no se encuentra en la vista? Agreguela con la siguiente información',
                25.0,
                Colors.black),
            const SizedBox(height: 30.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _text('Condición de la pieza:', 20.0, Colors.black),
                const SizedBox(height: 8.0),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  iconSize: 20.0,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black
                  ),
                  value: dropdowndcondicion,
                  onChanged: (val) {
                    setState(
                      () {
                        dropdowndcondicion = val;
                      },
                    );
                  },
                  items: [
                    'NUEVA',
                    'REPARADA',
                    'ESFUME',
                  ].map<DropdownMenuItem<String>>((String val) {
                    return DropdownMenuItem(
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nombre de la pieza:',style: TextStyle(color: Colors.black,fontSize: 20.0)),
                const SizedBox(height: 8.0),
                TextFormField(
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  decoration: InputDecoration(
                    helperText: 'Por favor proporcione nombre de la pieza',
                    helperStyle: TextStyle(fontSize: 15.0),
                    hintText: 'Ej:Marco Radiador',
                    hintStyle: TextStyle(fontSize: 18.0),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF0944ba))),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Valor de la pieza:',style: TextStyle(color: Colors.black,fontSize: 20.0)),
                const SizedBox(height: 8.0),
                TextFormField(
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 18.0),
                    helperText: 'Por favor proporcione el valor de la pieza',
                    helperStyle: TextStyle(fontSize: 15.0),
                    hintText: 'Ej: 1.5',
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF0944ba))),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF0944ba)),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Agregar',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                ))
          ],
        ),
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
  
  
  
 