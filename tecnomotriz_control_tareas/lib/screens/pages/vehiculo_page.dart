import 'package:flutter/material.dart';
import 'package:tecnomotriz_control_tareas/screens/pages/tareas_page.dart';
import 'package:tecnomotriz_control_tareas/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final String _apiKey = 'wqE6Uf9aqRa9QPw9ZMrtvc9lkyTwFEqe';
  static final String _baseURL = 'simplesolutionscr.com';
  static final String _endpoint = 'tecnomotriz/webservice/service.php';
  List items = [];
  List idItems = [];
  List placa = [];
  List modelo = [];
  List marca = [];

  bool loading = true;

  @override
  void initState() {
    super.initState();

    getdata().then((value) => setState(() {
          items.add(value);
          loading = false;
        }));
  }

  Future getdata() async {
    final url = Uri.https(_baseURL, _endpoint, {
      'who': 'get_vehicles',
      'api_key': _apiKey,
    });
    final response = await http.get(url, headers: {
      'Access-Control-Allow-Origin': '*',
    });
    var data = json.decode(response.body);
    print(data["error"]);
    if (data["error"] != false) {
      print('logica de mostrar error');
    } else {
      setState(() {
        for (var i in data["respuesta"]) {
          this.items.add(i["Placa"] + " " + i["Marca"] + " " + i["Modelo"]);
          this.idItems.add(i["IdVehiculo"]);
          this.placa.add(i["Placa"]);
          this.modelo.add(i["Modelo"]);
          this.marca.add(i["Marca"]);
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
              vehiculos(context, orientation, width, height),
            ],
          ),
        )
      ],
    ));
  }

  Widget vehiculos(BuildContext context, Orientation orientation, double width,
      double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
        width:
            (orientation == Orientation.portrait) ? width * 0.95 : width * 0.85,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Lista de vehículos',
                style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10.0,
              ),
              _buttonsvehiculos(
                  EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),orientation,height),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonsvehiculos(EdgeInsetsGeometry padding, Orientation orientation, double height) {
    return Container(
       height: (orientation == Orientation.portrait)
                ? height * 0.70
                : height * 0.63,
      child: loading == true
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 25.0),
                Container(
                    width: 50, height: 50, child: CircularProgressIndicator()),
              ],
            )
          : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: placa.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 2.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TareasPage(
                              '${idItems[index]}',
                              '${placa[index]}',
                              '${marca[index]}',
                              '${modelo[index]}',
                            ),
                          ),
                        );
                        print(idItems[index]);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0)),
                        primary: Color(0xff527CBC),
                        elevation: 10.0,
                      ),
                      child: Padding(
                        padding: padding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Placa:${placa[index]}',
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: 280,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Marca:${marca[index]}',
                                        style: TextStyle(
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Modelo:${modelo[index]}',
                              style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                );
              },
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
}
