import 'package:flutter/material.dart';
import 'package:location_ui_hero_ani/data/hero_tag.dart';

import '../model/location.dart';
import 'hero_widget.dart';
import 'lat_long_widget.dart';

class ImageWidget extends StatelessWidget {
  final Location location;
  const ImageWidget({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
       padding: const EdgeInsets.symmetric(horizontal: 16),
      height: size.height * 0.5,
      width: size.width * 0.8,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 1),
          ],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Stack(children: [
          buildImage(),
          Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTopText(),
                  LatLongWidget(location: location),
                ],
              ),
            )
        ]),
        ),
      );
  }

  Widget buildImage() => SizedBox.expand(
    child: HeroWidget(
      tag: HeroTag.image(location.urlImage!),
      child: ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Image.asset(location.urlImage!,fit: BoxFit.cover,),),
    ),
    
  );
  Widget buildTopText() => Text(
    location.name!,
    style: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20
    ),
  );
}