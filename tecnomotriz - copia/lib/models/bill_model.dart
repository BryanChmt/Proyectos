import 'package:tecnomotriz/models/product_model.dart';

class BillModel {
  List<ProductModel> products;
  List<int> quantity;
  List<double> totalProducts;
  double total;
  double saldo;
  int abono;
  double vuelto;

  BillModel() {
    this.products = <ProductModel>[];
    this.quantity = <int>[];
    this.totalProducts = <double>[];
    this.total = 0.0;
    this.saldo = 0;
    this.abono = 0;
    this.vuelto = 0;
  }
}
