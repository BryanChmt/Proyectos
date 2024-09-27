import 'package:flutter/material.dart';
import 'package:seguridad_policial/widgets/hechos_content.dart';
typedef OnDelete();
class Asistidos extends StatefulWidget {
  String invol = "Fuerza Pública";
  TextEditingController _numero = TextEditingController();
  @override
  _AsistidosState createState() => _AsistidosState();
}

class _AsistidosState extends State<Asistidos> {

  void asist = ContentHechos(); 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
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
                      value: widget.invol,
                      onChanged: (newValue) {
                        setState(
                          () {
                            widget.invol = newValue;
                          },
                        );
                      },
                      items: [
                        'Fuerza Pública',
                        'Cruz Roja',
                        'Bomberos',
                        'O.I.J',
                        'Tránsito',
                        'Otros',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                     
                  ],
                ),
              ),
            ),
            Flexible(child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                _textforms('Número de Móvil', widget._numero),
              ],
            )),
          ],
        ),
      ),
    );
  }

  //void removeItem(int index){
  //  final remove = asist;


  //}


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
