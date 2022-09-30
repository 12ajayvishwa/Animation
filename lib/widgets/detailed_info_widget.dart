import 'package:flutter/cupertino.dart';
import 'package:location_ui_hero_ani/data/hero_tag.dart';
import 'package:location_ui_hero_ani/model/location.dart';
import 'package:location_ui_hero_ani/widgets/stars_widgets.dart';

import 'hero_widget.dart';

class DetailedInfoWidget extends StatelessWidget {
  final Location location;
  const DetailedInfoWidget({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeroWidget(
            tag: HeroTag.addressLine1(location),
            child: Text(location.addressLine1!)),
          const SizedBox(height: 8,),
          HeroWidget(
            tag: HeroTag.addressLine2(location),
            child: Text(location.addressLine2!)),
          const SizedBox(height: 8,),
          HeroWidget(
            tag: HeroTag.stars(location),
            child: StarsWidget(stars: location.starRating!))
        ],
      ),);
  }
}