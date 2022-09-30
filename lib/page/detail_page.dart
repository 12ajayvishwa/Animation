import 'package:flutter/material.dart';
import 'package:location_ui_hero_ani/widgets/detailed_info_widget.dart';
import 'package:location_ui_hero_ani/widgets/lat_long_widget.dart';
import 'package:location_ui_hero_ani/widgets/reviews_widget.dart';
import '../data/hero_tag.dart';
import '../model/location.dart';
import '../widgets/hero_widget.dart';

class DetailsPage extends StatelessWidget {
  final Location location;
  final Animation animation;
  const DetailsPage({Key? key, required this.location, required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("INTEREST"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: Navigator.of(context).pop,
          ),
          const SizedBox(
            width: 10,
          )
        ],
        leading: const Icon(Icons.search_outlined),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
              child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox.expand(
                  child: HeroWidget(
                    tag: HeroTag.image(location.urlImage!),
                    child: Image.asset(
                                  location.urlImage!,
                                  fit: BoxFit.cover,
                                ),
                  )),
              Container(
                padding: const EdgeInsets.all(8),
                child: LatLongWidget(location: location),
              )
            ],
          )),
          DetailedInfoWidget(location: location),
          Expanded(
            flex: 5,
            child: ReviewsWidget(location: location, animation: animation))
        ],
      ),
    );
  }
}
