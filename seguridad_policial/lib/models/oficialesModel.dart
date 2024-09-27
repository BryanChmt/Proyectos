import 'package:flutter/material.dart';

class Oficiales extends StatefulWidget {
  String oficiales = "Oficial 1";

  @override
  _OficialesState createState() => _OficialesState();
}

class _OficialesState extends State<Oficiales> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffc7cdd4),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      iconSize: 15.0,
      style: TextStyle(fontSize: 15.0, color: Colors.black),
      value: widget.oficiales,
      onChanged: (newValue) {
        setState(
          () {
            widget.oficiales = newValue;
          },
        );
      },
      items: [
        'Oficial 1',
        'Oficial 2',
        'Oficial 3',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
