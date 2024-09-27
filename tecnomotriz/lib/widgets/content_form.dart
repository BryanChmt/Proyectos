import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tecnomotriz/models/bill_model.dart';
import 'package:tecnomotriz/models/product_model.dart';
import 'package:tecnomotriz/pages/next_page.dart';
import 'package:tecnomotriz/provider/save_orden.dart';

class ContentForm extends StatefulWidget {
  @override
  _ContentFormState createState() => _ContentFormState();
}

class _ContentFormState extends State<ContentForm> {
//DropDowncontrollers
  String dropdownStr = "INS";
  String dropdowncar = "Porsche";
  String dropdownvehi = "Panamera";
  String dropdowntipo = "Hatchback";

  enviar() async {
    //asignacion de variables
    Map<String, dynamic> info = await _savereport.save_orden(
      _cliente.text,
      _telefono.text,
      _valuSeguro.text,
      _valuTaller.text,
      _placa.text,
      _vin.text,
      _color.text,
      _modelo.text,
      _comentario.text,
      dropdownStr,
      dropdowncar,
      dropdownvehi,
      dropdowntipo,
    );

    print(info);
  }

  final _savereport = new SaveOrden();

  final _formKey = GlobalKey<FormState>();

  //Controllers
  TextEditingController _cliente = TextEditingController();
  TextEditingController _telefono = TextEditingController();
  TextEditingController _valuSeguro = TextEditingController();
  TextEditingController _valuTaller = TextEditingController();
  TextEditingController _placa = TextEditingController();
  TextEditingController _vin = TextEditingController();
  TextEditingController _color = TextEditingController();
  TextEditingController _modelo = TextEditingController();
  TextEditingController _comentario = TextEditingController();

  // BillModel _bill;
  // ProductModel _productModel;
  // List<DataRow> _shoppingOrder = <DataRow>[];

  // String _total = '';
  // TextEditingController _quantityController = TextEditingController();
  // TextEditingController _descriptionController = TextEditingController();
  // TextEditingController _priceController = TextEditingController();
  // TextEditingController _abonoController = TextEditingController();

//   @override
//   initState() {
//     _bill = new BillModel();

//     super.initState();
//   }

//   @override
//   dispose() {
//     _quantityController.dispose();
//     _descriptionController.dispose();
//     _priceController.dispose();
//     _abonoController.dispose();
//     super.dispose();
//   }

//   _addProduct({
//     @required int quantity,
//     @required String productDescription,
//     @required double price,
//   }) {
//     _productModel = new ProductModel(
//         productDecription: productDescription, productPrice: price);

//     ProductModel _productExists = _bill.products.singleWhere(
//         (productModel) =>
//             productModel.productDecription == _productModel.productDecription,
//         orElse: () => null);

//     if (_productExists != null) {
//       int index = _bill.products.indexOf(_productExists);
//       print(
//           'Producto existente en el carrito, se encuentra en el indice $index');

//       _bill.quantity[index] += quantity;
//       _bill.totalProducts[index] =
//           _bill.quantity[index] * _bill.products[index].productPrice;
//     } else {
//       print(
//           'Producto no existente en el carrito, el producto será agregado al carrito.');
//       _bill.products.add(_productModel);
//       _bill.quantity.add(quantity);
//       _bill.totalProducts.add(_productModel.productPrice * quantity);
//     }

// // Calcular el total por pagar, si no hay productos el total es cero por default
//     _bill.total = _bill.totalProducts
//         .fold(0, (previousValue, element) => previousValue + element);

//     // _bill.total  print('Cantidad de Productos: ${_bill.products.length}');
//     setState(() {});
//   }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.only(left: 15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Container(
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
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                'Información General:',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30.0),
                              )),
                            )),
                        const SizedBox(height: 35.0),
                        Container(
                          height: 304,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: _autoSize('Cliente:', 1, 25.0),
                                    ),
                                    _content(
                                        'Cliente',
                                        TextInputType.name,
                                        FilteringTextInputFormatter
                                            .singleLineFormatter,
                                        'Nombre del cliente',
                                        _cliente),
                                    _aseguradora(),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: _autoSize('Telefono:', 1, 25.0),
                                    ),
                                    _content(
                                        'Telefono',
                                        TextInputType.phone,
                                        FilteringTextInputFormatter.digitsOnly,
                                        'Número telefonico del cliente',
                                        _telefono),
                                    const SizedBox(
                                      height: 160.0,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: _autoSize('Valuación:', 1, 25.0),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                    flex: 2,
                                    child: _content(
                                        'Valuación del Seguro',
                                        TextInputType.text,
                                        FilteringTextInputFormatter
                                            .singleLineFormatter,
                                        'Introduzca el valor de la Valuación realizada por\nla compañia de seguros',
                                        _valuSeguro)),
                                Flexible(
                                    flex: 2,
                                    child: _content(
                                        'Valuación del Taller',
                                        TextInputType.text,
                                        FilteringTextInputFormatter
                                            .singleLineFormatter,
                                        'Introduzca el valor de la Valuación realizada por\nel taller',
                                        _valuTaller)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),
                        Container(
                            width: size.width * 0.90,
                            decoration: BoxDecoration(
                              color: Color(0xFF0944ba),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                'Información del Vehículo:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                ),
                              )),
                            )),
                        const SizedBox(height: 35.0),
                        _vehiculos(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: _autoSize('Placa:', 1, 25.0),
                                  ),
                                  _content(
                                      'Placa',
                                      TextInputType.text,
                                      FilteringTextInputFormatter
                                          .singleLineFormatter,
                                      'Número de placa del vehículo',
                                      _placa),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: _autoSize('Color:', 1, 25.0),
                                  ),
                                  _content(
                                      'Color',
                                      TextInputType.text,
                                      FilteringTextInputFormatter
                                          .singleLineFormatter,
                                      'Proporcione el nombre del color',
                                      _color),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Flexible(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child:
                                        _autoSize('Núm. Serie/VIN:', 2, 25.0),
                                  ),
                                  _content(
                                      '#VIN',
                                      TextInputType.text,
                                      FilteringTextInputFormatter
                                          .singleLineFormatter,
                                      'Por favor proporcione número VIN',
                                      _vin),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child:
                                        _autoSize('Modelo  /  Año:', 2, 25.0),
                                  ),
                                  _content(
                                      'Modelo / Año',
                                      TextInputType.text,
                                      FilteringTextInputFormatter
                                          .singleLineFormatter,
                                      'Por favor proporcione modelo/año',
                                      _modelo),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 20.0),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        _coment(),
                        const SizedBox(height: 25.0),
                      ],
                    ),
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
                      onPressed: () {
                          enviar();

                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 15.0),
                        child: _autoSize('Guardar', 1, 20.0),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF0944ba)),
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
                            builder: (context) => NextPage(),
                          ),
                        ),
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 15.0),
                        child: _autoSize('Siguiente', 1, 20.0),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF0944ba)),
                      ),
                    ),
                  ),
                ],
              )
            ],
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

  Widget _containers() {
    return Container(
      height: 665.0,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // DataTable(
                //     dataRowHeight: 80.0,
                //     columns: <DataColumn>[
                //       DataColumn(
                //           label: Text('Cantidad'),
                //           tooltip: 'Cantidad de Productos',
                //           numeric: true),
                //       DataColumn(
                //           label: Text('Descripción Producto'),
                //           tooltip: 'Producto por Pagar',
                //           numeric: false),
                //       DataColumn(
                //           label: Text('Precio Unitario'),
                //           tooltip: 'Producto por Unidad',
                //           numeric: true),
                //       DataColumn(
                //           label: Text('Total'),
                //           tooltip: 'Total de Producto por Pagar',
                //           numeric: true),
                //     ],
                //     // rows: _getRow()
                //     // _bill.products.map((product) {
                //     //   // print('Producto: ${product.productDecription}');
                //     //   int index = _bill.products.indexOf(product);
                //     //   // print('Element: $element');
                //     //   return DataRow(cells: <DataCell>[
                //     //     DataCell(Text(_bill.quantity.elementAt(index).toString())),
                //     //     DataCell(Text(_bill.products[index].productDecription)),
                //     //     DataCell(
                //     //         Text(_bill.products[index].productPrice.toString())),
                //     //     DataCell(Text(_bill.totalProducts[index].toString())),
                //     //   ]);
                //     // }).toList()
                //     ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _content(
      String dato,
      TextInputType tipo,
      FilteringTextInputFormatter valid,
      String help,
      TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        inputFormatters: <TextInputFormatter>[valid],
        keyboardType: tipo,
        style: TextStyle(
          fontSize: 20.0,
        ),
        controller: controller,
        decoration: InputDecoration(
          helperText: help,
          helperStyle: TextStyle(fontSize: 15.0),
          hintText: dato,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }

  Widget _coment() {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _autoSize('Comentarios', 1, 20.0),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _comentario,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            maxLines: 10,
          ),
        ],
      ),
    );
  }

  Widget _vehiculos() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _autoSize('Marca & Vehículo:', 2, 25.0),
          Container(
            height: 260.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          filled: true,
                          helperText: 'Marca del Vehículo',
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                        iconSize: 30.0,
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                        value: dropdowncar,
                        onChanged: (val) {
                          setState(
                            () {
                              dropdowncar = val;
                            },
                          );
                        },
                        items: [
                          'Porsche',
                        ].map<DropdownMenuItem<String>>((String val) {
                          return DropdownMenuItem(
                            value: val,
                            child: Text(val),
                          );
                        }).toList(),
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          filled: true,
                          helperText: 'Tipo de Vehículo',
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                        iconSize: 30.0,
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                        value: dropdowntipo,
                        onChanged: (val) {
                          setState(
                            () {
                              dropdowntipo = val;
                            },
                          );
                        },
                        items: [
                          'Hatchback',
                          'Sedan',
                          'Pickup ',
                          'SUV',
                          'Deportivo',
                        ].map<DropdownMenuItem<String>>((String val) {
                          return DropdownMenuItem(
                            value: val,
                            child: Text(val),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20.0),
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          helperText: 'Vehículo',
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                        iconSize: 30.0,
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                        value: dropdownvehi,
                        onChanged: (value) {
                          setState(
                            () {
                              dropdownvehi = value;
                            },
                          );
                        },
                        items: [
                          'Panamera',
                          '911',
                          'Cayanne',
                          'Macan',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 160.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _aseguradora() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _autoSize('Compañía de Seguros:', 2, 25.0),
          const SizedBox(width: 20.0),
          DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
              helperText:
                  'Por favor seleccione la compañia de seguros que se\nresposabiliza del vehículo',
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
              'INS',
              'CAFSA',
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

  // Widget _emptytext(
  //   @required TextEditingController controller,
  //   @required FilteringTextInputFormatter textFilterFormatter,
  //   @required String hintText,
  //   @required bool calculateTotal,
  //   @required TextInputType tipo,
  // }) {
  //   return Column(
  //     children: [
  //       Divider(
  //         color: Colors.black,
  //         thickness: 2.0,
  //       ),
  //       TextFormField(
  //         controller: controller,
  //         textAlign: TextAlign.center,
  //         // onChanged: (value) => controller.text = value
  //         keyboardType: tipo,
  //         inputFormatters:
  //             (textFilterFormatter == null) ? null : [textFilterFormatter],
  //         textInputAction: TextInputAction.done,
  //         onFieldSubmitted: (value) {
  //           if (calculateTotal) {
  //             _total = (int.parse(_quantityController.value.text) *
  //                     int.parse(_priceController.value.text))
  //                 .toString();
  //             _addProduct(
  //               price: double.parse(_priceController.text),
  //               productDescription: _descriptionController.text,
  //               quantity: int.parse(_quantityController.text),
  //             );
  //             _quantityController.clear();
  //             _descriptionController.clear();
  //             _priceController.clear();
  //             _total = '';
  //           }
  //         },
  //         decoration: InputDecoration(
  //           hintText: hintText,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _contenidoInferior(BuildContext context) {
  //   return Container(
  //     child: Row(
  //       children: [
  //         Flexible(
  //           flex: 3,
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Text(
  //                 'Recibido Conforme:',
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 20.0,
  //                 ),
  //                 textAlign: TextAlign.center,
  //               ),
  //               TextFormField(),
  //               const SizedBox(height: 10.0),
  //               Text(
  //                 'Firma',
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 20.0,
  //                 ),
  //                 textAlign: TextAlign.center,
  //               )
  //             ],
  //           ),
  //         ),
  //         VerticalDivider(
  //           width: 15.0,
  //           color: Colors.black,
  //         ),
  //         Flexible(
  //           flex: 2,
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Image(
  //                 image: AssetImage('assets/logotecno2.png'),
  //                 height: 200.0,
  //                 width: 300.0,
  //               ),
  //             ],
  //           ),
  //         ),
  //         VerticalDivider(
  //           color: Colors.black,
  //         ),
  //         Flexible(
  //           flex: 3,
  //           child: Container(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 Container(
  //                   height: 40.0,
  //                   child: Row(
  //                     children: [
  //                       Flexible(
  //                           flex: 1,
  //                           child: _autoSize(
  //                               'TOTAL  ₡   ${_bill.total}', 1, 20.0)),
  //                     ],
  //                   ),
  //                 ),
  //                 Divider(
  //                   color: Colors.black,
  //                   thickness: 2.0,
  //                 ),
  //                 Container(
  //                   height: 40.0,
  //                   child: Row(
  //                     children: [
  //                       Flexible(
  //                           flex: 2, child: _autoSize('ABONO ₡   ', 1, 20.0)),
  //                       Flexible(
  //                         flex: 3,
  //                         child: TextFormField(
  //                           onChanged: (value) {
  //                             setState(() {
  //                               _bill.vuelto =
  //                                   int.parse(_abonoController.text) -
  //                                       _bill.total;
  //                               _bill.saldo = _bill.total -
  //                                   int.parse(_abonoController.text);
  //                               if (_bill.saldo <= 0) {
  //                                 return _bill.saldo = 0;
  //                               }
  //                               if (_bill.vuelto <= 0) {
  //                                 return _bill.vuelto = 0;
  //                               }
  //                             });
  //                           },
  //                           controller: _abonoController,
  //                           keyboardType: TextInputType.number,
  //                           inputFormatters: <TextInputFormatter>[
  //                             FilteringTextInputFormatter.digitsOnly
  //                           ],
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 Divider(
  //                   color: Colors.black,
  //                   thickness: 2.0,
  //                 ),
  //                 Container(
  //                   height: 40.0,
  //                   child: Row(
  //                     children: [
  //                       Flexible(
  //                           flex: 1,
  //                           child: _autoSize(
  //                               'SALDO  ₡   ${_bill.saldo}', 1, 20.0)),
  //                       const SizedBox(
  //                         width: 5.0,
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 Divider(
  //                   color: Colors.black,
  //                   thickness: 2.0,
  //                 ),
  //                 Container(
  //                   height: 40.0,
  //                   child: Row(
  //                     children: [
  //                       Flexible(
  //                         flex: 1,
  //                         child:
  //                             _autoSize('VUELTO ₡   ${_bill.vuelto}', 1, 20.0),
  //                       ),
  //                       const SizedBox(
  //                         width: 5.0,
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // List<DataRow> _getRow() {
  //   List<DataRow> rowList = List.generate(_bill.products.length, (index) {
  //     return DataRow(cells: <DataCell>[
  //       DataCell(Text(_bill.quantity.elementAt(index).toString())),
  //       DataCell(Text(_bill.products[index].productDecription)),
  //       DataCell(Text(_bill.products[index].productPrice.toString())),
  //       DataCell(Text(_bill.totalProducts[index].toString())),
  //     ]);
  //   });
  //   DataRow lastRow = DataRow(cells: <DataCell>[
  //     // cantidad
  //     DataCell(
  //       Container(
  //         child: _emptytext(
  //           controller: _quantityController,
  //           textFilterFormatter: FilteringTextInputFormatter.digitsOnly,
  //           hintText: '0',
  //           tipo: TextInputType.number,
  //           calculateTotal: false,
  //         ),
  //       ),
  //     ),
  //     // Decripción Producto
  //     DataCell(
  //       Container(
  //         child: _emptytext(
  //           controller: _descriptionController,
  //           textFilterFormatter:
  //               FilteringTextInputFormatter.singleLineFormatter,
  //           hintText: 'No hay productos ingresados',
  //           calculateTotal: false,
  //           tipo: TextInputType.name,
  //         ),
  //       ),
  //     ),
  //     // Precio Unitario
  //     DataCell(
  //       Container(
  //         child: _emptytext(
  //           controller: _priceController,
  //           textFilterFormatter: FilteringTextInputFormatter.digitsOnly,
  //           hintText: '0',
  //           calculateTotal: true,
  //           tipo: TextInputType.number,
  //         ),
  //       ),
  //     ),
  //     // Total
  //     DataCell(Text(_total))
  //   ]);
  //   rowList.add(lastRow);
  //   return rowList;
  // }
}
