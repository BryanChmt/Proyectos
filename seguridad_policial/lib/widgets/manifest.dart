import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:seguridad_policial/models/manifest.dart';

class ContentManifest extends StatefulWidget {
  @override
  _ContentManifestState createState() => _ContentManifestState();
}

class _ContentManifestState extends State<ContentManifest> {
  final _formKey = GlobalKey<FormState>();

  List<ManifestModel> listmanifest = [];
  List<String> manifestdata = [];

  addmanifest() {
    if (manifestdata.length != 0) {
      manifestdata = [];
      listmanifest = [];
      print('if');
    }
    setState(() {});
    if (listmanifest.length >= 5) {
      return;
    }
    listmanifest.add(new ManifestModel());
  }

  @override
  void initState() {
    super.initState();
    addmanifest();
  }

  submitData() {
    manifestdata = [];

    //data de listas
    listmanifest.forEach((widget) => manifestdata.add(widget.firma.text));
    listmanifest.forEach((widget) => manifestdata.add(widget.manifest.text));
    listmanifest.forEach((widget) => manifestdata.add(widget.nombre.text));
    listmanifest.forEach((widget) => manifestdata.add(widget.telefono.text));

    setState(() {});
    print(manifestdata);
  }

  // enviar() async {
  //   //asignacion de variables
  //   Map<String, dynamic> info = await _savehechos.save_manifest(
  //     _nombre.text,
  //     _cedula.text,
  //     _telefono.text,
  //     _firma.text,
  //     _manifest.text,
  //   );

  //   print(info);
  // }

  // final _savehechos = new SaveManifest();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                          child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listmanifest.length,
                            itemBuilder: (context, index) {
                              return listmanifest[index];
                            },
                          ),
                        ],
                      )),
                        Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          onPressed: addmanifest,
                          child: _autoSize('Agregar Manifestación', 1, 18),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.yellow[900])),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: submitData,
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
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _autoSize(String data, int lines, double size) {
    return AutoSizeText(
      data,
      maxLines: lines,
      style: TextStyle(fontSize: size, color: Colors.white),
    );
  }
}
