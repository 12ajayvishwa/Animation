import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_ui_hero_ani/page/detail_page.dart';
import 'package:location_ui_hero_ani/widgets/expanded_content_widget.dart';
import 'package:location_ui_hero_ani/widgets/image_widgets.dart';

import '../model/location.dart';

class LocationWidgets extends StatefulWidget {
  final Location location;
  const LocationWidgets({Key? key, required this.location}) : super(key: key);

  @override
  State<LocationWidgets> createState() => _LocationWidgetsState();
}

class _LocationWidgetsState extends State<LocationWidgets> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(alignment: Alignment.center, children: [
        AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            bottom: isExpanded ? 40 : 100,
            width: isExpanded ? size.width * 0.78 : size.width * 0.7,
            height: isExpanded ? size.height * 0.6 : size.height * 0.5,
            child: ExpandedContentWidget(location: widget.location)),
        AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            bottom: isExpanded ? 150 : 100,
            child: GestureDetector(
                onPanUpdate: onPanUpdate,
                onTap: openDetailPage,
                child: ImageWidget(location: widget.location)))
      ]),
    );
  }

  void openDetailPage() {
    if (!isExpanded) {
      setState(() {
        isExpanded = true;
      });
      return;
    }
    Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: const Duration(seconds: 1),
        reverseTransitionDuration: const Duration(seconds: 1),
        pageBuilder: (context, animation, secondaryAnimation) {
          final curvedAnimation =
              CurvedAnimation(parent: animation, curve: const Interval(0, 0.5));
          return FadeTransition(
              opacity: curvedAnimation,
              child:
                  DetailsPage(location: widget.location, animation: animation));
        }));
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }
}
