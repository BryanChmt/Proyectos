import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tecnomotriz_control_tareas/screens/login/login_page.dart';
import 'package:tecnomotriz_control_tareas/screens/pages/tareas_page.dart';
import 'package:tecnomotriz_control_tareas/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'vehiculo_page.dart';

class CompletadoPage extends StatefulWidget {
  String placa;
  String marca;
  String modelo;
  String idtareacotizacion;
  String descrip;

  CompletadoPage(this.placa, this.marca, this.modelo, this.idtareacotizacion,
      this.descrip);

  @override
  _CompletadoPageState createState() => _CompletadoPageState();
}

class _CompletadoPageState extends State<CompletadoPage> {
  static final String _apiKey = 'wqE6Uf9aqRa9QPw9ZMrtvc9lkyTwFEqe';
  static final String _baseURL = 'simplesolutionscr.com';
  static final String _endpoint = '/tecnomotriz/webservice/service.php';

  Future getinicio() async {
    final url = Uri.https(_baseURL, _endpoint, {
      'who': 'insertar_registro_inicio',
      'api_key': _apiKey,
      'IdTareaXCotizacion': widget.idtareacotizacion,
    });
    final response = await http.get(url, headers: {
      'Access-Control-Allow-Origin': '*',
    });

    var data = json.decode(response.body);
    print(data);
    if (data["error"] != false) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Ha fallado el ingreso',
              style: TextStyle(fontSize: 25.0),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                    'Ha ocurrido un error por favor intente de nuevo',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Aceptar',
                  style: TextStyle(fontSize: 25.0, color: Color(0xff527CBC)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        for (var i in data["respuesta"]) {
          print('respuesta');
        }
      });
      if (mounted) {
        _startTimerDisplayer();
      }
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Registro insertado',
              style: TextStyle(fontSize: 25.0),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Se ha iniciado correctamente la tarea',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Aceptar',
                  style: TextStyle(fontSize: 25.0, color: Color(0xff527CBC)),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future getpausa() async {
    final url = Uri.https(_baseURL, _endpoint, {
      'who': 'insertar_registro_pausa',
      'api_key': _apiKey,
      'IdTareaXCotizacion': widget.idtareacotizacion,
    });
    final response = await http.get(url, headers: {
      'Access-Control-Allow-Origin': '*',
    });

    var data = json.decode(response.body);
    print(data);
    if (data["error"] != false) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Ha fallado el ingreso',
              style: TextStyle(fontSize: 25.0),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                    'Ha ocurrido un error por favor intente de nuevo',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Aceptar',
                  style: TextStyle(fontSize: 25.0, color: Color(0xff527CBC)),
                ),
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
          print('respuesta');
        }
      });
        if (mounted) {
                    _startTimerDisplayer();
                  }
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Registro insertado',
              style: TextStyle(fontSize: 25.0),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Se ha pausado correctamente la tarea',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Aceptar',
                  style: TextStyle(fontSize: 25.0, color: Color(0xff527CBC)),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future getlisto() async {
    final url = Uri.https(_baseURL, _endpoint, {
      'who': 'insertar_registro_final',
      'api_key': _apiKey,
      'IdTareaXCotizacion': widget.idtareacotizacion,
    });
    final response = await http.get(url, headers: {
      'Access-Control-Allow-Origin': '*',
    });

    var data = json.decode(response.body);
    print(data);
    if (data["error"] != false) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Ha fallado el ingreso',
              style: TextStyle(fontSize: 25.0),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                    'Ha ocurrido un error por favor intente de nuevo',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Aceptar',
                  style: TextStyle(fontSize: 25.0, color: Color(0xff527CBC)),
                ),
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
          print('respuesta');
        }
      });
        if (mounted) {
                    _startTimerDisplayer();
                  }
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Registro insertado',
              style: TextStyle(fontSize: 25.0),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Se ha terminado correctamente la tarea',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Aceptar',
                  style: TextStyle(fontSize: 25.0, color: Color(0xff527CBC)),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future getreproceso() async {
    final url = Uri.https(_baseURL, _endpoint, {
      'who': 'insertar_registro_reproceso',
      'api_key': _apiKey,
      'IdTareaXCotizacion': widget.idtareacotizacion,
    });
    final response = await http.get(url, headers: {
      'Access-Control-Allow-Origin': '*',
    });

    var data = json.decode(response.body);
    print(data);
    if (data["error"] != false) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Ha fallado el ingreso',
              style: TextStyle(fontSize: 25.0),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                    'Ha ocurrido un error por favor intente de nuevo',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Aceptar',
                  style: TextStyle(fontSize: 25.0, color: Color(0xff527CBC)),
                ),
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
          print('respuesta');
        }
      });
        if (mounted) {
                    _startTimerDisplayer();
                  }
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Registro insertado',
              style: TextStyle(fontSize: 25.0),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Se ha realizado el reproceso correctamente',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Aceptar',
                  style: TextStyle(fontSize: 25.0, color: Color(0xff527CBC)),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          );
        },
      );
    }
  }

  Timer _timerDisplayer;
  static int _counter = 1;

  @override
  void dispose() {
    _timerDisplayer.cancel();
    super.dispose();
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
              tareas(orientation, width, height),
            ],
          ),
        )
      ],
    ));
  }

  Widget tareas(Orientation orientation, double width, double height) {
    return Container(
      width:
          (orientation == Orientation.portrait) ? width * 0.96 : width * 0.90,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: (orientation == Orientation.portrait)
                      ? height * 0.15
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
                            _box('Cono:', '', EdgeInsets.only(right: 55.0)),
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
            const SizedBox(height: 25.0),
            Center(
              child: _text(
                'Tiempo disponible/Utilizado:',
              ),
            ),
            const SizedBox(
              height: 28.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _iconos(() {
                  getinicio();
                }, Icons.play_arrow_rounded),
                _iconos(() {
                  getpausa();
                }, Icons.pause_outlined),
                _iconos(() {
                  getlisto();
                }, Icons.check_rounded),
              ],
            ),
            const SizedBox(
              height: 22.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color(0xff527CBC),
                      elevation: 10.0,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(
                        MaterialPageRoute(
                          builder: (context) => TareasPage(
                            '',
                            '${widget.placa}',
                            '${widget.marca}',
                            '${widget.modelo}',
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20.0),
                      child: Text(
                        'Regresar',
                        style: TextStyle(fontSize: 36.0),
                      ),
                    )),
                ElevatedButton(
                  onPressed: () {
                    getreproceso();
                   
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 12.0),
                    child: Text(
                      'Reproceso',
                      style: TextStyle(fontSize: 36.0),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Color(0xff527CBC),
                    elevation: 10.0,
                  ),
                ),
              ],
            )
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
                'Descripción de tareas',
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
              height: (orientation == Orientation.portrait)
                  ? height * 0.32
                  : height * 0.38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey[300],
              ),
              width: size.width * 30,
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
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
                    onTap: () {},
                    title: Text(
                      '${widget.descrip}',
                      style: TextStyle(fontSize: 36.0),
                    ),
                    leading: const Icon(
                      Icons.car_repair_outlined,
                      size: 45.0,
                      color: Color(0xff527CBC),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget _iconos(Function onPress, IconData icon) {
    return Container(
      child: IconButton(
        onPressed: onPress,
        icon: Icon(icon),
        iconSize: 60.0,
      ),
    );
  }

  Widget _box(String text, String data, EdgeInsetsGeometry padding) {
    return Row(
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
    );
  }

  Widget _text(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.white),
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

  void _startTimerDisplayer() {
    _timerDisplayer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timerDisplayer.cancel();
          _redirectToLogIn(context);
        }
      });
    });
  }

  void _redirectToLogIn(BuildContext context) {
    // Logout
    Navigator.of(context).pushNamedAndRemoveUntil('login', (route) => false);
  }
}
