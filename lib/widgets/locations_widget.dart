import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_ui_hero_ani/data/location.dart';

import 'location_widgets.dart';

class LocationsWidgets extends StatefulWidget {
  const LocationsWidgets({Key? key}) : super(key: key);

  @override
  State<LocationsWidgets> createState() => _LocationsWidgetsState();
}

class _LocationsWidgetsState extends State<LocationsWidgets> {
  final pageController = PageController(viewportFraction: 0.8);
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: pageController,
            itemCount: locations.length,
            itemBuilder: (context, index){
              final location = locations[index];
              return LocationWidgets(location: location,);
            } ,
            onPageChanged: (index) => setState(() {
              pageIndex = index;
            }),),
            ),
          Text(
            '${pageIndex + 1}/${locations.length}',
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 12,)
      ],
    );
  }
}