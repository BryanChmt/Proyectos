import 'package:flutter/material.dart';

class PiezasCont extends StatefulWidget {
  PiezasCont({Key key}) : super(key: key);

  @override
  _PiezasContState createState() => _PiezasContState();
}

class _PiezasContState extends State<PiezasCont> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DataTable(dataRowHeight: 80.0, columns: <DataColumn>[
                  DataColumn(
                      label: Text('Pieza'),
                      tooltip: 'Nombre de la pieza',
                      numeric: true),
                  DataColumn(
                      label: Text('Condición'),
                      tooltip: 'Condición de la pieza',
                      numeric: false),
                  DataColumn(
                      label: Text('Valor pieza'),
                      tooltip: 'Valor',
                      numeric: true),
                  DataColumn(
                      label: Text('Acciones'),
                      numeric: true),
                ], rows: [
                  DataRow(
                    cells: [
                      DataCell(Text("Puerta delantera Izquierda")),
                      DataCell(Text("Nueva")),
                      DataCell(Text("3.0")),
                      DataCell(
                        Icon(Icons.delete_outline_sharp),
                      ),
                    ],
                  ),
                  // rows: _getRow()
                  // _bill.products.map((product) {
                  //   // print('Producto: ${product.productDecription}');
                  //   int index = _bill.products.indexOf(product);
                  //   // print('Element: $element');
                  //   return DataRow(cells: <DataCell>[
                  //     DataCell(Text(_bill.quantity.elementAt(index).toString())),
                  //     DataCell(Text(_bill.products[index].productDecription)),
                  //     DataCell(
                  //         Text(_bill.products[index].productPrice.toString())),
                  //     DataCell(Text(_bill.totalProducts[index].toString())),
                  //   ]);
                  // }).toList()
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
