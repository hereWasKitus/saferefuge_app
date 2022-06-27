import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_repository/map_repository.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class OrganizationListView extends StatelessWidget {
  const OrganizationListView({Key? key, required this.pois, required this.currentPosition}) : super(key: key);

  final List<POI> pois;
  final Future<LatLng> currentPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: false,
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
        child: FutureBuilder(
          future: currentPosition,
          builder: (BuildContext context, AsyncSnapshot<LatLng> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: pois.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: OrganizationCard(
                    poi: pois[index],
                    currentPosition: snapshot.data!,
                  ),
                ),
              );
            } else {
              return const Center(
                child: SpinKitCircle(color: primaryColor),
              );
            }
          },
        ),
      ),
    );
  }
}

class OrganizationCard extends StatelessWidget {
  const OrganizationCard({Key? key, required this.poi, this.currentPosition}) : super(key: key);

  final POI poi;
  final LatLng? currentPosition;

  final TextStyle titleStyle = const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white);

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
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          const Text(
            'Address: ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              poi.address ?? "No address",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          )
        ],
      );

  Widget buildContactPersonRow() {
    return poi.contactPerson != null && poi.contactPerson!.isNotEmpty
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              const Text(
                'Contact person: ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  poi.contactPerson!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          )
        : const SizedBox.shrink();
  }

  Widget buildLanguagesRow() {
    return poi.languages != null && poi.languages!.isNotEmpty
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              const Text(
                'Languages we speak: ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  poi.languages!.join(', '),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          )
        : const SizedBox.shrink();
  }

  Widget buildContactRow() => Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (poi.phone != null && poi.phone!.isNotEmpty)
                URLButton(
                  url: 'tel:${poi.phone}',
                  icon: SvgPicture.asset(
                    'assets/icons/org-phone.svg',
                  ),
                ),
              if (poi.whatsapp != null && poi.whatsapp!.isNotEmpty)
                URLButton(
                  url: 'https://wa.me/${poi.whatsapp}',
                  icon: SvgPicture.asset(
                    'assets/icons/org-whatsapp.svg',
                  ),
                ),
              if (poi.url != null && poi.url!.isNotEmpty)
                URLButton(
                  url: poi.url!,
                  icon: SvgPicture.asset(
                    'assets/icons/org-website.svg',
                  ),
                ),
            ],
          )
        ],
      );

  Widget buildFooterRow() {
    double? distance =
        currentPosition != null ? calculateDistance(LatLng(poi.latitude, poi.longitude), currentPosition!) : null;
    return Row(
      children: [
        SvgPicture.asset('assets/icons/transport.svg'),
        const SizedBox(
          width: 8,
        ),
        if (distance != null)
          Text(
            '$distance km from you',
            style: const TextStyle(fontSize: 14, color: Colors.white70),
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
          buildContactPersonRow(),
          const SizedBox(
            height: 16,
          ),
          buildLanguagesRow(),
          const SizedBox(
            height: 12,
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

class URLButton extends StatelessWidget {
  const URLButton({Key? key, required this.icon, required this.url}) : super(key: key);

  final Widget icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      iconSize: 36,
      onPressed: () {
        try {
          _launchUrl(url);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Could not launch $url'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: red,
            ),
          );
        }
      },
      icon: icon,
    );
  }

  void _launchUrl(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}
