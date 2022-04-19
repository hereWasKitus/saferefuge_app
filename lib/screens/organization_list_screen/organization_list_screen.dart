import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:protect_ua_women/constants.dart';
import 'package:protect_ua_women/models/poi.model.dart';

class OrganizationListScreen extends StatelessWidget {
  const OrganizationListScreen(
      {Key? key, required this.pois, required this.currentPosition})
      : super(key: key);

  final List<POI> pois;
  final LatLng currentPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Points of interest',
          style: TextStyle(
            color: Color.fromRGBO(27, 50, 132, 1),
            fontWeight: FontWeight.w300,
            fontSize: 24,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Ink(
              width: 30,
              height: 30,
              decoration: const ShapeDecoration(
                color: Color.fromRGBO(27, 50, 132, 1),
                shape: CircleBorder(),
              ),
              child: IconButton(
                splashRadius: 15,
                iconSize: 10,
                onPressed: () => AutoRouter.of(context).pop(),
                icon: const Icon(
                  Icons.close_rounded,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: ListView.builder(
          itemCount: pois.length,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: OrganizationCard(
              poi: pois[index],
              currentPosition: currentPosition,
            ),
          ),
        ),
      ),
    );
  }
}

class OrganizationCard extends StatelessWidget {
  const OrganizationCard(
      {Key? key, required this.poi, required this.currentPosition})
      : super(key: key);

  final POI poi;
  final LatLng currentPosition;

  final TextStyle titleStyle = const TextStyle(
      fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white);

  double calculateDistance(LatLng from, LatLng to) {
    var res = Geolocator.distanceBetween(
          from.latitude,
          from.longitude,
          to.latitude,
          to.longitude,
        ) /
        1000;
    num mod = pow(10.0, 2);
    return ((res * mod).round().toDouble() / mod);
  }

  Widget buildTitleRow() => Row(
        children: [
          const CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
          ),
          const SizedBox(
            width: 8,
          ),
          if (poi.name.isNotEmpty)
            Expanded(
              flex: 1,
              child: Text(
                poi.name,
                style: titleStyle,
              ),
            ),
        ],
      );

  Widget buildAddressRow() => Row(
        children: [
          const Text(
            'Address: ',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Text(
            poi.address ?? "No address",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          )
        ],
      );

  Widget buildContactRow() => Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                padding: const EdgeInsets.all(0),
                constraints: const BoxConstraints(),
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/org-phone.svg',
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              IconButton(
                padding: const EdgeInsets.all(0),
                constraints: const BoxConstraints(),
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/org-website.svg',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          )
        ],
      );

  Widget buildFooterRow() {
    double distance = calculateDistance(poi.latLng, currentPosition);
    return Row(
      children: [
        SvgPicture.asset('assets/icons/transport.svg'),
        const SizedBox(
          width: 8,
        ),
        Text(
          '$distance km from you',
          style: const TextStyle(fontSize: 12, color: Colors.white70),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(71, 66, 221, 1),
        borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitleRow(),
          const SizedBox(
            height: 8,
          ),
          buildAddressRow(),
          const SizedBox(
            height: 16,
          ),
          buildContactRow(),
          const SizedBox(
            height: 12,
          ),
          buildFooterRow(),
        ],
      ),
    );
  }
}
