import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_ui_hero_ani/model/location.dart';

class LatLongWidget extends StatelessWidget {
  final Location location;
  const LatLongWidget({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          location.latitude!,
          style: const TextStyle(color: Colors.white70),
        ),
         Icon(Icons.location_on, color: Colors.white70),
          Text(
            location.longitude!,
            style: const TextStyle(color: Colors.white70),
          )
      ],
    );
  }
}