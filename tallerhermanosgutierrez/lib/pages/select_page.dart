import 'package:flutter/material.dart';


import 'checklist.dart';
import 'facturacion.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: ExactAssetImage('assets/taller.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          Container(
            height: 500.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
         Center(
           child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
             child: Container(
               child: SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Padding(
                   padding: const EdgeInsets.only(top: 300.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       _buton1(context),
                      const SizedBox(width: 120,),
                       _buton2(context)
                     ],
                   ),
                 ),
               ),
             ),
           ),
         )
        ],
      ),
    );
  }

  Widget _buton1(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5.0,
              offset: Offset(0.0, 3.0),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.red[600],),
          ),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Facturacion(),
              ),
            ),
          },
          child: Container(
          padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0),
            child: Text(
              'Orden de\n trabajo',
              style: TextStyle(fontSize: 30.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buton2(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5.0,
              offset: Offset(0.0, 3.0),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.red[600],),
          ),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckPage(),
              ),
            ),
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0),
            child: Text(
              'Checklist\nVehículo',
            
              style: TextStyle(fontSize: 30.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
