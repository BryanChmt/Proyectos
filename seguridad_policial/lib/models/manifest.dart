import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ManifestModel extends StatefulWidget {
  bool ofend = false;
  bool testig = false;
  TextEditingController nombre = TextEditingController();
  TextEditingController cedula = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController firma = TextEditingController();
  TextEditingController manifest = TextEditingController();

  @override
  _ManifestModelState createState() => _ManifestModelState();
}

class _ManifestModelState extends State<ManifestModel> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
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
                    'MANIFESTACIÓN DE:',
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                  _autoSize('OFENDIDO', 1, 18.0),
                  Checkbox(
                    value: widget.ofend,
                    onChanged: (bool value) {
                      setState(() {
                        widget.ofend = value;
                      });
                    },
                  ),
                  _autoSize('TESTIGO', 1, 18.0),
                  Checkbox(
                    value: widget.testig,
                    onChanged: (bool value) {
                      setState(() {
                        widget.testig = value;
                      });
                    },
                  ),
                ],
              )),
            )),
        _textboxgrandes('', 18),
        const SizedBox(height: 20.0),
        datos(),
        Divider(thickness: 2,color: Colors.black,)
      ],
    );
  }

  Widget datos() {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: _textforms('NOMBRE', widget.nombre),
        ),
        Flexible(
          flex: 2,
          child: _textforms('CEDULA O PASAPORTE', widget.cedula),
        ),
        Flexible(
          flex: 2,
          child: _textforms('TELEFONO', widget.telefono),
        ),
        Flexible(
          flex: 2,
          child: _textforms('FIRMA', widget.firma),
        ),
      ],
    );
  }

  Widget _autoSize(String data, int lines, double size) {
    return AutoSizeText(
      data,
      maxLines: lines,
      style: TextStyle(fontSize: size, color: Colors.white),
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
          const SizedBox(height: 4.3),
          TextFormField(
            controller: widget.manifest,
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

  Widget _textforms(String dato, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        controller: controller,
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
}
