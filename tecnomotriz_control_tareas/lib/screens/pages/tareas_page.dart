import 'package:flutter/material.dart';
import 'package:tecnomotriz_control_tareas/screens/pages/completado_page.dart';
import 'package:tecnomotriz_control_tareas/screens/pages/vehiculo_page.dart';
import 'package:tecnomotriz_control_tareas/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TareasPage extends StatefulWidget {
  String id;
  String placa;
  String marca;
  String modelo;

  TareasPage(this.id, this.placa, this.marca, this.modelo);

  @override
  _TareasPageState createState() => _TareasPageState();
}

class _TareasPageState extends State<TareasPage> {
  static final String _apiKey = 'wqE6Uf9aqRa9QPw9ZMrtvc9lkyTwFEqe';
  static final String _baseURL = 'simplesolutionscr.com';
  static final String _endpoint = '/tecnomotriz/webservice/service.php';
  List tarea = [
   
  ];
  List idtareacotizacion = [];
  bool loading = true;
  @override
  void initState() {
    super.initState();

    getdata().then((value) => setState(() {
          tarea.add(value);
          loading = false;
        }));
  }

  Future getdata() async {
    final url = Uri.https(_baseURL, _endpoint, {
      'who': 'get_vehicle_data',
      'api_key': _apiKey,
      'IdVehiculo': widget.id,
    });
    final response = await http.get(url, headers: {
      'Access-Control-Allow-Origin': '*',
    });

    var data = json.decode(response.body);
    if (data["error"] != false) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('No hay tarea',style: TextStyle(fontSize: 25.0),),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('No existen tareas para este vehículo',style: TextStyle(fontSize: 20.0),),
                  Text('Por favor seleccionar otro vehículo',style: TextStyle(fontSize: 20.0),),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Aceptar',style: TextStyle(fontSize: 25.0,color: Color(0xff527CBC)),),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        for (var i in data["respuesta"]) {
          this.tarea.add(i["Descripcion"]);
          this.idtareacotizacion.add(i["IdTareaXCotizacion"]);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
        body: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        createBackground(context),
        SingleChildScrollView(
          child: Column(
            children: [
              _tecnomotrizLogo(orientation, width, height),
              tareas(context, orientation, width, height),
            ],
          ),
        )
      ],
    ));
  }

  Widget tareas(BuildContext context, Orientation orientation, double width,
      double height) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width:
            (orientation == Orientation.portrait) ? width * 0.93 : width * 0.90,
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    height: (orientation == Orientation.portrait)
                        ? height * 0.16
                        : height * 0.22,
                    child: Container(
                       width: (orientation == Orientation.portrait)
                        ? width * 0.85
                        : width * 0.85,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _box('Cono:', '', EdgeInsets.only(right:55.0)),
                              const SizedBox(height: 25),
                              _box('Modelo:', '${widget.modelo}',
                                  EdgeInsets.only(right: 18.0)),
                              
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _box('Marca:', '${widget.marca}',
                                  EdgeInsets.only(right: 40.0)),
                              const SizedBox(height: 25),
                              _box('Placa:', '${widget.placa}',
                                  EdgeInsets.only(right: 50.0)),
                             
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  _coment(context, orientation, height),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Color(0xff527CBC),
                  elevation: 10.0,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    'Regresar',
                    style: TextStyle(fontSize: 36.0),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _coment(BuildContext context, Orientation orientation, double height) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _text(
                'Lista de Tareas',
              ),
              Icon(
                Icons.swap_vert,
                color: Colors.white,
                size: 25.0,
              )
            ],
          ),
          const SizedBox(height: 8.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey[300],
            ),
            height: (orientation == Orientation.portrait)
                ? height * 0.45
                : height * 0.52,
            width: size.width * 30,
            padding: const EdgeInsets.symmetric(
              horizontal: 14.0,
            ),
            child: loading == true
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25.0),
                      Container(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator()),
                    ],
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: tarea.length - 1,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom:6.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                            ),
                          
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 18.0,
                            ),
                            child: ListTile(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => CompletadoPage(
                                      '${widget.placa}',
                                      '${widget.marca}',
                                      '${widget.modelo}',
                                      '${idtareacotizacion[index]}',
                                       '${tarea[index]}',
                                    ),
                                  ),
                                );
                              },
                              title: Text(
                                '${tarea[index]}',
                                style: TextStyle(fontSize: 30.0),
                              ),
                              leading: const Icon(
                                Icons.car_repair_outlined,
                                size: 45.0,
                                color: Color(0xff527CBC),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 30.0,
                                color: Color(0xff527CBC),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }

  Widget _tecnomotrizLogo(
      Orientation orientation, double width, double height) {
    return Hero(
      tag: 1,
      child: SafeArea(
        child: Container(
          width: (orientation == Orientation.portrait)
              ? width * 0.85
              : width * 0.5,
          child: Image.asset(
            'assets/img/LogoTecnomotrizsinEP.png',
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
            width: width * 0.5,
          ),
        ),
      ),
    );
  }

  Widget _box(String text, String data, EdgeInsetsGeometry padding) {
    return Container(
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: padding,
            child: _text(text),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            width: 145,
            height: 53,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            child: Center(
              child: Text(
                data,
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _text(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
