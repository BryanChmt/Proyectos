import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Swiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 800,
        viewportFraction: 0.9,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: [
        containerSugestions(
            'assets/header_slider01.jpg',
            'Recomendación de la casa',
            'COSTILLA AHUMADA BBQ',
            'Costilla de cerdo ahumada con nuestra deliciosa salsa servida con papa asada al romero'),
        containerSugestions(
            'assets/header_slider02.jpg',
            'Menú Desayuno',
            'DELICIOSOS DESAYUNOS',
            'Ven y acampa en el rancho y disfruta de nuestras deliciosas opciones de desayuno'),
        containerSugestions(
            'assets/header_slider03.jpg',
            'POSTRES',
            'DELICIOSOS POSTRES',
            'Disfruta de un delicioso postre o de nuestra reposteria'),
        containerSugestions(
            'assets/header_slider04.jpg',
            'Platos Verdes',
            'Ensaladas y vegetarianos',
            'Si la carne no es lo tuyo te ofrecemos opciones para tu gusto ya sean ensaladas o platos vegetarianos'),
        containerSugestions(
            'assets/header_slider05.jpg',
            'Cortes de  Res',
            'Tu Corte Favorito',
            'Elegí tu corte favorito de res y disfrutalo con un sabor único a la parrilla'),
      ],
    );
  }

  Container containerSugestions(String imagepath, String maintitle,
      String secondtitle, String description) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              imagepath,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                maintitle,
                style: TextStyle(
                  fontFamily: 'marker',
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
              Text(
                secondtitle,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 70,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ]));
  }
}
