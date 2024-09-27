import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tecnomotriz/models/checkbox.dart';
import 'package:tecnomotriz/pages/select_page.dart';

class ContentCheck extends StatefulWidget {
  ContentCheck({Key key}) : super(key: key);

  @override
  _ContentCheckState createState() => _ContentCheckState();
}

class _ContentCheckState extends State<ContentCheck> {
  final _formKey = GlobalKey<FormState>();
  String dropdownStr = "Si";
  //Controllers
  TextEditingController _cliente = TextEditingController();
  TextEditingController _telefono = TextEditingController();
  TextEditingController _correo = TextEditingController();
  TextEditingController _caso = TextEditingController();
  TextEditingController _asunto = TextEditingController();
  TextEditingController _placa = TextEditingController();
  TextEditingController _descrip = TextEditingController();
  TextEditingController _observaciones = TextEditingController();
  TextEditingController _objetos = TextEditingController();

  //Extras
  TextEditingController _total = TextEditingController();
  TextEditingController _recibidopor = TextEditingController();
  TextEditingController _firmacliente = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.only(left: 15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                  width: size.width * 0.90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Color(0xFF0944ba),
                      width: 2.0,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
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
                            color: Color(0xFF0944ba),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              'Revisión General:',
                              style: TextStyle(
                                  fontSize: 30.0, color: Colors.white),
                            )),
                          ),
                        ),
                        const SizedBox(height: 35.0),
                        Container(
                          height: 450,
                          child: Row(
                            children: [
                              Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Column(
                                    children: [
                                      _content(
                                          'Cliente',
                                          TextInputType.name,
                                          FilteringTextInputFormatter
                                              .singleLineFormatter,
                                          'Nombre del cliente',_cliente),
                                      _content(
                                          'Correo Electrónico',
                                          TextInputType.name,
                                          FilteringTextInputFormatter
                                              .singleLineFormatter,
                                          'Correo Electrónico',_correo),
                                      _content(
                                          'Asunto',
                                          TextInputType.name,
                                          FilteringTextInputFormatter
                                              .singleLineFormatter,
                                          'Asunto',_asunto),
                                      _grua(),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Column(
                                    children: [
                                      _content(
                                          'Teléfono',
                                          TextInputType.name,
                                          FilteringTextInputFormatter
                                              .singleLineFormatter,
                                          'Numero telefonico',_telefono),
                                      _content(
                                          '#De caso',
                                          TextInputType.name,
                                          FilteringTextInputFormatter
                                              .singleLineFormatter,
                                          '#De caso',_caso),
                                      _content(
                                          'Número de placa',
                                          TextInputType.name,
                                          FilteringTextInputFormatter
                                              .singleLineFormatter,
                                          'Placa del vehículo',_placa),
                                      const SizedBox(
                                        height: 128,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Divider(
                          color: Color(0xFF0944ba),
                          thickness: 2.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              // Flexible(child: _checkedDoble()),
                              Flexible(
                                child: Column(
                                  children: [
                                    _checked('ALARMA'),
                                    _checked('CORTE IGNICIÓN'),
                                    _checked('PARABRISAS'),
                                    _checked('PARRILLA'),
                                    _checked('EMBLEMA'),
                                    _checked('GUARDA\nBARRO'),
                                    _checked('Polarizado'),
                                    _checked('MANILLAS'),
                                    _checked('TAPA BAÚL'),
                                    _checked('EMBLEMA ATRÁS'),
                                    _checked('BUMPER TRAS'),
                                    _checked('ESCOBILLAS'),
                                  ],
                                ),
                              ),

                              Flexible(
                                child: Column(
                                  children: [
                                    _checked('MARCHAMO'),
                                    _checked('LLANTAS'),
                                    _checked('ANTENAS'),
                                    _checked('MATABURROS'),
                                    _checked('VIDRIO TRASERO'),
                                    _checked('TECHO'),
                                    _checked('DESEMPAÑADOR'),
                                    _checked('VARILLA ACEITE'),
                                    _checked('TAPONES'),
                                    _checked('PARASOLES'),
                                    _checked('ESPEJO.INT'),
                                    _checked('CINTURONES'),
                                  ],
                                ),
                              ),

                              Flexible(
                                child: Column(
                                  children: [
                                    _checked('ASIENTOS'),
                                    _checked('DASH'),
                                    _checked('TARJETA\nCIRC'),
                                    _checked('HOJA RTV'),
                                    _checked('PITORETA'),
                                    _checked('RADIO'),
                                    _checked('CAMARA\nRETROCESO'),
                                    _checked('AIRE.ACONDI'),
                                    _checked('CENICEROS'),
                                    _checked('ENCENDEDOR'),
                                    _checked('SENSOR\nREVERSA'),
                                  ],
                                ),
                              ),

                              Flexible(
                                child: Column(
                                  children: [
                                    _checked('RADIOS\nCARAT'),
                                    _checked('AIR BAG'),
                                    _checked('LUZ CHECK\nMOTOR'),
                                    _checked('FRENO MANO'),
                                    _checked('TRIÁNGULOS'),
                                    _checked('EXTINGUIDOR'),
                                    _checked('ESLINGA'),
                                    _checked('INDICADOR EN\nDASH'),
                                    _checked('RACKS'),
                                    _checked('TAPICERÍA\nTECHO'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Color(0xFF0944ba),
                          thickness: 2.0,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                // Flexible(
                                //   child: Column(
                                //     children: [
                                //       _content(
                                //           'Año',
                                //           TextInputType.name,
                                //           FilteringTextInputFormatter
                                //               .singleLineFormatter,
                                //           ''),
                                //       _content(
                                //           'Marca',
                                //           TextInputType.name,
                                //           FilteringTextInputFormatter
                                //               .singleLineFormatter,
                                //           ''),
                                //       _content(
                                //           'Modelo',
                                //           TextInputType.name,
                                //           FilteringTextInputFormatter
                                //               .singleLineFormatter,
                                //           ''),
                                //       _content(
                                //           'Color',
                                //           TextInputType.name,
                                //           FilteringTextInputFormatter
                                //               .singleLineFormatter,
                                //           '')
                                //     ],
                                //   ),
                                // ),

                                Flexible(
                                    flex: 3,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: _checkedDoble(),
                                    )),
                                Flexible(
                                  flex: 3,
                                  child: FittedBox(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                  'assets/porsche-frente.png'),
                                              height: 400,
                                              width: 300,
                                            ),
                                            const SizedBox(width: 40.0),
                                            Image(
                                              image: AssetImage(
                                                  'assets/porsche-costado.png'),
                                              height: 300,
                                              width: 500,
                                            )
                                          ],
                                        ),
                                        Image(
                                          image: AssetImage(
                                              'assets/porsche-atras.png'),
                                          height: 400,
                                          width: 300,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: Color(0xFF0944ba),
                          thickness: 2.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Flexible(
                                  flex: 2,
                                  child:
                                      _comentarios('Descripción de Trabajo',_descrip)),
                              const SizedBox(width: 20.0),
                              Flexible(
                                  flex: 2,
                                  child: _comentarios('Observaciones',_observaciones)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Flexible(
                                  flex: 2,
                                  child: _comentarios('Objetos de Valor',_objetos)),
                              const SizedBox(width: 20.0),
                              Flexible(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Flexible(
                                          flex: 2,
                                          child: _autoSize('Total:', 1, 25.0)),
                                      const SizedBox(width: 20.0),
                                      Flexible(flex: 3, child: TextFormField(controller: _total,)),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        Divider(
                          color: Color(0xFF0944ba),
                          thickness: 2.0,
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: _contenidoInferior(),
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 15.0),
                          child: _autoSize('Guardar', 1, 20.0),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF0944ba)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30.0),
                    Flexible(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectPage(),
                            ),
                          ),
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 15.0),
                          child: _autoSize('Cancelar', 1, 20.0),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF0944ba)),
                        ),
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

  Widget _checked(String text) {
    return Row(
      children: [
        Flexible(
            flex: 2,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
              child: CustomCheckbox(),
            )),
        Flexible(
          flex: 5,
          child: _autoSize(text, 4, 15.0),
        ),
      ],
    );
  }

  Widget _izq(String text) {
    return Row(
      children: [
        Flexible(
            flex: 2,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
              child: Column(
                children: [
                  Text(
                    'I',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  CustomCheckbox(),
                ],
              ),
            )),
        Flexible(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: _autoSize(text, 4, 15.0),
          ),
        ),
      ],
    );
  }

  Widget _checkedDoble() {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.35,
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(child: _izq('LUZ DELANTERA')),
                    Flexible(
                        child: Column(
                      children: [
                        Text(
                          'D',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        CustomCheckbox(),
                      ],
                    )),
                  ],
                ),
                Row(
                  children: [
                    Flexible(child: _checked('NEBUNERO')),
                    Flexible(child: CustomCheckbox()),
                  ],
                ),
                Row(
                  children: [
                    Flexible(child: _checked('PUERTAS')),
                    Flexible(child: CustomCheckbox()),
                  ],
                ),
                Row(
                  children: [
                    Flexible(child: _checked('ESPEJO')),
                    Flexible(child: CustomCheckbox()),
                  ],
                ),
                Row(
                  children: [
                    Flexible(child: _checked('VIDRIO')),
                    Flexible(child: CustomCheckbox()),
                  ],
                ),
                Row(
                  children: [
                    Flexible(child: _checked('COSTADO')),
                    Flexible(child: CustomCheckbox()),
                  ],
                ),
                Row(
                  children: [
                    Flexible(child: _checked('ESTRIBO')),
                    Flexible(child: CustomCheckbox()),
                  ],
                ),
                Row(
                  children: [
                    Flexible(child: _checked('STOP')),
                    Flexible(child: CustomCheckbox()),
                  ],
                ),
                Row(
                  children: [
                    Flexible(child: _checked('LODERAS')),
                    Flexible(child: CustomCheckbox()),
                  ],
                ),
                Row(
                  children: [
                    Flexible(child: _checked('MOLDURAS')),
                    Flexible(child: CustomCheckbox()),
                  ],
                ),
                Row(
                  children: [
                    Flexible(child: _checked('ARO')),
                    Flexible(child: CustomCheckbox()),
                  ],
                ),
                Row(
                  children: [
                    Flexible(child: _checked('BOTA AGUAS')),
                    Flexible(child: CustomCheckbox()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _contenidoInferior() {
    return Container(
      child: Column(
        children: [
          _checked(
              'Acepto las condiciones y estoy en completo acuerdo de retirar el vehiculo hasta que el monto de la reparacion sea cancelado en su totalidad.'),
          const SizedBox(height: 25.0),
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    _autoSize('Vehículo recibido por', 1, 20.0),
                    const SizedBox(width: 20.0),
                    TextFormField(controller:_recibidopor ,),
                  ],
                ),
              ),
              const SizedBox(width: 25.0),
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    _autoSize('Firma y cédula del Cliente', 1, 20.0),
                    const SizedBox(width: 20.0),
                    TextFormField(controller:_firmacliente ,),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _grua() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _autoSize('Llegó en grúa:', 2, 20.0),
          const SizedBox(width: 20.0),
          DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
              helperText: 'Por favor seleccione si la llegada fue en grua',
              helperStyle: TextStyle(fontSize: 15.0),
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
            iconSize: 30.0,
            style: TextStyle(fontSize: 20.0, color: Colors.black),
            value: dropdownStr,
            onChanged: (newValue) {
              setState(
                () {
                  dropdownStr = newValue;
                },
              );
            },
            items: [
              'Si',
              'No',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _content(String dato, TextInputType tipo,
      FilteringTextInputFormatter valid, String help,TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        inputFormatters: <TextInputFormatter>[valid],
        keyboardType: tipo,
        controller: controller,
        style: TextStyle(
          fontSize: 20.0,
        ),
        decoration: InputDecoration(
          helperText: help,
          helperStyle: TextStyle(fontSize: 15.0),
          hintText: dato,
          // labelStyle: TextStyle(color: Color(0xFF0944ba)),
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF0944ba))),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }

  Widget _autoSize(String data, int lines, double size) {
    return AutoSizeText(
      data,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: size,
      ),
    );
  }

  Widget _comentarios(String data,TextEditingController controller) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _autoSize(data, 1, 20.0),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
