import 'package:flutter/material.dart';
import 'package:map_repository/map_repository.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class OrganizationCard extends StatelessWidget {
  const OrganizationCard({Key? key, required this.poi}) : super(key: key);

  final POI poi;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(71, 66, 221, 1),
        borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _OrganizationCardTitle(text: poi.name),
          const SizedBox(height: 16),
          _OrganizationCardCategories(categories: poi.categories),
          const SizedBox(height: 16),
          _OrganizationCardDescription(text: poi.description),
          const SizedBox(height: 16),
          _OrganizationCardAddress(text: poi.address),
          const SizedBox(height: 16),
          _OrganizationCardContactPerson(text: poi.contactPerson),
          const SizedBox(height: 16),
          _OrganizationCardLanguages(text: poi.languages.join(', ')),
          const SizedBox(height: 20),
          _OrganizationCardBottom(
            coordinates: [poi.latitude, poi.longitude],
            phone: poi.phone,
            website: poi.url,
            whatsapp: poi.whatsapp,
          ),
        ],
      ),
    );
  }
}

class _OrganizationCardBottom extends StatelessWidget {
  const _OrganizationCardBottom({
    Key? key,
    required this.coordinates,
    required this.phone,
    required this.whatsapp,
    required this.website,
  }) : super(key: key);

  final String phone;
  final String whatsapp;
  final String website;
  final List<double> coordinates;

  @override
  Widget build(BuildContext context) {
    return Row(
      // Contact info
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            MapsLauncher.launchCoordinates(coordinates[0], coordinates[1]);
          },
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.directions,
              color: Colors.white,
              size: 24,
            ),
          ),
          padding: const EdgeInsets.all(0),
        ),
        if (phone.isNotEmpty)
          _URLIconButton(
            url: 'tel:$phone',
            iconData: Icons.phone_rounded,
          ),
        if (whatsapp.isNotEmpty)
          _URLIconButton(
            url: 'https://wa.me/$whatsapp',
            iconData: Icons.whatsapp,
          ),
        if (website.isNotEmpty)
          _URLIconButton(
            url: website,
            iconData: Icons.public,
          ),
      ],
    );
  }
}

class _OrganizationCardCategories extends StatelessWidget {
  const _OrganizationCardCategories({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return const SizedBox.shrink();
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 32),
      child: ListView.separated(
        // Categories
        shrinkWrap: true,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) => Chip(
          label: Text(
            categories[index],
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          backgroundColor: const Color.fromRGBO(44, 83, 218, 0.8),
        ),
      ),
    );
  }
}

class _OrganizationCardLanguages extends StatelessWidget {
  const _OrganizationCardLanguages({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      // Languages
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        const Text(
          'Languages: ',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            text.isEmpty ? 'Not specified' : text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        )
      ],
    );
  }
}

class _OrganizationCardContactPerson extends StatelessWidget {
  const _OrganizationCardContactPerson({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      // Contact person
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
            text.isEmpty ? 'Not specified' : text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        )
      ],
    );
  }
}

class _OrganizationCardAddress extends StatelessWidget {
  const _OrganizationCardAddress({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      // Address
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
            text.isEmpty ? "No address" : text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        )
      ],
    );
  }
}

class _OrganizationCardDescription extends StatelessWidget {
  const _OrganizationCardDescription({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      // Description
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        const Text(
          'Description: ',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            text.isEmpty ? "No description" : text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        )
      ],
    );
  }
}

class _OrganizationCardTitle extends StatelessWidget {
  const _OrganizationCardTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      // Title
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
        ),
        const SizedBox(
          width: 8,
        ),
        if (text.isNotEmpty)
          Expanded(
            flex: 1,
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
            ),
          ),
      ],
    );
  }
}

class _URLIconButton extends StatelessWidget {
  const _URLIconButton({
    Key? key,
    required this.iconData,
    required this.url,
  }) : super(key: key);

  final IconData iconData;
  final String url;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
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
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          shape: BoxShape.circle,
        ),
        child: Icon(
          iconData,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  void _launchUrl(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}
