import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:tecnomotriz/widgets/content_form.dart';

class Facturacion extends StatefulWidget {
  @override
  _FacturacionState createState() => _FacturacionState();
}

class _FacturacionState extends State<Facturacion> {
  String _dateInitialValue;
  String _dateValue;
  final _formKey = GlobalKey<FormState>();
  DateTime now = DateTime.now();
  TextEditingController _dateInitialController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(       
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(           
            children: [
              FittedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: _header(context),
                ),
              ),
              const SizedBox(height: 15.0),
              ContentForm()
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Form(
       key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage('assets/logotecno2.png'),
              height: 200.0,
              width: 300.0,
            ),
            const SizedBox(width: 20.0),
            AutoSizeText(
              ' Grupo Tecnomotriz',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _text('Fecha', 30.0, FontWeight.bold),
                const SizedBox(height: 10.0),
                _billInfoInitialDatePicker(),
                _text('Orden de Trabajo', 30.0, FontWeight.bold),
                _forms('#Número de Orden',FilteringTextInputFormatter.digitsOnly,TextInputType.number)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _forms(String _dato,FilteringTextInputFormatter valid,TextInputType tipo) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      constraints: BoxConstraints.tightFor(width: 250, height: 100),
      child: TextFormField(

        inputFormatters:<TextInputFormatter>[valid],
        keyboardType: tipo,
        style: TextStyle(fontSize: 20.0),
        decoration: InputDecoration(
          hintText: _dato,
             filled: true,
            fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _text(String dato, double size, FontWeight weigth) {
    return Text(
      dato,
      style: TextStyle(
        fontSize: size,
        fontWeight: weigth,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Container _billInfoInitialDatePicker() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        constraints: BoxConstraints.tightFor(width: 225, height: 50),
        child: TextFormField(
          enableInteractiveSelection: false,
          onTap: () {
            setState(() {
              FocusScope.of(context).requestFocus(new FocusNode());
              _selectDate();
            });
          },
          onSaved: (val) => _dateInitialValue = val,
          onFieldSubmitted: (val) => _dateInitialValue = val,
          controller: _dateInitialController,
          // ignore: missing_return
          validator: (value) {
            if (value.isEmpty) return DateFormat('dd/MM/yyyy').format(now);
          },

          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: true,
            fillColor: Colors.white,
            hintText: DateFormat('dd/MM/yyyy').format(now),
            labelStyle: TextStyle(color: Colors.black, fontSize: 14),
            prefixIcon: Icon(Icons.date_range, size: 24, color: Colors.black),
          ),
        ));
  }

  void _selectDate() async {
    DateTime picked = await showDatePicker(
        context: this.context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1980),
        lastDate: DateTime(2100),
        cancelText: 'Cancelar',
        confirmText: 'Aceptar',
        locale: Locale('es', 'ES'));
    if (picked != null) {
      setState(() {
        _dateValue = picked.day.toString() +
            '/' +
            picked.month.toString() +
            '/' +
            picked.year.toString();
        _dateInitialValue = _dateValue;
        _dateInitialController.text = _dateInitialValue;
        print(_dateInitialValue);
      });
    }
  }
}
