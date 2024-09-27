import 'package:flutter/material.dart';

class Contenido extends StatelessWidget {
  const Contenido({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(width);
    return SingleChildScrollView(
        child: Column(
      children: [
        _entradas(context),
        _carne(context),
        _pollo(context),
        _cerdo(context),
        _pez(context),
        _vegano(context)
      ],
    ));
  }
}

Widget centroim() {
  return Container(
    child: Image(
      image: AssetImage('assets/logo.png'),
      width: 300,
      height: 300,
    ),
  );
}

Widget _entradas(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return Container(
    color: Colors.white,
    width: double.infinity,
    child: (width > 1195)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_imagenRow('assets/entrada.jpg'), _columna()],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_imagenColumn('assets/entrada.jpg'), _columna()],
          ),
  );
}

Widget _columna() {
  return Container(
    constraints: BoxConstraints(
        minHeight: 200, minWidth: 500, maxHeight: 700, maxWidth: 800),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _texto('Antojitos', 'Entradas'),
        Flexible(
            child: Wrap(children: [
          Tag('CHORIPAN', '₡2.500',
              'Deliciosa receta del Rancho chorizo especial con azúcar y chimichurri. Podes pedirlo sin caramelizar'),
          Tag('TORMENTO DE MONJA', '₡2.000',
              '2 gallos de salchichón servidos con tortilla a la parrilla y pico de gallo.'),
          Tag('ZUCHINNI CAPRESE', '₡3.000',
              '4 zuchinni con queso mozarella albahaca y tomate cherry'),
          Tag('HONGUITOS', '₡2.000',
              'Hongo portobello relleno con queso y cebollín. Pedí el extra de tocineta por ₡500'),
          Tag('SPRING ROLL VEGETARIANO', '₡1.500',
              'Wrap de arroz, zanahoria, pepino, kale, hongos salteados.'),
        ]))
      ],
    ),
  );
}

Widget _carne(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return Container(
    color: Colors.white,
    width: double.infinity,
    child: (width > 1195)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_carneCont(), _imagenRow('assets/res.jpg')],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_imagenColumn('assets/res.jpg'), _carneCont()],
          ),
  );
}

Widget _carneCont() {
  return Container(
    constraints: BoxConstraints(
        minHeight: 200, minWidth: 500, maxHeight: 700, maxWidth: 800),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _texto('Carnita Calidad', 'CARNE DE RES'),
        Flexible(
            child: Wrap(children: [
          Tag('CORTE DE RES', '₡8.000',
              'Elegí tu corte favorito a la parrilla, podes consultar por cualquier otro corte que sea de tu preferencia. Incluye dos acompañamientos a elegir.\nCortes disponibles:\n-Entraña,Colita de cuadril\n-Punta de Solomo\n-Delmónico\n-New York (Bife de chorizo)'),
          Tag('SHORT RIB', '₡8.500',
              'Costilla de res ahumada con dos acompañamientos a elegir.400g'),
          Tag('ACOMPAÑAMIENTOS', '',
              'Papa a las brasas\n-Papas fritas\n-Vegetales (zanahoria, brócoli, zuchinni, tomate)\n-Elote dulce\n-Plátano maduro\n-Pure de papa\n-Ensalada de la casa'),
        ]))
      ],
    ),
  );
}

Widget _pollo(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return Container(
    color: Colors.white,
    width: double.infinity,
    child: (width > 1195)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_imagenRow('assets/pollo.jpeg'), _polloCont()],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_imagenColumn('assets/pollo.jpeg'), _polloCont()],
          ),
  );
}

Widget _polloCont() {
  return Container(
    constraints: BoxConstraints(
        minHeight: 200, minWidth: 500, maxHeight: 800, maxWidth: 800),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _texto('Pollito', 'CARNE DE POLLO'),
        Flexible(
            child: Wrap(children: [
          Tag('FILET DE PECHUGA DE POLLO', '₡6.000',
              'Filet de pechuga de pollo a la parrilla con papa asada y vegetales con tu opción de salsa favorita. Salsas: Naranja, BBQ o Tropical.350g)'),
          Tag('WRAP DE POLLO', '₡5.000',
              'Tortilla de trigo con pollo a la parrilla, tu opción favorita de salsa, chimichurri del Rancho acompañado de papas fritas y delicioso zucchini a la parrilla. Salsas: Naranja, BBQ o Tropical.'),
          Tag('ALITAS DE POLLO', '₡10.000',
              'Alitas de pollo ahumadas con papas fritas y tocineta. Bañadas en tu salsa favorita: Naranja, BBQ, Mostaza Miel o Buffalo. 8 UNDS')
        ]))
      ],
    ),
  );
}

Widget _cerdo(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return Container(
    color: Colors.white,
    width: double.infinity,
    child: (width > 1195)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_cerdoCont(), _imagenRow('assets/cerdo.jpeg')],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_imagenColumn('assets/cerdo.jpeg'), _cerdoCont()],
          ),
  );
}

Widget _cerdoCont() {
  return Container(
    constraints: BoxConstraints(
        minHeight: 200, minWidth: 500, maxHeight: 700, maxWidth: 800),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _texto('Chanchito', 'CARNE DE CERDO'),
        Flexible(
            child: Wrap(children: [
          Tag('COSTILLA ', '₡7.000/₡22.000',
              'Jugosa costilla de cerdo ahumada y bañada en nuestra salsa BBQ, la favorita de la casa. Podes pedirla completa hasta para 4 personas. Incluye dos acompañamientos a elegir...350g/1.3kg'),
          Tag('ALITA DE CERDO', '₡7.000',
              'Alita de cerdo, si alitas de cerdo, ahumadas con nuestra salsa BBQ recomendada o escoge tu salsa favorita: Mostaza Miel o Buffalo. Incluye dos acompañamientos.350g'),
          Tag('CHULETA', '₡5.500',
              'Chuleta de cerdo ahumada y a la parrilla con 3 acompañamientos a elegir.350g\nEscoge tu salsa favorita:\n-Receta texana con salsa BBQ.\n-Salsa de Naranja.\n-Salsa Tropical.'),
          Tag('ACOMPAÑAMIENTOS', '',
              '-Papa a las brasas.\n-Papas fritas\n-Vegetales (zanahoria, brócoli, zuchinni, tomate)\n-Elote dulce\n-Plátano maduro\n-Pure de papa\n-Ensalada de la casa'),
        ]))
      ],
    ),
  );
}

Widget _pez(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return Container(
    color: Colors.white,
    width: double.infinity,
    child: (width > 1195)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_imagenRow('assets/pez.jpeg'), _pezCont()],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_imagenColumn('assets/pez.jpeg'), _pezCont()],
          ),
  );
}

Widget _pezCont() {
  return Container(
    constraints: BoxConstraints(
        minHeight: 200, minWidth: 500, maxHeight: 700, maxWidth: 800),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _texto('Pececito', 'CARNE DE PESCADO'),
        Flexible(
            child: Wrap(children: [
          Tag('TRUCHA AHUMADA', '₡8.000',
              'Deliciosa trucha de la Granja Crujim ahumada con nuestra receta especial. Podes pedirla entera o fileteada ;) Vegetales variados y papa asada.350g'),
          Tag('ROLLITOS PRIMAVERA', '₡6.000',
              '-Trucha: trozos de trucha ahumada envueltos en papel de arroz con zanahoria, pepino, kale y hongos salteados.\n-Atún: medallones de atún ahumado envueltos en papel de arroz con zanahoria, pepino, kale y hongos salteados.'),
          Tag('ATÚN AHUMADO', '₡8.000',
              'Delicioso medallón de atún ahumado especiado con eneldo acompañado de papa asada y ensalada de la casa.250g'),
          Tag('SALMÓN AHUMADO', '₡8.000',
              'Delicioso filete de salmón ahumado especiado con eneldo acompañado de papa asada y ensalada de la casa.250g'),
        ]))
      ],
    ),
  );
}

Widget _vegano(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return Container(
    color: Colors.white,
    width: double.infinity,
    child: (width > 1195)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_veganomenu(), _imagenRow('assets/menu_cover03.jpg')],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_imagenColumn('assets/menu_cover03.jpg'), _veganomenu()],
          ),
  );
}

Widget _veganomenu() {
  return Container(
    constraints: BoxConstraints(
        minHeight: 200, minWidth: 500, maxHeight: 700, maxWidth: 800),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _texto('Vegetales', 'VEGETARIANO Y VEGANO'),
        Flexible(
            child: Wrap(children: [
          Tag('ROLLITOS PRIMAVERA', '₡5.500',
              'Wrap de papel de arroz con zanahoria, pepino, kale, hongos salteados y lentejas. Escoge tu salsa favorita: Tai fusión(soya, tahini y miel) o salsa de naranja'),
          Tag('CAZUELA DE QUESO', '₡5.000',
              'Cazuela de queso fundido con hongos y tostadas.'),
          Tag('TABLITA VEGETARIANA ', '₡6.500',
              'Tablita con papa, camote, plátano, chile relleno, tomate, zuchinni, hongos con queso y espárragos.2personas'),
          Tag('TORTAS DE FALAFEL', '₡5.500',
              '2 tortas de falafel, bolitas de garbanzos, pure de camote y zuchinni grillado.'),
        ]))
      ],
    ),
  );
}

Widget _imagenRow(String imagepath) {
  return Image(
    image: AssetImage(imagepath),
    filterQuality: FilterQuality.high,
    fit: BoxFit.cover,
    // height: 700,
    width: 500,
  );
}

Widget _imagenColumn(String imagepath) {
  return Container(
      height: 500,
      child: Image(
        image: AssetImage(imagepath),
        filterQuality: FilterQuality.high,
        fit: BoxFit.fill,
        width: double.infinity,
      ));
}

Widget _texto(String titulo, String subtitulo) {
  return Column(
    children: [
      Text(
        titulo,
        style: TextStyle(
          fontFamily: 'marker',
          color: Colors.red,
          fontSize: 30,
        ),
      ),
      Text(
        subtitulo,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 40,
        ),
      ),
    ],
  );
}

class Tag extends StatelessWidget {
  final String cont;
  final String price;
  final String description;

  Tag(this.cont, this.price, this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minHeight: 200, minWidth: 200, maxHeight: 800, maxWidth: 300),
      child: ListTile(
        title: Row(
          children: [
            Text(
              this.cont,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(this.price, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        subtitle: Text(
          this.description,
          style: TextStyle(color: Colors.black),
        ),
        isThreeLine: true,
      ),
    );
  }
}
